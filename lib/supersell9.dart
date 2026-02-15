import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supersell/supersell10.dart';
class Supersell9 extends StatelessWidget {
   const Supersell9({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        body: SingleChildScrollView(
          child:Stack(
            children:[
               Column(
                  children: [
                  Image(
                    width: MediaQuery.of(context).size.width,
                  image: const AssetImage(
                  'lib/g2.jpg'
                  ),
                  fit: BoxFit.cover,
                  ),
                    const SizedBox(
                 height: 40,
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Username".tr,
                    labelStyle: const TextStyle(fontSize: 25,color: Colors.black,),
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(fontSize: 20),
                    icon: const Icon(Icons.person_outline,
                    size: 25,
                    color: Colors.green,
                    ),
                   ),
                  keyboardType: TextInputType.text,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                   decoration: InputDecoration(
                     prefixText: "+963  ",
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Phone Number".tr,
                    labelStyle: const TextStyle(fontSize: 25,color: Colors.black,),
                    hintText: "Enter your Phone Number",
                    hintStyle: const TextStyle(fontSize: 20,),
                    icon: const Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.green,
                    ),
                   ),
                  keyboardType: TextInputType.number,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: ElevatedButton.icon(
                   icon: const Icon(
                     Icons.library_add_check_outlined,
                     size: 30,
                     color: Colors.green,
                   ),
                   label: Text(
                    "Check".tr,
                   style: const TextStyle(
                    fontSize: 25,
                    height: 1,
                    fontStyle:FontStyle.italic,
                    color: Colors.green,
                    ),
                   ),
                   onPressed: (){
                   Get.to(()=>const Supersell10());
                   },
                   style:ButtonStyle(
                     padding: WidgetStateProperty.all(const EdgeInsets.fromLTRB(100, 5, 100, 5)),
                     shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      //side: BorderSide(width: 2),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                   ),
                 ),
               ),
               Image(
                  width: MediaQuery.of(context).size.width,
                  image: const AssetImage(
                  'lib/g1.png'
                  ),
                  fit: BoxFit.cover,
               ),
                             
                           ],
                           ),
            ],
          ),
        ),
    );
  }
}