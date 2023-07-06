import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rhythm_sense/ekranlar/acilis_ekrani.dart';
import 'package:rhythm_sense/giris/login_ekrani.dart';


class dogrulamaSayfasi extends StatelessWidget {
  const dogrulamaSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AnaSayfa();
          }

          else {
            return LoginSayfasi(onTap: () {  },);
          }
        },
      ),
    );
  }
}