import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rhythm_sense/giris/bilesenler/buton_ayarlari.dart';
import 'package:rhythm_sense/giris/bilesenler/textfield_ayarlari.dart';
import 'package:rhythm_sense/giris/bilesenler/cerceve_ayarlari.dart';
import '../servisler/baglanti_servis.dart';

class LoginSayfasi extends StatefulWidget {
  LoginSayfasi({super.key, required void Function() onTap});

  @override
  State<LoginSayfasi> createState() => _LoginSayfasiState();
}

class _LoginSayfasiState extends State<LoginSayfasi> {

  final emailKontrol = TextEditingController();
  final sifreKontrol = TextEditingController();

  void signUserIn() async {

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );


    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailKontrol.text,
        password: sifreKontrol.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {

        wrongEmailMessage();
      }

      else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              'Hatalı Giriş Yaptınız!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
                'Hatalı Giriş Yaptınız!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              const Icon(
                Icons.key,
                size: 100,
                color: Colors.red,
              ),

              const SizedBox(height: 50),

              Text(
                'Hoşgeldiniz! Lütfen Giriş Yapınız',
                style: TextStyle(
                  color: Colors.grey[850],
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: emailKontrol,
                hintText: 'E-posta adresi',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              MyTextField(
                controller: sifreKontrol,
                hintText: 'Şifre',
                obscureText: true,
              ),

              const SizedBox(height: 30),

              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'VEYA AŞAĞIDAKİ SEÇENEKLERİ KULLANIN',
                        style: TextStyle(color: Colors.grey[850]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SquareTile(
                      onTap:() => AuthService().signInWithGoogle(),
                    imagePath: 'assets/google.png',
                      ),

                  SizedBox(width: 25),


                  SquareTile(
                      onTap: (){},
                      imagePath: 'assets/apple.png')
                ],
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}