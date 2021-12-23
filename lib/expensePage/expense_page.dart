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
    return Column(
      children: [
        Text("190,78"),
        Text("BİM Birleşik Mağazalar A.Ş."),
        Text("Market Harcamaları"),
      ],
    );
  }
}