import 'package:dalimansys_app/pages/insideApp/invosys/allBills/allBills.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/confirmation.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/approve.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/myOpinions.dart';
import 'package:dalimansys_app/pages/insideApp/invosys/waitingBills.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Invosys extends StatefulWidget {
  @override
  State<Invosys> createState() => _InvosysState();
}

class _InvosysState extends State<Invosys>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            shadowColor: Colors.grey,
            elevation: 5.0,
            backgroundColor: Colors.white,
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 4.0,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17,
              ),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Tüm Faturalar",
                ),
                Tab(
                  text: "Onayımı Bekleyeneler",
                ),
                Tab(
                  text: "Onayladıklarım",
                ),
                Tab(
                  text: "Görüş Bildirdiklerim",
                ),
                Tab(
                  text: "Bekleyen Faturalar",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            AllBills(),
            Confirmation(),
            Approve(),
            MyOpinions(),
            WaitingBills(),
          ],
        ),
      ),
    );
  }
}
