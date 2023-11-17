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
              children: [
                // Image.asset("asset/images/studying.png"),
              ],
            )));
  }
}
