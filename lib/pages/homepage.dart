import 'package:bookmyturf/pages/mapspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            const Text(
              'Venue for Today',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(
                  width: 95,
                ),
                SvgPicture.asset(
                  'assets/svg/loupe.svg',
                  semanticsLabel: "Loupe",
                  color: Color(0xff000000),
                  width: 23,
                  height: 23,
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  'assets/svg/filter.svg',
                  semanticsLabel: "Filter",
                  color: Color(0xff000000),
                  width: 23,
                  height: 23,
                ),
                SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  'assets/svg/calendar.svg',
                  semanticsLabel: "Calendar",
                  color: Color(0xff000000),
                  width: 23,
                  height: 23,
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Flexible(flex: 5, child: MapSample()),
          Flexible(
            flex: 3,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 30.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          color: Color(0xff028090),
                          child: SvgPicture.asset(
                            'assets/svg/games/003-shuttlecock.svg',
                            semanticsLabel: "Filter",
                            color: Color(0xffffffff),
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.green,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: 160.0,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
