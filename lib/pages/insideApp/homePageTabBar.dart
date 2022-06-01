import 'package:dalimansys_app/pages/insideApp/buysys/buysysTabBar.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/invosysTabBar.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool araniyor = false;
  TextEditingController tfcArama = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: araniyor == false
            ? AppBar(
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
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        araniyor = true;
                      });
                    },
                  ),
                ],
                centerTitle: true,
                title: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  tabs: [
                    Tab(
                      child: SvgPicture.asset(
                        "assets/images/invosys.svg",
                      )
                    ),
                    Tab(
                      child: SvgPicture.asset(
                        "assets/images/purchsys.svg",
                      ),
                    ),
                  ],
                ),
              )
            : AppBar(
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
                leading: Icon(Icons.search),
                title: TextField(
                  controller: tfcArama,
                  cursorColor: Colors.black,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Fatura Ara",
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.solidTimesCircle,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        araniyor = false;
                        print(tfcArama.text);
                      });
                    },
                  ),
                ],
              ),
        body: TabBarView(
          children: [
            Invosys(),
            Buysys(),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1597D8),
                Color(0xFF9BDEF7),
              ]),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
