import 'package:flutter/material.dart';
import 'package:dinamik_not_ort_hesaplama/consts/sabitler.dart';
import 'package:dinamik_not_ort_hesaplama/model/ders.dart';
import 'package:dinamik_not_ort_hesaplama/main.dart';


class kredinotubutton extends StatefulWidget {
  const kredinotubutton({super.key});

  @override
  State<kredinotubutton> createState() => kredinotubuttonState();
}

class kredinotubuttonState extends State<kredinotubutton> {

//final Anasayfakey = GlobalKey<AnasayfaState>();
List<Ders> derslistesi = [];

  List<double> Krediler =[1,2,3,4,5,6,7,8,9,10];
  double? secilenkredi;
  @override
  Widget build(BuildContext context) {
  
  List<Ders> derslistesi = [];
    //print("2");
    return DropdownButton<double>(
             style: Theme.of(context).textTheme.labelLarge,
             dropdownColor: Sabirlers.anarenk.shade100,
             borderRadius: Sabirlers.borderad,  
             items: Krediler.map((e){
              return DropdownMenuItem<double>(
              child:Text(e.toString()),
              value: e,
              );}).toList() ,
            onChanged:(deger) {
              setState(() {
              secilenkredi =deger;
              });      
            },
            value: secilenkredi,
            hint: Text("5"),
            );
  }
}