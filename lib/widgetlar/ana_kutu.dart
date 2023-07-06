import 'package:rhythm_sense/degerler/fonksiyon_degerleri.dart';
import 'package:rhythm_sense/ekranlar/tiklaninca_acilan_ekran.dart';
import 'package:flutter/material.dart';

class AnaKutu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kartAciklamalari.length,
        itemBuilder: (BuildContext context, int index) {
          TiklanincaAcilanEkran aciklama = kartAciklamalari[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => YedekEkran(
                  spor_karti: aciklama,
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              width: 180.0, // Küçültülen genişlik değeri
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                    child: Image(
                      height: 185.0,
                      width: double.infinity,
                      image: AssetImage(aciklama.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          aciklama.baslik,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          aciklama.neIseYarar,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
