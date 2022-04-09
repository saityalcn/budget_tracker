import 'package:budget_tracker/expensePage/appBar.dart';
import 'package:budget_tracker/monthlySumPage/monthly_sum_page.dart';
import 'package:budget_tracker/usersPage/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import 'expenses_page_body.dart';
import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State {
  int _selectedIndex = 0;
  final List<Widget> _bodyOptions = <Widget>[
    HomeBody(),
    ExpensesPageBody(),
    MonthlySumPage(),
    UsersPage(),
  ];

  final List<AppBar> _appBarOptions = <AppBar>[
    HomeAppBar(),
    ExpensesPageAppBar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
        drawer: buildDrawer(),
        floatingActionButton: buildFloatingActionButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: buildBottomNavigationBar());
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black54),
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        "LOGO",
        style: TextStyle(
            color: Colors.black,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w800,
            fontSize: 20.0),
      ),
      actions: [
        CircleAvatar(
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xFF646464).withOpacity(0.3),
        ),
        const SizedBox(width: 10.0)
      ],
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildDrawerHeader(),
                buildDrawerListElement("Anasayfa","/home"),
                buildDrawerListElement("Hesap","/home"),
                buildDrawerListElement("Gruplarım","/groups-page"),
                buildDrawerListElement("Profil","/home"),
                buildDrawerListElement("Hakkımızda","/home"),
                buildDrawerListElement("Sorun Bildir","/home"),
              ],
            ),
          ),
          buildDrawerFooter(),
        ],
      ),
    );
  }

  DrawerHeader buildDrawerHeader() {
    String name = "Ahmet";
    return DrawerHeader(
        decoration: const BoxDecoration(color: Color(0xFF171645)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Text(
                "Merhaba, $name",
                style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w800),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildSubscriptionListItem("https://via.placeholder.com/400x400"),
                  buildSubscriptionListItem("https://via.placeholder.com/400x400"),
                  buildSubscriptionListItem("https://via.placeholder.com/400x400"),
                  buildSubscriptionListItem("https://via.placeholder.com/400x400"),
                  buildSubscriptionListItem("https://via.placeholder.com/400x400"),
                  buildSubscriptionListItem("https://via.placeholder.com/400x400"),
                ],
              ),
            ),
          ],
        )
    );
  }

  buildSubscriptionListItem(String linkOfImage){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.network(linkOfImage,height: 40.0,),
      ),
    );
  }

  buildDrawerListElement(String title,String routeName){
    return ListTile(
      title: Text(title),
      onTap:(){
        Navigator.pushNamed(context, routeName);
      }
    );
  }

  Widget buildDrawerFooter(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Text("\u00a9 ST Software Solutions\nAll Rights Reserved",textAlign: TextAlign.center,),
    );
  }

  Widget buildBody() {
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
        buildBottomNavigationBarButton(Icons.history, "Aylık Özet"),
        buildBottomNavigationBarButton(
            Icons.supervised_user_circle_sharp, "Kullanıcılar"),
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

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/add-expense');
      },
      child: const Icon(
        Icons.add,
        size: 22,
      ),
      backgroundColor: const Color(0xFF171645),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
