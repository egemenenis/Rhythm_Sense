import 'dart:async';
import 'package:rhythm_sense/degerler/fonksiyon.tanimlamalari.dart';
import 'package:rhythm_sense/degerler/fonksiyon_degerleri.dart';
import 'package:flutter/material.dart';


class YedekEkran extends StatefulWidget {
  final TiklanincaAcilanEkran spor_karti;

  YedekEkran({required this.spor_karti});

  @override
  _YedekEkranState createState() => _YedekEkranState();
}

class _YedekEkranState extends State<YedekEkran> {
  int sayac = 0;
  bool isPaused = false;
  late Timer _timer;
  int selectedMinutes = 0;
  int selectedSeconds = 0;
  bool isTimerStarted = false;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    if (selectedMinutes <= 0 && selectedSeconds <= 0) return;
    int totalSeconds = selectedMinutes * 60 + selectedSeconds;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (!isPaused) {
        setState(() {
          if (totalSeconds > 0) {
            totalSeconds--;
            sayac++;
          } else {
            // Süre doldu, bildirim göster
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Süre Doldu"),
                  content: Text("Seçilen süre doldu!"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Tamam"),
                    ),
                  ],
                );
              },
            );
            // Sayacı durdur
            _timer.cancel();
          }
        });
      }
    });
  }

  void resetCounter() {
    setState(() {
      sayac = 0;
      isTimerStarted = false;
    });
  }

  void togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  Text _buildGuceEtkisi(int etkisi) {
    String etki = '';
    for (int i = 0; i < etkisi; i++) {
      etki += '☑  ';
    }
    etki.trim();
    return Text(etki);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetCounter,
          ),
          IconButton(
            icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
            onPressed: togglePause,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green[400]!,
                  Colors.green[200]!,
                  Colors.blue[600]!,
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                child: Text(
                  widget.spor_karti.hangiBolge,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Sayaç: $sayac',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<int>(
                    value: selectedMinutes,
                    onChanged: (value) {
                      setState(() {
                        selectedMinutes = value!;
                      });
                    },
                    items: List.generate(60, (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Text('$index dk'),
                      );
                    }),
                  ),
                  SizedBox(width: 16.0),
                  DropdownButton<int>(
                    value: selectedSeconds,
                    onChanged: (value) {
                      setState(() {
                        selectedSeconds = value!;
                      });
                    },
                    items: List.generate(60, (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Text('$index sn'),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () {
                  if (!isTimerStarted) {
                    isTimerStarted = true;
                    startTimer();
                  }
                },
                icon: Icon(Icons.play_arrow),
                label: Text('Başlat'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: widget.spor_karti.spor.length,
                  itemBuilder: (BuildContext context, int index) {
                    Spor spor = widget.spor_karti.spor[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 35.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Container(
                                    width: 300,
                                    height: 300,
                                    child: Image(
                                      image: AssetImage(spor.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage(spor.imageUrl),
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          spor.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            Text(
                              spor.type,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5.0),
                            _buildGuceEtkisi(spor.etki),
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${spor.kcal} kcal',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    spor.startTimes[0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.0),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    spor.startTimes[1],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
