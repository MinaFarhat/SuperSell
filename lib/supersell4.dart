// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supersell/model.dart';
import 'supersell5.dart';
import 'package:http/http.dart' as http;
class Product {
   String ?name;
   int ?id;
   String ? username;
   String ? image;
   double ? price;
   String ? unit;
   Product(){
     name=name;
     id=id;
     username=username;
     image=image;
     price=price;
     unit=unit;
     
   }
  Product.fromJson(dynamic data){
       id = data['id'];
        name = data['name'];
        username=data['username'];
        image = data['image'];
        price = data['price'];
        unit=data['unit'];
  }
}


class Supersell4 extends StatefulWidget {
  const Supersell4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Supersell4state();
}

class _Supersell4state extends State<Supersell4> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Supersell5(),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Super Sell",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        floatingActionButton: FloatingActionButton(
          child:const Icon(
               Icons.search,
               size: 30,
          ),
          onPressed: (){},
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          child: Column(
            children:[getl()]
          ),
        ));
  }
  
 Widget getl(){
   return FutureBuilder(
     future: SEE.gett(),
     builder: (context,snapshot){
       if(snapshot.hasData){
         return SingleChildScrollView(
           child: Wrap(children: snapshot.data as List<Widget>,),
         );
         
       }
       else if(snapshot.hasError){
         return const Center(child: Text("erorr"),);
       }
       return const CircularProgressIndicator();
     }
     );
 }
 
}
class SEE extends StatelessWidget {
prudect_details p;
SEE(this.p, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Card(
        child: Column(
          children:[
          Container(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
               Text(
              "Name of prudect:${p.name}".tr,
              style: const TextStyle(fontSize: 30,fontStyle:FontStyle.italic),
              ),
              Text(
             "The price is:${p.price}",
             style: const TextStyle(fontSize: 30,fontStyle:FontStyle.italic),
             ),
              Text(
             "The unit is:${p.unit}",
             style: const TextStyle(fontSize: 30,fontStyle:FontStyle.italic),
             ),
             ]
            ),
          ),
          Image(
          image:NetworkImage(p.image),
          fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children:[
           LikeButton(
             likeCountPadding:const EdgeInsets.only(left: 12),
             size: 50,
             isLiked: true,
             likeCount:4 ,
             countBuilder: (count,isLiked,text){
               const color = Colors.indigo;
               return Text(
                 text,
                 style: const TextStyle(
                   color: color,
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               );
             },
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               const Padding(padding: EdgeInsets.all(8)),
               Text(
                 "View Count ${p.view}",
                 style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),
              ),
               const Icon(
                Icons.remove_red_eye_outlined,
                size: 30,

              ),
             ],
           )
          ],
          ),
          const Divider(
          color: Colors.black,
          ),
          ] ,
        ),
      ),
      onTap: (){

      },
    );
  }
  static Future<List<SEE>> gett() async{
    List a= await g().getallproduct();
    List<SEE> b=[];
    for(var x in a){
      b.add(SEE(x));
    }
    return b;
 }
}
class g{
   Future<List<prudect_details>> getallproduct() async{
         SharedPreferences pref = await SharedPreferences.getInstance();

    var response =await http.get(Uri.parse('http://shoppingcontent.googleapis.com/content/v2.1/{merchantId}/products'),
    headers: {'Authorization':'Bearer ${pref.getString("token")}'},
     );
    List<dynamic> data=jsonDecode(response.body);
    return     data.map((e) =>     prudect_details.fromJson(e)).toList()
;
  }

}