import 'package:flutter/material.dart';

class ExpensesPageAppBar extends AppBar{
  Widget build(BuildContext context) {
    return buildAppBar();
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            print("Menu");
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black54,
          )),
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
          backgroundColor: const Color(0xFF646464).withOpacity(0.3),
        ),
        SizedBox(width: 10.0)
      ],
    );
  }

}