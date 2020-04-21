
import 'package:flutter/material.dart';

import 'home_tab.dart';
import 'reports_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("VSnap"),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: TabBarView(children: [HomeTab(), ReportsTab()]),
          backgroundColor: Colors.blue,
          bottomNavigationBar: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Scan"),
                Tab(icon: Icon(Icons.email), text: "Reports"),
              ],
              labelColor: Colors.white,
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 2.0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              indicatorColor: Colors.white),
        ));
  }
}
