
import 'package:flutter/material.dart';

class GroupsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return GroupsPageState();
  }

}

class GroupsPageState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0, fontWeight: FontWeight.w800),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      title: Text("Deneme"),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 30.0,),
            buildGroupContainer("Lorem Ipsum"),
            buildGroupContainer("Lorem Ipsum"),
            buildGroupContainer("Lorem Ipsum"),
            buildGroupContainer("Lorem Ipsum"),
            buildGroupContainer("Lorem Ipsum"),
            buildGroupContainer("Lorem Ipsum"),
            buildGroupContainer("Lorem Ipsum"),
            const SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }

  Widget buildGroupContainer(String titleOfGroup) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [BoxShadow(color: const Color(0xFF171645).withOpacity(0.3),offset: const Offset(1.0,1.0),blurRadius: 22.0),],
        image: DecorationImage(image: NetworkImage("https://via.placeholder.com/400x400"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListTile(
          onTap: (){Navigator.pushNamed(context, "/home");},
          subtitle: Text(titleOfGroup,style: const TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w800),),
        ),
      ),
    );
  }

}