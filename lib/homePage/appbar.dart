import 'package:flutter/material.dart';

class HomeAppBar extends AppBar{
  Widget build(BuildContext context) {
    return buildAppBar();
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black54,
          )
      ),
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
}