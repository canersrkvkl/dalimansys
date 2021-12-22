import 'package:dalimansys_app/pages/entrance/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmedPage2 extends StatefulWidget {
  @override
  _ConfirmedPage2State createState() => _ConfirmedPage2State();
}

class _ConfirmedPage2State extends State<ConfirmedPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF0000),
              Color(0xFF3C003A),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset(
                      "assets/images/dalimansys_whitetextlogo2.svg"),
                ),
                TextButton(
                  child: Text(
                    "Giriş yap",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Positioned(
                  top: 37,
                  left: 37,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 75,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "E-posta gönderdik!",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Text(
                    "Şifreni sıfırlayabilmen için bir e-posta gönderdik. Lütfen e-postanızı kontrol edin.",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 0,
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
