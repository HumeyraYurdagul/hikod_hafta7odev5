import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ödev 3 projem',
        home: SafeArea(
          child: Scaffold(
              backgroundColor: Color.fromARGB(255, 189, 245, 242),
              appBar: AppBar(
                backgroundColor: Colors.indigo[700],
                title: Text("Hi-Kod"),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                ),
                centerTitle: true,

                leading: Icon(
                    Icons.menu,
                    size: 40.0,
                    color: Color.fromARGB(255, 189, 245, 242),
                ),

                actions: [
                  IconButton(onPressed: () {
                    print("İnsan ikonuna tıklandı!");
                    },
                      color: Color.fromARGB(255, 189, 245, 242),
                      iconSize: 40.0,
                      icon: Icon(Icons.person)
                  )
                ],
              ),


              body: Center(
                child: Container(
                  height: 100,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Center(
                      child: Text(
                        'Hello World',
                        style: TextStyle(
                            color: Color.fromARGB(255, 189, 245, 242),
                            fontSize: 30,
                            fontWeight: FontWeight.w900
                        ),
                      )),
                ),
          )),
        ));
  }
}

