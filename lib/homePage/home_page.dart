import 'package:budget_tracker/expensePage/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';
import 'expenses_page.dart';
import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  int _selectedIndex = 0;
  static List<Widget> _bodyOptions = <Widget>[
    HomeBody(),
    ExpensesPage(),
    HomeBody(),
    ExpensesPage(),
  ];
  static List<AppBar> _appBarOptions = <AppBar>[
    HomeAppBar(),
    ExpensesPageAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      drawer: buildDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-expense');
        },
        child: Icon(Icons.add,size: 22,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: buildBottomNavigationBar()
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black54),
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      title: Center(
          child: Text(
        "LOGO",
        style: TextStyle(
            color: Colors.black,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w800,
            fontSize: 20.0),
      )),
      actions: [
        CircleAvatar(
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF646464).withOpacity(0.3),
        ),
        SizedBox(width: 10.0)
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: ListTile(title: Text("Menu"),trailing: IconButton(icon:Icon(Icons.close),onPressed: (){Navigator.pop(context);},),)),
          ListTile(title: Text("1")),
          ListTile(title:  Text("2"),),
        ],
      ),
    );
  }


  Widget buildBody(){
    return _bodyOptions[_selectedIndex];
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 11.0,
      selectedFontSize: 13.0,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      items: [
        buildBottomNavigationBarButton(Icons.home, "Ana Sayfa"),
        buildBottomNavigationBarButton(Icons.receipt_long, "Harcamalar"),
        buildBottomNavigationBarButton(Icons.history, "Geçmiş"),
        buildBottomNavigationBarButton(Icons.supervised_user_circle_sharp, "Kullanıcılar"),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  buildBottomNavigationBarButton(IconData icon, String labelText) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        label: labelText,
        backgroundColor: Colors.white
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
