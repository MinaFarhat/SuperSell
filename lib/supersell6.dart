import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supersell/supersell7.dart';
class SuperSell6 extends StatefulWidget{
  const SuperSell6({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_SuperSell6Satate();
}
class _SuperSell6Satate extends State <SuperSell6>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(
        centerTitle: true,
        title: const Text(
        "Super Sell",
        style: TextStyle(color: Colors.white,
        fontSize: 30,
        fontStyle: FontStyle.italic,
        ),
        ),
        backgroundColor:Colors.indigo,
        ),
        floatingActionButton:FloatingActionButton(
          
          child: const Icon(
            Icons.add_circle,
            size: 40,
            ),
            backgroundColor: Colors.blue,
          onPressed: (){
            Get.to(const Supersell7());
          },
        ) ,
        body:Container (
                 height: double.infinity,
             decoration: const BoxDecoration(
            image: DecorationImage(
              image:AssetImage("lib/M3.jpg"),
              fit: BoxFit.cover,
               )
          ),
            child: const SingleChildScrollView(
              child: Center(
                child: Column(
                  
                
                    
                ),
              ),
                
              ),
            ),
     );
  }

}