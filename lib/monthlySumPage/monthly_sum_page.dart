import 'package:flutter/material.dart';

class MonthlySumPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MonthlySumPageState();
  }

}

class MonthlySumPageState extends State {
  List<String> months = ["Ocak","Şubat","Mart","Nisan","Mayıs","Haziran","Temmuz","Ağustos","Eylül","Ekim","Kasım","Aralık"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            buildFilterAndSortArea(),
            buildYearSumArea("2022",3),
            buildYearSumArea("2021",12),
            buildYearSumArea("2020",12),
            buildYearSumArea("2019",12),
          ],
        ),
      ),
    );
  }

  Widget buildFilterAndSortArea(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: (){
            print("Filtrele");
            },
          child: Row(
            children: [
              const Icon(Icons.filter_list),
              const SizedBox(width: 5.0),
              Text("Filtrele")
            ],
          ),
        ),
        TextButton(
          onPressed: (){
              print("Sırala");
            },
          child: Row(
            children: [
              const Icon(Icons.sort_outlined),
              const SizedBox(width: 5.0),
              Text("Sırala")
            ],
          ),
        ),
      ],
    );
  }

  Widget buildYearSumArea(String year,int _itemCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        Text(year,style: const TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w800),),
        buildMonthsArea(_itemCount),
      ],
    );
  }

  Widget buildMonthsArea(_itemCount){
    double containerHeight = 60;
    double margin = 8.0;
    return SizedBox(
      height: (_itemCount)*(2*margin+containerHeight),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return buildListItem(index, containerHeight, margin,_itemCount);
          },
          itemCount: _itemCount,
      ),
    );
  }

  Widget buildListItem(int index,double _height,double margin,int _itemCount){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,"/expenses");
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: margin),
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0x4D29468E),
        ),
        child: ListTile(
          title: Text(months[_itemCount-index-1],style: const TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.w800),),
          trailing: Text("₺3256"),
        ),
      ),
    );
  }

}