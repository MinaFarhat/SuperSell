// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supersell/Register/supersell2.dart';
import 'package:supersell/login/supersell3.dart';
class Homescreen extends StatelessWidget
{
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle:true ,
            title:const Text(
            "Super Sell",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
             fontStyle: FontStyle.italic,
            ),
              ),
         backgroundColor:Colors.indigo,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
            Image.asset(
                 "lib/M.jpg",
                fit: BoxFit.cover,
                  width: MediaQuery.of(
                    context
                  ).size.width              ,
                 height:300
                 ),
            Column (
           children: [
             const SizedBox(height:200 ,) ,
           const Row(
             mainAxisAlignment: MainAxisAlignment.center,
           ) ,
             const SizedBox( height: 150.0 ,) ,
             SizedBox(
               width: double.infinity,
                     
               child:ElevatedButton(
               onPressed: (){
                 Get.to(()=>const SuperSell3());
               } ,
                child :
                   Text(
                     "Log in".tr,
                   style: const TextStyle(
                   fontStyle: FontStyle.italic,
                     fontSize: 25,
                     height: 1,
                     color: Colors.white,
                     )
               ),
                style:ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.fromLTRB(100, 5, 100, 5)),
              shape: WidgetStateProperty.all(
               const RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(20.0)),
               //side: BorderSide(width: 2),
               ),
             ),
             backgroundColor: WidgetStateProperty.all(Colors.blue[400]),
                             ), 
               ),
             ),
             const SizedBox( height: 52.0 ,) ,
             Container(
               padding :const EdgeInsets.symmetric(vertical: 10.0) ,
               width: double.maxFinite,
                     
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)
                   {
                       return const SuperSell();
                   }
                   ),
                   );
                 } ,
                 child :Text(
                   "Sign up".tr,
                   style: const TextStyle(
                     fontSize: 25,
                     fontStyle: FontStyle.italic,
                     height: 1,
                     color: Colors.white,
                     )
               ),
                style:ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.fromLTRB(100, 5, 100, 5)),
              shape: WidgetStateProperty.all(
               const RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(20.0)),
               //side: BorderSide(width: 2),
               ),
             ),
             backgroundColor: WidgetStateProperty.all(Colors.blue[400]),
                             ),
               ),
               ),
              Image.asset(
                   "lib/A.png",
                   //alignment: Alignment.bottomCenter,
                   width: MediaQuery.of(
                     context
                     ).size.width,
                     height: 280,
                 ),
           ],
            
            ),
            ],),
        ),
    );
  } }



