import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmProcess extends StatefulWidget {
  @override
  _ConfirmProcessState createState() => _ConfirmProcessState();
}

class _ConfirmProcessState extends State<ConfirmProcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF1597D8),
                Color(0xFF9BDEF7),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Onay Süreci",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFEFEFEF),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  child: Text(
                    "Fatura Detayı",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF6A6A6A),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                _buildCard(
                  "Geylani Arca",
                  "Onaylandı.",
                  FontAwesomeIcons.solidCheckCircle,
                  0xFF1597D8,
                  "Fatura tutarı çok olsa da ödenmesi benim için uygundur.",
                ),
                _buildCard(
                  "Merve Mermer Bilgin",
                  "Onaylandı.",
                  FontAwesomeIcons.solidCheckCircle,
                  0xFF1597D8,
                  "",
                ),
                _buildCard(
                  "Kaan Kamil Akkurt",
                  "Onay bekliyor.",
                  FontAwesomeIcons.hourglassHalf,
                  0xFFF48421,
                  "",
                ),
                _buildCard(
                  "Caner Sarıkavaklı",
                  "Onaylanmadı.",
                  FontAwesomeIcons.solidTimesCircle,
                  0xFFFD0001,
                  "Geylani Bey’e katılıyorum. Ancak ben reddediyorum. Böyle bir fiyat kabul edilemez.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String isim, String status, IconData icon, int iconColor, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isim,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4,),
            Row(
              children: [
                Text(
                  status,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 8,
                ),
                FaIcon(
                  icon,
                  size: 15,
                  color: Color(iconColor),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "13.12.2021 - 08.52",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF969696),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Text(
              content,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
