import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final Function onItemTapped;
  final int selectedIndex;
  final String title;

  const CustomScaffold(
      {Key key,
      @required this.body,
      this.onItemTapped,
      this.selectedIndex,
      @required this.title})
      : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.selectedIndex != null && this.widget.onItemTapped != null) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              this.widget.title,
              style: TextStyle(fontFamily: 'Knewave'),
            ),
          ),
        ),
        body: this.widget.body,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Characters",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.theater_comedy),
              label: "Team",
            )
          ],
          currentIndex: this.widget.selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: this.widget.onItemTapped,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "THE BATTLE",
              style: TextStyle(fontFamily: 'Knewave'),
            ),
          ),
        ),
        body: this.widget.body,
      );
    }
  }
}
