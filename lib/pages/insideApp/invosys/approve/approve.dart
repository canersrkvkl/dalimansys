import 'package:dalimansys_app/pages/insideApp/invosys/approve/approveDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Approve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 2 / 1,
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
            builder: (context) => ApproveDetails(),
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
                        "6746295",
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
                "ERKBY Tarım A.Ş.",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 16),
              child: Text(
                "Aylık Fatura",
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
                    "Fatura Bedeli",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF969696),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "1.399,99 TL",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ekleyen",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF969696),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Caner Sarıkavaklı",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Onaylandı",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidCheckCircle,
                        color: Color(0xFF1597D8),
                        size: 15,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 20,
                      color: Colors.black,
                    ),
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