import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';     
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../login/bootcamp_login_page.dart';

class BootcampHomePage extends StatefulWidget {
  final String id;

  const BootcampHomePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<BootcampHomePage> createState() => _BootcampHomePageState();
}

class _BootcampHomePageState extends State<BootcampHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bootcamp Home'),
        actions: [
          ElevatedButton(
            onPressed: () async{
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut().then((value)=>Navigator.pop(context, BootcampLoginPage()));
                //await GoogleSignIn().signOut();
            },
            child: const Text(
              'Logout',
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome user with\nid ${widget.id}!',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
