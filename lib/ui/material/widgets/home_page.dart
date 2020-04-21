import 'package:flutter/material.dart';

import 'home_tab.dart';
import 'reports_tab.dart';

class TabContent {
  final Text title;
  final Widget content;
  TabContent({this.title, this.content});
}

List<TabContent> _pages = [
  TabContent(title: Text("Select Scan"), content: HomeTab()),
  TabContent(title: Text("Reports"), content: ReportsTab()),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                icon: Icon(Icons.home), title: Text("Scan")),
            BottomNavigationBarItem(
                icon: Icon(Icons.email), title: Text("Reports")),
          ],
        ),
      ),
    );
  }
}

/** 
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
          body: _pages,
          //backgroundColor: Colors.blue,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Scan")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.email), title: Text("Reports")),
            ],
          ),
        ));
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidget createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
  List<Widget> _pages = [HomeTab(), ReportsTab()];
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ,
    );
  }
}
*/
