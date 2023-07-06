import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

  class kullaniciCikis extends StatelessWidget {
    kullaniciCikis({super.key});

  final kullanici = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Text(
            "Olarak Giris Yaptı: " + kullanici.email!,
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}