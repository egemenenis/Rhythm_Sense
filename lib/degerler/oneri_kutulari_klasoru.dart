class OneriKutulari {
  String imageUrl;
  String name;
  String ort;
  var miktar;

  OneriKutulari({
    required this.imageUrl,
    required this.name,
    required this.ort,
    this.miktar,
  });
}

final List<OneriKutulari> oneriKartlari = [
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/su.jpg',
    name: 'Su',
    ort: 'Ortalama',
    miktar: "2 Litre",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/et.jpeg',
    name: 'Et',
    ort: 'Ortalama',
    miktar: "375 gr",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/süt.jpg',
    name: 'Süt',
    ort: 'Ortalama',
    miktar: "0.5 Litre",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/enginar.jpg',
    name: 'Enginar',
    ort: 'Ortalama',
    miktar: "150 gr",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/f_ezmesi.png',
    name: 'F. Ezmesi',
    ort: 'Ortalama',
    miktar: "50 gr",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/cerez.jpg',
    name: 'Çerez',
    ort: 'Ortalama',
    miktar: "100 gr",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/lahana.jpg',
    name: 'Lahana',
    ort: 'Ortalama',
    miktar: "25 gr",
  ),
  OneriKutulari(
    imageUrl: 'assets/oneri_fotograflari/ispanak.jpg',
    name: 'Ispanak',
    ort: 'Ortalama',
    miktar: "50 gr",
  ),
];
