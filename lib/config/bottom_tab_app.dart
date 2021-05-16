import 'package:flutter/material.dart';
import 'package:hpulse/DashBoard/dash_board.dart';
import 'package:hpulse/config/theme/style.dart';
class BottomTabApp extends StatefulWidget {
  @override
  _BottomTabAppState createState() => _BottomTabAppState();
}

class _BottomTabAppState extends State<BottomTabApp> {
  // TextStyle selectedText = TextStyle(
  //   fontSize: Style.text,
  // );
  int _selectedIndex = 0;
  List<Widget> wi = [DashBoard(),Text("ask"),Text("profile")];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: wi[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Style.primary,
        unselectedItemColor: Style.secondary,
        // selectedLabelStyle: selectedText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Icon(
                  Icons.home_outlined,
                size: 30,
              ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.create_outlined,
                size:30,
              ),
            label: 'create',
          ),
          BottomNavigationBarItem(
              icon:Icon(
                  Icons.person_outline_outlined,
                size:30,
              ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}

