import 'package:dinamik_not_ort_hesaplama/widgets/kredinotubutton.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_not_ort_hesaplama/consts/sabitler.dart';
import 'package:dinamik_not_ort_hesaplama/model/ders.dart';
import 'package:dinamik_not_ort_hesaplama/main.dart';

class harfnotubutton extends StatefulWidget {
  const harfnotubutton({super.key});

  @override
  State<harfnotubutton> createState() => harfnotubuttonState();
}

class harfnotubuttonState extends State<harfnotubutton> {
Map<String,double> harfnotudegerleri= {"AA":4.00,"BA":3.50,"BB":3.00,"CB":2.50,"CC":2.00,"DC":1.50,"DD":1.00,"FD":0.50,"FF":0};
List<String> Harfnotlari =["AA","BA","BB","CB","CC","DC","DD","FD","FF"];
String? secilenharf;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        style: Theme.of(context).textTheme.labelLarge,
        dropdownColor: Sabirlers.anarenk.shade100,
        borderRadius: Sabirlers.borderad,  
        items: Harfnotlari.map((e){
            return DropdownMenuItem<String>(
            child:Text(e),
            value: e,
            );}).toList() ,
        onChanged:(deger) {
        setState(() {
            secilenharf = deger; 
        });                                       
        },
        value: secilenharf,
        hint: Text("CC"),
        );
  }
}