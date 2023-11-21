import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Beranda'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selamat Datang di Sistem Informasi Akademik",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset("asset/images/studying.png"),
                SizedBox(
                  height: 20,
                ),
                
              ],
            )));
  }
}
