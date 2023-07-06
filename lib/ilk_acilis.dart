import 'package:rhythm_sense/giris/baglanti_sayfasi_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ilkAcilis extends StatefulWidget {
  const ilkAcilis({Key? key}) : super(key: key);

  @override
  _ilkAcilisState createState() => _ilkAcilisState();
}

class _ilkAcilisState extends State<ilkAcilis> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => const dogrulamaSayfasi()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/logo.png'),
              width: 275,
            ),
            Text(
              'PURE PULSE',
              style: TextStyle(
                fontFamily: 'Bebas',

                color: Color.fromRGBO(28, 82, 126, 1),
                fontSize: 45,
              ),
            ),
            Text(
              'Sağlıklı Yaşam İçin Kişisel Asistanınız',
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Color.fromRGBO(28, 82, 126, 1),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitFadingCircle(
              color: Color.fromRGBO(28, 82, 126, 1),
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
