import 'package:rhythm_sense/sayfa_kodlari.dart';
import 'package:rhythm_sense/widgetlar/ana_kutu.dart';
import 'package:rhythm_sense/widgetlar/egzersiz_merkezi.dart';
import 'package:rhythm_sense/widgetlar/oneri_merkezi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _currentIndex = 0;
  final kullanici = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: Text('Ana Sayfa'),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
        leading: Container(), // Geri dönme düğmesini gizlemek için
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            EgzersizMerkezi(),
            SizedBox(height: 25.0),
            AnaKutu(),
            SizedBox(height: 20.0),
            OneriMerkezi(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AramaSayfasi()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatSayfasi()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UcuncuSayfa()),
            );
          }
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.blur_on,
              size: 32.0,
            ),
            label: 'Ana Sayfa',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate_outlined,
              size: 32.0,
            ),
            label: 'VKE',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mark_unread_chat_alt_outlined,
              size: 32.0,
            ),
            label: 'Bana Sor',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_location_outlined,
              size: 32.0,
            ),
            label: 'İletişim',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
