// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:supersell/Register/register_controller.dart';
import 'package:supersell/home%20screen.dart';
class SuperSell extends StatefulWidget{
  const SuperSell({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SuperSellState();
}
class _SuperSellState extends State <SuperSell>{
  bool passwordvisibilty=true;
  get decoration => null;
  RegisterController controller =RegisterController();

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
        body: SizedBox(
          height: double.infinity,
         child:SingleChildScrollView(
         child: Stack(
           children: [
            Column(
             children: [
               Image(
                 image: const AssetImage("lib/I.jpg",),
                 fit: BoxFit.fitHeight,
                 
                 width: MediaQuery.of(
                   context
                   ).size.width,
               ),
               const SizedBox(
                 height: 40,
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                    onChanged:(Value) {
                     controller.username=Value;
                  } ,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Username".tr,
                    labelStyle: TextStyle(fontSize: 25,color: Colors.blue[700],),
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(fontSize: 20),
                    icon: Icon(Icons.person_outline,
                    size: 25,
                    color: Colors.blue[400],
                    ),
                   ),
                  keyboardType: TextInputType.text,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                    onChanged:(Value) {
                     controller.email=Value;
                  } ,
                   decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "E-mail".tr,
                    labelStyle: TextStyle(fontSize: 25,color: Colors.blue[700],),
                    hintText: "Enter your E-mail",
                    hintStyle: const TextStyle(fontSize: 20),
                    icon: Icon(
                    Icons.alternate_email,
                    size: 25,
                    color: Colors.blue[400],
                    ),
                   ),
                  keyboardType: TextInputType.emailAddress,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                    onChanged:(Value) {
                     controller.password=Value;
                  } ,
                   decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Password".tr,
                    labelStyle: TextStyle(fontSize: 25,color: Colors.blue[700],),
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(fontSize: 20),
                    suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        passwordvisibilty=!passwordvisibilty;
                      });
                    },
                    icon: Icon(
                    passwordvisibilty?Icons.visibility:Icons.visibility_off,
                    size: 25,
                    color: Colors.blue[400],
                    ),
                    )
                   ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passwordvisibilty,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                    onChanged:(Value) {
                     controller.phonenumber=Value;
                  } ,
                   decoration: InputDecoration(
                     prefixText: "+963  ",
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Phone Number".tr,
                    labelStyle: TextStyle(fontSize: 25,color: Colors.blue[700],),
                    hintText: "Enter your Phone Number",
                    hintStyle: const TextStyle(fontSize: 20,),
                    icon: Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.blue[400],
                    ),
                   ),
                  keyboardType: TextInputType.number,
                 ),
               ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                   child: Text(
                    "Sign up".tr,
                   style: const TextStyle(
                    fontSize: 25,
                    height: 1,
                    fontStyle:FontStyle.italic,
                    color: Colors.white,
                    ),
                   ),
                   onPressed: (){
                   registeronclick();
                   },
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
               const SizedBox(
                 height: 20,
               ),
               Image.asset(
                 "lib/M.jpg",
                 width:MediaQuery.of(
                   context
                   ).size.width ,
                   height:180,
               )
             ],
            )
           ]
         ),
        ),
      ),
    );

  }
  void registeronclick() async {
  EasyLoading.show(status: 'Loading...');
  await controller.registeronclick();
  if(controller.signupstatues){
    EasyLoading.showSuccess(controller.message);
    Get.offAll(()=>const Homescreen());
  }
  else{
    EasyLoading.showError(controller.message,duration: const Duration(seconds: 3),dismissOnTap: true);
  }
}
}