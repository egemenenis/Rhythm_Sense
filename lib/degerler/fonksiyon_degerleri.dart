import 'package:rhythm_sense/degerler/fonksiyon.tanimlamalari.dart';

class TiklanincaAcilanEkran {
  String baslik;
  String imageUrl;
  String hangiBolge;
  String neIseYarar;
  List<Spor> spor;
  List<Spor> sporBir;

  TiklanincaAcilanEkran({
    required this.imageUrl,
    required this.hangiBolge,
    required this.neIseYarar,
    required this.baslik,
    required this.spor,
    required this.sporBir,
  });
}

List<Spor> sporBir = [
  Spor(
    imageUrl: 'assets/oneri_fotograflari/cerez.jpg',
    name: '1. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 2,
    kcal: 30,
  ),
  Spor(
    imageUrl: 'assets/images/karın.jpg',
    name: '1. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 2,
    kcal: 30,
  ),
  Spor(
    imageUrl: 'assets/images/kalça.jpg',
    name: '1. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 2,
    kcal: 30,
  ),
  Spor(
    imageUrl: 'assets/images/sırt.jpg',
    name: '1. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 2,
    kcal: 30,
  ),
  Spor(
    imageUrl: 'assets/images/bacak.jpg',
    name: '1. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 2,
    kcal: 30,
  ),
];

List<Spor> spor = [
  Spor(
    imageUrl: 'assets/images/bacak.jpg',
    name: '1. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 1,
    kcal: 30,
  ),
  Spor(
    imageUrl: 'assets/images/sırt.jpg',
    name: '2. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 2,
    kcal: 500,
  ),
  Spor(
    imageUrl: 'assets/images/kol.jpg',
    name: '3. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 3,
    kcal: 125,
  ),
  Spor(
    imageUrl: 'assets/images/kalça.jpg',
    name: '4. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 4,
    kcal: 125,
  ),
  Spor(
    imageUrl: 'assets/images/karın.jpg',
    name: '5. hareket',
    type: 'Başlangıç-----Profesyonel',
    startTimes: ['30 sn', '60 sn'],
    etki: 5,
    kcal: 125,
  ),
];

List<TiklanincaAcilanEkran> kartAciklamalari = [
  TiklanincaAcilanEkran(
      baslik: 'Bacak Hareketleri',
      imageUrl: 'assets/images/bacak.png',
      hangiBolge: 'Bacak',
      neIseYarar:
          'Bacak kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Karın Hareketleri',
      imageUrl: 'assets/images/karın.png',
      hangiBolge: 'Karın',
      neIseYarar:
          'Karın kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Kol Hareketleri',
      imageUrl: 'assets/images/kol.png',
      hangiBolge: 'Kol',
      neIseYarar:
          'Kol kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Sırt Hareketleri',
      imageUrl: 'assets/images/sırt.png',
      hangiBolge: 'Sırt',
      neIseYarar:
          'Sırt kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Omuz Hareketleri',
      imageUrl: 'assets/images/omuz.png',
      hangiBolge: 'Omuz',
      neIseYarar:
          'Omuz kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: [])
];

List<TiklanincaAcilanEkran> kartAciklamalari2 = [
  TiklanincaAcilanEkran(
      baslik: 'Bacak',
      imageUrl: 'assets/images/kol.png',
      hangiBolge: 'Bacak',
      neIseYarar:
      'Bacak kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Karın',
      imageUrl: 'assets/images/kol.png',
      hangiBolge: 'Karın',
      neIseYarar:
      'Karın kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Kol',
      imageUrl: 'assets/images/kol.png',
      hangiBolge: 'Kol',
      neIseYarar:
      'Kol kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Sırt',
      imageUrl: 'assets/images/kol.png',
      hangiBolge: 'Sırt',
      neIseYarar:
      'Sırt kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: []),
  TiklanincaAcilanEkran(
      baslik: 'Omuz',
      imageUrl: 'assets/images/omuz.png',
      hangiBolge: 'Omuz',
      neIseYarar:
      'Omuz kaslarınızı geliştirmek için bu hareketleri uygulayınız.',
      spor: spor, sporBir: [])
];

