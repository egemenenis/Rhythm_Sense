import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:rhythm_sense/chatBot.dart';


class AramaSayfasi extends StatefulWidget {
  @override
  _AramaSayfasiState createState() => _AramaSayfasiState();
}

class _AramaSayfasiState extends State<AramaSayfasi> {
  double kilo = 0.0;
  double boy = 0.0;
  int yas = 0;
  double vki = 0.0;
  TextEditingController kiloController = TextEditingController();
  TextEditingController boyController = TextEditingController();
  TextEditingController yasController = TextEditingController();
  TextEditingController isimController = TextEditingController();

  bool _isLoading = false;
  String _beslenmeProgrami = '';
  double _savedVucutKitleEndeksi = 0.0;
  List<Map<String, dynamic>> _kaydedilenVKIler = [];

  Future<void> _hesaplaVucutKitleEndeksi() async {
    setState(() {
      kilo = double.tryParse(kiloController.text) ?? 0;
      boy = double.tryParse(boyController.text) ?? 0;
      yas = int.tryParse(yasController.text) ?? 0;
      vki = kilo / ((boy / 100) * (boy / 100));

      if (boy > 0 && kilo > 0 && yas > 0) {
        if (vki < 18.5) {
          _beslenmeProgrami = 'Zayıf: Daha fazla kalori almanız önerilir.';
        } else if (vki >= 18.5 && vki < 25) {
          _beslenmeProgrami = 'Normal: Dengeli bir beslenme önerilir.';
        } else if (vki >= 25 && vki < 30) {
          _beslenmeProgrami = 'Fazla kilolu: Düşük kalorili bir diyet önerilir.';
        } else {
          _beslenmeProgrami = 'Obez: Diyetisyen desteği almanız önerilir.';
        }
      } else {
        _beslenmeProgrami = '';
      }
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('vki', vki);
  }

  Future<void> _kaydet() async {
    setState(() {
      _savedVucutKitleEndeksi = vki;
      String isim = isimController.text;
      _kaydedilenVKIler.add({'isim': isim, 'vki': vki});
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('kaydedilenVKIler', _kaydedilenVKIler.map((item) => item.toString()).toList());
  }

  Future<void> _sil(int index) async {
    setState(() {
      _kaydedilenVKIler.removeAt(index);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('kaydedilenVKIler', _kaydedilenVKIler.map((item) => item.toString()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Vücut Kitle Endeksi Hesaplayıcı'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4CAF50),
                  Color(0xFF2196F3),
                ],
              ),
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Image.network(
                'https://iasbh.tmgrup.com.tr/faf4ec/1200/627/0/104/724/483?u=https://isbh.tmgrup.com.tr/sbh/2020/12/28/vki-hesaplama-vucut-kitle-indeksi-hesaplama-nasil-yapilir-s1-1609149579666.jpg',
                width: 300,
                height: 200,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: kiloController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Kilo (kg)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: boyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Boy (cm)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: yasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Yaş',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: isimController,
                decoration: InputDecoration(
                  labelText: 'İsim',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _hesaplaVucutKitleEndeksi();
                },
                child: Text('VKİ Hesapla'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Vücut Kitle Endeksi: $vki',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Güncel Durum - $_beslenmeProgrami',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text('Kaydedilen Vücut Kitle Endeksleri:'),
              SizedBox(height: 3.0),
              if (_kaydedilenVKIler.isNotEmpty)
                Column(
                  children: List.generate(
                    _kaydedilenVKIler.length,
                        (index) => ListTile(
                      title: Text('İsim: ${_kaydedilenVKIler[index]['isim']}'),
                      subtitle: Text('VKI: ${_kaydedilenVKIler[index]['vki']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _sil(index);
                        },
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _kaydet();
                    },
                    child: Text('Kaydet'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        kiloController.clear();
                        boyController.clear();
                        yasController.clear();
                        isimController.clear();
                        _beslenmeProgrami = '';
                        _savedVucutKitleEndeksi = 0.0;
                        _kaydedilenVKIler.clear();
                      });
                    },
                    child: Text('Sıfırla'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bize Ulaşın',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UcuncuSayfa(),
    );
  }
}

class UcuncuSayfa extends StatefulWidget {
  @override
  _UcuncuSayfaState createState() => _UcuncuSayfaState();
}

class _UcuncuSayfaState extends State<UcuncuSayfa> {
  final List<Bilgi> bilgiler = [
    Bilgi(
      baslik: 'Sporun Faydaları',
      icerik: 'Spor yapmanın birçok faydası vardır. Düzenli spor yapmak fiziksel ve zihinsel sağlığı iyileştirir, enerji seviyesini yükseltir ve stresi azaltır.',
      fotoUrl: 'https://healthyhenrycounty.org/wp-content/uploads/2020/08/healthy-lifestyle-1-1024x585.png',
    ),
    Bilgi(
      baslik: 'Doğru Beslenme',
      icerik: 'Sağlıklı bir yaşam için doğru beslenme büyük önem taşır. Dengeli bir diyetle vücudun ihtiyaç duyduğu vitamin, mineral ve diğer besin öğelerini alabiliriz.',
      fotoUrl: 'https://www.summahealth.org/-/media/project/summahealth/website/page-content/flourish/fb_hearthealth_940x788.webp',
    ),
    Bilgi(
      baslik: 'Sporun Motivasyonu',
      icerik: 'Spor yaparken motivasyonunuzu yüksek tutmak önemlidir. Kendinize hedefler belirleyin, ilham verici alıntılar okuyun ve spor yapmaktan keyif aldığınız aktiviteleri seçin.',
      fotoUrl: 'https://healthiersteps.com/wp-content/uploads/2022/02/healthierlifesyle.jpg',
    ),
  ];

  late Timer timer;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void startTimer() {
    const duration = Duration(seconds: 4);

    timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % bilgiler.length;
      });
    });
  }

  void sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'rektorluk@gelisim.edu.tr',
    );

    // ignore: deprecated_member_use
    if (await canLaunch(emailLaunchUri.toString())) {
      // ignore: deprecated_member_use
      await launch(emailLaunchUri.toString());
    } else {
      throw 'E-posta gönderilemedi';
    }
  }

  void makePhoneCall() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: '+902124227000',
    );

    // ignore: deprecated_member_use
    if (await canLaunch(phoneLaunchUri.toString())) {
      // ignore: deprecated_member_use
      await launch(phoneLaunchUri.toString());
    } else {
      throw 'Telefon araması başlatılamadı';
    }
  }

