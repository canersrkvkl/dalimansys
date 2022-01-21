import 'package:dalimansys_app/pages/insideApp/buysys/allPurches/allPurches.dart';
import 'package:dalimansys_app/pages/insideApp/buysys/purchesApprove/purchesApprove.dart';
import 'package:dalimansys_app/pages/insideApp/buysys/purchesConfirmation/purchesConf.dart';
import 'package:dalimansys_app/pages/insideApp/buysys/purchesOpinion/purchesOpinion.dart';
import 'package:dalimansys_app/pages/insideApp/buysys/waitingRequests/waitingRequests.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buysys extends StatefulWidget {
  @override
  State<Buysys> createState() => _BuysysState();
}

class _BuysysState extends State<Buysys> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
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
                  text: "Tüm Satın Alma Talepleri",
                ),
                Tab(
                  text: "Onayımı Bekleyenler",
                ),
                Tab(
                  text: "Onayladıklarım",
                ),
                Tab(
                  text: "Görüş Bildirdiklerim",
                ),
                Tab(
                  text: "Bekleyen Talepler",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            AllPurches(),
            PurchesApprove(),
            PurchesConfirmation(),
            PurchesOpinion(),
            WaitingRequests(),
          ],
        ),
        ),
      );
  }
}
