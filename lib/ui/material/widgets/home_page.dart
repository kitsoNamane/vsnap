import 'package:flutter/material.dart';

import 'home_tab.dart';
import 'reports_tab.dart';

class TabContent {
  final Text title;
  final Widget content;
  TabContent({this.title, this.content});
}

List<TabContent> _pages = [
  TabContent(title: const Text("Select Scan"), content: HomeTab()),
  TabContent(title: const Text("Reports"), content: ReportsTab()),
];

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _pages[_currentIndex].title,
          elevation: 0.0,
        ),
        body: _pages[_currentIndex].content,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          }, // new
          currentIndex: _currentIndex, // new
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: const Text("Scan")),
            BottomNavigationBarItem(
                icon: Icon(Icons.email), title: const Text("Reports")),
          ],
        ),
    );
  }
}

