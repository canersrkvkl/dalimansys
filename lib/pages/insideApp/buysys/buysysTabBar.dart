import 'package:flutter/material.dart';

class Buysys extends StatefulWidget {
  @override
  State<Buysys> createState() => _BuysysState();
}

class _BuysysState extends State<Buysys> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(),
        ),
      ),
    );
  }
}
