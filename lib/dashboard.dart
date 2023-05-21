import 'package:untitled/currency/currencyConvert.dart';
import 'package:untitled/nav/kesan.dart';
import 'package:untitled/nav/profile.dart';
import 'package:untitled/time/timeConvert.dart';
import 'package:untitled/beer/list_ui.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Calendar(),
    CurrencyConverter(),
    ListBeer(),
    //PageListResep()
    // MySliverAppBar(expandedHeight: , info: info),
    //ResepHome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Final Project'),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),

        body: Center(
            child: _widgetOptions.elementAt(_selectedIndex)
          //IndexedStack(index: _selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(38, 58, 41, 1),
            //backgroundColor: Colors.white,
            unselectedItemColor: Colors.white,
            selectedItemColor: Color.fromRGBO(166, 187, 141,1),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.access_time_filled_outlined,
                  //color: Colors.white,
                ),
                label: 'Time Converter',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.attach_money,
                    //color: Colors.white,
                  ),
                  label: 'Money Currency'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wine_bar),
                label: 'Beers',
              ),
            ],
            currentIndex: _selectedIndex,
            // selectedItemColor: Colors.indigo,
            onTap: _onItemTapped
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Header'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.10)
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_outlined),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.emoji_emotions_outlined),
                title: Text('Kesan dan Pesan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Kesan()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text('Log Out'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Kesan()),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}