import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddExpensePageState();
  }
}

class AddExpensePageState extends State {
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gider Ekle",style: const TextStyle(color:Colors.black))),
        actions: [
          IconButton(
            icon: Icon(Icons.close,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            buildAddExpenseForm(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.document_scanner_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  buildAddExpenseForm() {
    var _costController = TextEditingController();
    var _expenseTitleController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 4.0,
          ),
          TextFormField(
            controller: _expenseTitleController,
            decoration: InputDecoration(
              //hintText: 'Majesa Market',
              label: Text("Başlık"),
              //labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          TextFormField(
            controller: _costController,
            decoration: InputDecoration(
              label: Text("Tutar"),
              prefixText: "₺",
              prefixStyle: TextStyle(
                color:Colors.black,
              ),
            ),
            keyboardType: TextInputType.number,
            /*
            enableSuggestions: false,
            autocorrect: false,
            obscureText: true,
          */
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today_rounded),
                      const SizedBox(width: 20),
                      Text(
                          _date.day.toString() +
                              "." +
                              _date.month.toString() +
                              "." +
                              _date.year.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w900)),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 20,),
              IconButton(
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  icon: Icon(Icons.change_circle_rounded))
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showMaterialBanner(showBanner(context));
              Timer(const Duration(seconds: 3),(){
                ScaffoldMessenger.of(context).clearMaterialBanners();
              });
            },
            child: const Text(
              'Ekle',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0)),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1000, 1, 1),
        maxTime: DateTime(3100, 6, 7),
        //onChanged: (date) {},
        onConfirm: (date) {
          setState(() {
          _date = date;
          });
        },
        currentTime: DateTime.now(), locale: LocaleType.tr);
  }

  MaterialBanner showBanner(BuildContext context) {
    return const MaterialBanner(
      backgroundColor: Color(0xFF57CD5D),
      content: Text("Harcama Ekleme Başarılı"),
      actions: [
        Text(""),
      ],
    );
  }

}
