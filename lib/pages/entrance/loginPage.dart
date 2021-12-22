import 'dart:ui';
import 'package:dalimansys_app/pages/entrance/forgetPasswordPage.dart';
import 'package:dalimansys_app/pages/entrance/signInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var emailTffController = TextEditingController();
  var passTffController = TextEditingController();
  Color buttonColor = Colors.white54;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1597D8),
              Color(0xFF134AE5),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //LOGO
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, bottom: 18),
                      child: SvgPicture.asset(
                        "assets/images/invosys_buysys_login.svg",
                        width: 213,
                        height: 36,
                      ),
                    ),
                  ),
                  //YAZI
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Container(
                        height: 135,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Faturalarınız ve satın\nalma talepleriniz ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: "artık\ntek bir yerde.",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //EPOSTA ALANI
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      top: 36,
                      right: 24,
                    ),
                    child: TextFormField(
                        controller: emailTffController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.yellow,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          filled: true,
                          fillColor: Colors.white30,
                          hintText: "kullaniciadi@dalimansys.com",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Colors.grey[700],
                          ),
                          labelText: "E-posta adresiniz",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (input) {
                          if (input.isEmpty) {
                            return "E-posta alanı boş bırakılamaz";
                          }
                          if (!input.contains("@")) {
                            return "Girilen değer e-posta formatına uygun değil.";
                          }
                          return null;
                        }),
                  ),
                  //ŞİFRE ALANI
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24,
                      top: 48,
                    ),
                    child: TextFormField(
                      controller: passTffController,
                      cursorColor: Colors.white,
                      obscureText: true,
                      obscuringCharacter: "*",
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Colors.white30,
                        hintText: "*************",
                        hintStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                        labelText: "Parolanız",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Şifre alanı boş bırakılamaz";
                        }
                        if (input.length < 6) {
                          return "Şifre en az 6 karakter olmalıdır";
                        }
                        return null;
                      },
                    ),
                  ),
                  //PAROLAMI UNUTTUM
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextButton(
                        child: Text(
                          "Parolamı unuttum?",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  //BUTON
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          //foregroundColor:
                          //MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(buttonColor),
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          bool result = formKey.currentState.validate();
                          if (result) {
                            setState(() {
                              textColor = Color(0xFF134AE5);
                              buttonColor = Colors.white;
                            });
                            String username = emailTffController.text;
                            String password = passTffController.text;
                            print(
                                "Kullanıcı Adı : ${username}, Şifre : ${password}");
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Bir hesabınız yok mu?",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Buradan talep edin.",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF9BDEF7),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
