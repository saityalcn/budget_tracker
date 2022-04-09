// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ExpensePageState();
  }

}

class ExpensePageState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: const Text(""),
      leadingWidth: 50,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      title: Center(child: Text("Harcama Detayı", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 21.0),)),
      actions: [
        SizedBox(
          width: 50.0,
            child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close,color: Colors.black,))
        )
      ],
    );
  }

  Widget buildBody() {
    String lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0,),
            Text("10 Kasım 2022 22:19"),
            const SizedBox(height: 20.0),
            CircleAvatar(backgroundColor: Colors.blueGrey,),
            const SizedBox(height: 40.0,),
            Text("Lorem",style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.w800),),
            const SizedBox(height: 10.0),
            Text("Market Harcamaları"),
            const SizedBox(height: 50.0),
            Text("₺190,78",style: TextStyle(color:Colors.black,fontSize: 22.0,fontWeight: FontWeight.w800),),
            const SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildOptionsContainer("Belge",Icons.document_scanner_outlined),
                const SizedBox(width:40.0),
                buildOptionsContainer("Detaylar",Icons.info_outline),
              ],
            ),
            const SizedBox(height: 30.0,),
            Text("Açıklama",style: TextStyle(color:Colors.black,fontSize: 22.0,fontWeight: FontWeight.w800),),
            const SizedBox(height: 12.0,),
            Text(lorem,textAlign: TextAlign.justify,)
          ],
        ),
      ),
    );
  }


  Widget buildOptionsContainer(String title, IconData icon){
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(icon),
          ),
        ),
        SizedBox(height:4.0),
        Text(title,textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
      ],
    );
  }

}