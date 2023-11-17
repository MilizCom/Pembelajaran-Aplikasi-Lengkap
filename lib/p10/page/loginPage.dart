import 'package:flutter/material.dart';
import 'package:pembelajaran_full/p10/page/registeter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool login = true;
  void togglePsswordVisibility() {
    setState(() {
      login = !login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "asset/images/baground_register.png",
            width: 279,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 43,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 146,
                ),
                Center(
                  child: Text("Selamat Datang \n Kembali",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      )),
                ),
                Image.asset(
                  "asset/images/studying.png",
                  width: 310,
                ),
                SizedBox(
                  height: 41,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29)),
                      labelText: "Alamat Email",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Poppins')),
                ),
                SizedBox(
                  height: 26,
                ),
                TextField(
                  obscureText: login,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(login
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          togglePsswordVisibility();
                        },
                      ),
                      contentPadding: EdgeInsets.all(14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29)),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Poppins')),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Lupa Password",
                  style: TextStyle(
                      color: Color(0xff672CBC),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 42,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff672CBC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29)),
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum Punya Akun? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage())),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            color: Color(0xff672CBC),
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 81)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
