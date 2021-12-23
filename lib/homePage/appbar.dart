import 'package:flutter/material.dart';

class HomeAppBar extends AppBar{
  Widget build(BuildContext context) {
    return buildAppBar();
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.menu,
            color: Colors.black54,
          )),
      title: Center(
          child: Text(
            "LOGO",
            style: const TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w800,
                fontSize: 20.0),
          )),
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
}