
import 'package:flutter/material.dart';
import 'consts/sabitler.dart';
import 'widgets/harfnotubutton.dart';
import 'widgets/kredinotubutton.dart';
import 'package:dinamik_not_ort_hesaplama/model/ders.dart';



void main() {
  return runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(headline1: Sabirlers.textstyle(24, FontWeight.w600, Sabirlers.anarenk),),
        primaryColor: Sabirlers.anarenk,
        visualDensity:VisualDensity.adaptivePlatformDensity,),
      title: 'Calculate GPA',
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key,});

  @override
  State<Anasayfa> createState() => AnasayfaState();
}

class AnasayfaState extends State<Anasayfa> {

String? dersadi;
List<Ders> derslistesi = [];
double ort = 0;
double payda =0;
double pay = 0;



var keytextfield = GlobalKey<FormFieldState>();
final kredibuttonKey = GlobalKey<kredinotubuttonState>();
final harfbuttonKey = GlobalKey<harfnotubuttonState>();


  @override
  Widget build(BuildContext context) {
    //print("1");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Text('Calculate GPA',style: Theme.of(context).textTheme.headline1,),
      ),
      body: Column(
        children: [
          IntrinsicHeight(
            child: Expanded(
              child: Row(
                children: [
                  Flexible(
                    flex:2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                      key: keytextfield,
                                      onSaved: (secilenders) {
                                        dersadi=secilenders;
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Sabirlers.anarenk.shade100,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:Sabirlers.borderad,),
                                        labelText: 'Enter course name',
                                        hintText: 'exmp. Physic 101'),
                                      ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Sabirlers.anarenk.shade100,
                                      borderRadius: Sabirlers.borderad,
                                    ),
                                    width: 100,
                                    height: 70,
                                    alignment: Alignment.center,
                                    child: harfnotubutton(key: harfbuttonKey,),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                
                                Flexible(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Sabirlers.anarenk.shade100,
                                        borderRadius: Sabirlers.borderad,
                                      ),
                                      width: 100,
                                      height: 70,
                                      alignment: Alignment.center,
                                      child: kredinotubutton(key:kredibuttonKey),
                                    ),
                                ),
                                  const SizedBox(width: 10,),
                                
                                IconButton(
                                iconSize: 35,
                                color: Sabirlers.anarenk,
                                onPressed: (){
                                  keytextfield.currentState!.save();

                                  if(dersadi == "" || harfbuttonKey.currentState!.harfnotudegerleri[harfbuttonKey.currentState!.secilenharf] == null || kredibuttonKey.currentState!.secilenkredi == null){                                 
                                  }
                                  else{
                                  Ders d = Ders(
                                    isim: dersadi,
                                    harfnotu:harfbuttonKey.currentState!.harfnotudegerleri[harfbuttonKey.currentState!.secilenharf],
                                    kredi:kredibuttonKey.currentState!.secilenkredi);                         
                                  
                                  derslistesi.add(d);

                                  payda = payda + kredibuttonKey.currentState!.secilenkredi!;

                                  pay = pay + (kredibuttonKey.currentState!.secilenkredi!)*(harfbuttonKey.currentState!.harfnotudegerleri[harfbuttonKey.currentState!.secilenharf]!);
                                  print(pay);
                                  print(payda);

                                  ort = pay/payda;


                                  }
                                  setState(() {
                                    
                                  });                                
                                }, 
                                icon: Icon(Icons.arrow_forward_ios))  
                              ],),
                          )
                        ],),
                    ),
                  ),
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Column(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${derslistesi.length} course entered",style: Sabirlers.textstyle(15, FontWeight.w400, Sabirlers.anarenk),),
                            Text(ort.toStringAsFixed(2),style: Sabirlers.textstyle(45, FontWeight.w600, Sabirlers.anarenk),),
                            Text("GPA",style: Sabirlers.textstyle(20, FontWeight.w400, Sabirlers.anarenk),),
                          ],),
                        ),
                      ),
                    )
                ],),
            ),
          ),
          altliste(),     
        ],),
    );
  }
  Widget altliste(){
  if (derslistesi.length == 0){
    return Column(
    children:[
      Padding(
        padding: const EdgeInsets.only(top:200),
        child: Container(
          child: Text("Please add course!",style: Sabirlers.textstyle(28, FontWeight.w200, Sabirlers.anarenk),),),
          ),
             ],);
  }
  else{
    return Expanded(
                child: ListView.builder(
                  itemCount: derslistesi.length,
                  itemBuilder: (context,int index){
                    return Card(
                      child: Dismissible(
                        background: Container(color: Colors.red,),
                        key: Key(derslistesi[index].kredi!.toString()),
                        onDismissed: (direction) {
                          setState(() { 

                          });
                            pay = pay - (derslistesi[index].kredi!)*(derslistesi[index].harfnotu!);
                            payda = payda - derslistesi[index].kredi!;
                            derslistesi.removeAt(index);
                            print(pay);
                            print(payda);
                            if(payda==0){
                              ort = 0;
                            }else{
                            ort =pay/payda;
                            }
                           //print(derslistesi[0].isim);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Sabirlers.anarenk,
                            child:Text(((derslistesi[index].kredi!)*(derslistesi[index].harfnotu!)).toInt().toString()),
                            ),
                          title: Text(derslistesi[index].isim!),
                          subtitle: Text("${derslistesi[index].kredi} Credit, Grade ${derslistesi[index].harfnotu!}"),
                        ),
                      ),
                    );
                          
                }),
              ) ;
  }
}
}
    





