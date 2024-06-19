import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _adsoyadController = TextEditingController();
  String? _selectedGender;
  bool _isAdult = false;
  bool _smokes = false;
  double _sigaraPerDay = 0;
  bool _showInfo = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ödev 4',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white54,
          appBar: AppBar(
            backgroundColor: Colors.pink[200],
            title: Text("KİŞİLİK ANKETİ",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
          ),

          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                TextField(
                  controller: _adsoyadController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    ),
                    labelText: 'Adınız ve Soyadınız',
                    hintText: 'Lütfen ad soyad giriniz',
                  ),
                ),

                SizedBox(height: 25),

                DropdownButton<String>(
                  hint: Text('Cinsiyetinizi Seçiniz'),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  dropdownColor: Colors.white,
                  value: _selectedGender,
                  items: <String>['Kadın', 'Erkek', 'Diğer'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                ),

                SizedBox(height: 25),

                CheckboxListTile(
                  title: Text('Reşit misiniz?'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.pink[50],
                  value: _isAdult,
                  onChanged: (_checked) {
                    setState(() {
                      _isAdult = _checked!;
                    });
                  },
                ),

                SizedBox(height: 25),

                SwitchListTile(
                  title: Text('Sigara kullanıyor musunuz? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.pink[50],
                  value: _smokes,
                  onChanged: (_newValue) {
                    setState(() {
                      _smokes = _newValue!;
                    });
                  },
                ),
                if (_smokes)
                  Column(
                    children: [
                      SizedBox(height: 25),
                      Text('Günde kaç tane sigara kullanıyorsunuz?'),
                      Slider(
                        value: _sigaraPerDay,
                        min: 0,
                        max: 20,
                        divisions: 20,
                        label: _sigaraPerDay.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _sigaraPerDay = value;
                          });
                        },
                      ),
                    ],
                  ),

                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showInfo = true;
                    });
                  },
                  child: Text('Bilgileri gönder'),
                ),
                if (_showInfo)
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ad Soyad: ${_adsoyadController.text}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Cinsiyet: $_selectedGender',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Reşit mi: $_isAdult',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Sigara kullanıyor mu: $_smokes',
                          style: TextStyle(fontSize: 16),
                        ),
                        if (_smokes)
                          Text(
                            'Günlük sigara sayısı: ${_sigaraPerDay.round()}',
                            style: TextStyle(fontSize: 16),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
