import 'package:dalimansys_app/pages/insideApp/buysys/buysysTabBar.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/invosysTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(),
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
              onPressed: () {},
            )
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
                ),
              ),
              Tab(
                child: SvgPicture.asset(
                  "assets/images/buysys.svg",
                ),
              ),
            ],
          ),
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
}
