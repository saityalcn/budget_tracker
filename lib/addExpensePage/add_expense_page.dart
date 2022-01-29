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
      appBar: buildAppBar(),
      body: buildBody(),
      /*floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }

  AppBar buildAppBar(){
    return AppBar(
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
    );
  }

  Widget buildBody(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            buildScanOrUploadDocumentArea(),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 2.0,
              color: Colors.black,
            ),
            const SizedBox(height: 20.0),
            buildAddExpenseForm(),
          ],
        ),
      ),
    );
  }

  Widget buildScanOrUploadDocumentArea(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildScanDocumentArea(),
        buildUploadDocumentArea(),
      ],
    );
  }

  Widget buildScanDocumentArea(){
    return Row(
      children: [
        TextButton(
          onPressed: (){},
          child: Row(
            children: [
              Icon(Icons.document_scanner_rounded,color: Colors.black,),
              SizedBox(width: 8.0,),
              Text("Belge Tara"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildUploadDocumentArea(){
    return Row(
      children: [
        TextButton(
          onPressed: (){},
          child: Row(
            children: [
              Icon(Icons.upload,color: Colors.black,),
              SizedBox(width: 8.0,),
              Text("Belge Yükle"),
            ],
          ),
        ),
      ],
    );
  }

  buildAddExpenseForm() {
    var _costController = TextEditingController();
    var _expenseTitleController = TextEditingController();
    var _commentController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 4.0,
        ),
        Text("Başlık",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w800),),
        const SizedBox(height: 8.0,),
        TextFormField(
          controller: _expenseTitleController,
          decoration: const InputDecoration(
            hintText: 'Majesa Market',
            filled: true,
            fillColor: Color(0xFFF8F8FB),
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text("Tutar",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w800),),
        const SizedBox(height: 8.0,),
        TextFormField(
          controller: _costController,
          decoration: const InputDecoration(
            hintText: "123,47",
            prefixText: "₺",
            prefixStyle: TextStyle(
              color:Colors.black,
            ),
            filled: true,
            fillColor: Color(0xFFF8F8FB),
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
              ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24.0,),
        Text("Açıklama",style: TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w800),),
        const SizedBox(height: 8.0,),
        TextFormField(
          controller: _commentController,
          maxLines: 3,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFF8F8FB),
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
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
                icon: const Icon(Icons.change_circle_rounded))
          ],
        ),
        const SizedBox(
          height: 40.0,
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showMaterialBanner(showBanner(context));
            Timer(const Duration(seconds: 3),(){
              ScaffoldMessenger.of(context).clearMaterialBanners();
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ekle',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              primary: Color(0xFF171645),
          ),
        ),
      ],
    );
  }


  FloatingActionButton buildFloatingActionButton(){
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.document_scanner_rounded),
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
