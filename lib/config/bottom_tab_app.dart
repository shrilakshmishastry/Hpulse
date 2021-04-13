import 'package:flutter/material.dart';
class BottomTabApp extends StatefulWidget {
  @override
  _BottomTabAppState createState() => _BottomTabAppState();
}

class _BottomTabAppState extends State<BottomTabApp> {
  int _selectedIndex = 0;
  List<Widget> wi = [Text("dashboard"),Text("ask"),Text("profile")];

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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
            label: 'school',
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.business),
            label: 'Business',
          ),
        ],
      ),
    );
  }
}

