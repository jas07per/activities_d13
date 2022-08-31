import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home/bootcamp_home_page.dart';

class BootcampLoginPage extends StatefulWidget {
  const BootcampLoginPage({Key? key}) : super(key: key);

  @override
  State<BootcampLoginPage> createState() => _BootcampLoginPageState();
}

class _BootcampLoginPageState extends State<BootcampLoginPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootcamp Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bootcamp',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                if (userCredential.user?.uid != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BootcampHomePage(
                      id: userCredential.user!.uid,
                    ),
                  ));
                }
              },
              child: const Text('Sign In Anonymously'),
            ),
            const SizedBox(height: 8),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                try {
                  // Trigger the Google Authentication flow.
                  final GoogleSignInAccount? googleUser =
                      await GoogleSignIn().signIn();

                  // Obtain the auth details from the request.
                  final GoogleSignInAuthentication? googleAuth =
                      await googleUser?.authentication;
                  if (googleAuth == null) {
                    return;
                  }
                  // Create a new credential.

                  final OAuthCredential googleCredential =
                      GoogleAuthProvider.credential(
                    accessToken: googleAuth!.accessToken,
                    idToken: googleAuth.idToken,
                  );
                  // Sign in to Firebase with the Google [UserCredential].
                  final UserCredential googleUserCredential = await FirebaseAuth
                      .instance
                      .signInWithCredential(googleCredential);

                  if (googleUserCredential.user?.uid != null) {
                    final users =
                        FirebaseFirestore.instance.collection('users');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BootcampHomePage(
                        id: googleUserCredential.user!.uid,
                      ),
                    ));
                    // users.add({
                    //   'id': googleUserCredential.user!.uid,
                    //   'display_name': googleUserCredential.user!.displayName,
                    //   'email': googleUserCredential.user!.email,
                    // });

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (_) => BootcampHomePage(
                    //     id: googleUserCredential.user!.uid,
                    //   ),
                    // ));
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            const SizedBox(height: 8),
            SignInButton(
              Buttons.FacebookNew,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            SignInButton(
              Buttons.Twitter,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