  void openMap() async {
    final Uri mapLaunchUri = Uri(
      scheme: 'https',
      host: 'www.google.com/maps',
      queryParameters: {
        'q': 'Cihangir Mah. Şehit Jandarma Komando Er Hakan Öner Sk. No:1 Avcılar/İstanbul',
      },
    );

    // ignore: deprecated_member_use
    if (await canLaunch(mapLaunchUri.toString())) {
      // ignore: deprecated_member_use
      await launch(mapLaunchUri.toString());
    } else {
      throw 'Harita açılamadı';
    }
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
        title: Text('Bize Ulaşın'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Spor Hakkında Önemli Bilgiler',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      bilgiler[currentIndex].fotoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 125.0,
                    left: 16.0,
                    right: 16.0,
                    child: AnimatedOpacity(
                      opacity: 0.8,
                      duration: Duration(milliseconds: 5000),
                      child: BilgiKarti(bilgi: bilgiler[currentIndex]),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('E-posta'),
              subtitle: Text('rektorluk@gelisim.edu.tr'),
              onTap: sendEmail,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telefon'),
              subtitle: Text('0212 422 70 00'),
              onTap: makePhoneCall,
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Adres'),
              subtitle: Text('Cihangir Mah. Şehit Jandarma Komando Er Hakan Öner Sk. No:1 Avcılar/İstanbul'),
              onTap: openMap,
            ),
          ],
        ),
      ),
    );
  }
}

class Bilgi {
  final String baslik;
  final String icerik;
  final String fotoUrl;

  Bilgi({required this.baslik, required this.icerik, required this.fotoUrl});
}

class BilgiKarti extends StatelessWidget {
  final Bilgi bilgi;

  const BilgiKarti({required this.bilgi});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.add_chart,
          size: 40.0,
        ),
        title: Text(
          bilgi.baslik,
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          bilgi.icerik,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}










class ChatSayfasi extends StatefulWidget {
  const ChatSayfasi({Key? key}) : super(key: key);

  @override
  _ChatSayfasiState createState() => _ChatSayfasiState();
}

class _ChatSayfasiState extends State<ChatSayfasi> {
  late  DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Düşün Zekai'),
       // primarySwatch: Colors.blue,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF4CAF50),
                Color(0xFF2196F3)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration( image: DecorationImage(
            image: AssetImage('assets/ai_background.png'),
            fit: BoxFit.fitWidth,

            opacity: 0.9),

        ),
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2196F3),
                    Color(0xFF4CAF50)
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Lütfen sorunuzu buraya yazın...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cera Pro',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send_rounded),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      // print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }


  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}