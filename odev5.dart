import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sayfa1(),
    title: 'Ödev 5',
  ));
}

class Sayfa1 extends StatefulWidget {
  const Sayfa1({super.key});

  @override
  State<Sayfa1> createState() => Sayfa1State();
}

class Sayfa1State extends State<Sayfa1> {
  TextEditingController _adsoyadController = TextEditingController();
  String? _selectedGender;
  bool _isAdult = false;
  bool _smokes = false;
  double _sigaraPerDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text(
          "KİŞİLİK ANKETİ",
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
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
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
              title: Text(
                'Sigara kullanıyor musunuz? ',
                style: TextStyle(color: Colors.black),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: Colors.pink[50],
              value: _smokes,
              onChanged: (_newValue) {
                setState(() {
                  _smokes = _newValue;
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

            OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sayfa2(
                    adSoyad: _adsoyadController.text,
                    cinsiyet: _selectedGender,
                    isAdult: _isAdult,
                    smokes: _smokes,
                    sigaraPerDay: _sigaraPerDay,
                  ),
                ),
              ),
              child: Text('Bilgileri gönder'),
            ),
          ],
        ),
      ),
    );
  }
}




class Sayfa2 extends StatelessWidget {
  final String adSoyad;
  final String? cinsiyet;
  final bool isAdult;
  final bool smokes;
  final double sigaraPerDay;

  Sayfa2({
    required this.adSoyad,
    required this.cinsiyet,
    required this.isAdult,
    required this.smokes,
    required this.sigaraPerDay,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("BİLGİLER",
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ad Soyad: $adSoyad',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Cinsiyet: $cinsiyet',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Reşit mi: ${isAdult ? "Evet" : "Hayır"}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Sigara kullanıyor mu: ${smokes ? "Evet" : "Hayır"}',
                  style: TextStyle(fontSize: 20),
                ),
                if (smokes)
                  Text(
                    'Günlük sigara sayısı: ${sigaraPerDay.round()}',
                    style: TextStyle(fontSize: 20),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
