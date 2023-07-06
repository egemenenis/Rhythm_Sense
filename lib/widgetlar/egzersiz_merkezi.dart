import 'package:rhythm_sense/degerler/egzersiz_resimleri.dart';
import 'package:flutter/material.dart';

class EgzersizMerkezi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          child: Text(
            'Spor Öncesi Egzersizler',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueGrey[800],
              fontFamily: 'Bebas',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 150.0,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: egzersizKartlari.length,
            itemBuilder: (BuildContext context, int index) {
              EgzersizResimleri egzersizResimleri = egzersizKartlari[index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                width: 150.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    height: 150.0,
                    width: 150.0,
                    image: AssetImage(egzersizResimleri.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class EgzersizMerkezi2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 10.0),
          child: Text(
            'Egzersizler İçin Motivasyon',
            style: TextStyle(
              fontSize: 36.0,
              color: Colors.white,
              fontFamily: 'Bebas',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: egzersizKartlari2.length,
            itemBuilder: (BuildContext context, int index) {
              EgzersizResimleri egzersizResimleri = egzersizKartlari2[index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                width: 150.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 10.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    height: 150.0,
                    width: 200.0,
                    image: AssetImage(egzersizResimleri.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
