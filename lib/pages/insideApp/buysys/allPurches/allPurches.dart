import 'package:dalimansys_app/pages/insideApp/buysys/allPurches/purchesDetails.dart';
import 'package:dalimansys_app/pages/insideApp/buysys/newPurches.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AllPurches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF9BDEF7),
                Color(0xFF1597D8),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPurches(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 2.5 / 1,
          children: [
            _buildCard(context),
            _buildCard(context),
            _buildCard(context),
            _buildCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PurchesDetails(),
          ),
        );
      },
      child: Card(
        elevation: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.fileInvoice,
                        color: Color(0xFF969696),
                        size: 17,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "P002022074",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "46 sn",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      FaIcon(
                        FontAwesomeIcons.clock,
                        size: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Dalisto Adsoft - Ankara",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 16),
              child: Text(
                "Malzeme SA Talebi",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kalem Adedi",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF969696),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "4",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Ekleyen",
            //         style: GoogleFonts.poppins(
            //           color: Color(0xFF969696),
            //           fontSize: 15,
            //         ),
            //       ),
            //       Text(
            //         "Caner Sar??kavakl??",
            //         style: GoogleFonts.poppins(
            //           color: Colors.black,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 15,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Onay Bekliyor.",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      FaIcon(
                        FontAwesomeIcons.hourglassHalf,
                        color: Color(0xFFF48421),
                        size: 15,
                      )
                    ],
                  ),
                  FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
