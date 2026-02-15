// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:supersell/supersell4.dart';
import 'package:get/get.dart';
import 'package:supersell/supersell9.dart';
import 'package:supersell/login/login_controller.dart';

class SuperSell3 extends StatefulWidget{
 const SuperSell3({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_SuperSell3State();

}
class _SuperSell3State extends State<SuperSell3>{
  bool passwordvisibilty=true;
 LoginController controller =LoginController();
  @override
  void initState() {
    super.initState();
  }
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
        body:SizedBox(
          height: double.infinity,
         child:SingleChildScrollView(
         child: Stack(
           children: [
            Column(
              children: [
              Image.asset("lib/F.jpg",
              fit: BoxFit.fitHeight,
              height: 250,
              width: MediaQuery.of(
                context
                ).size.width,
              ),
               const SizedBox(
                 height: 40,
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   onChanged:(Value) {
                     controller.email=Value;
                  } ,
                   
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "E-mail".tr,
                    labelStyle: TextStyle(fontSize: 25,color: Colors.pink[700]),
                    hintText: "Enter your E-mail",
                    hintStyle: const TextStyle(fontSize: 20),
                    icon: Icon(Icons.alternate_email,
                    color: Colors.pink[700],
                    ),
                   ),
                  keyboardType: TextInputType.emailAddress,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   onChanged:(Value) {
                     controller.password=Value;
                  } ,
                   decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText:"Password".tr,
                    labelStyle: TextStyle(fontSize: 25,color: Colors.pink[700]),
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
                    color: Colors.pink[700],
                    ),
                    )
                   ),
                  keyboardType: TextInputType.visiblePassword,
                   obscureText: passwordvisibilty,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                   child: Text(
                     "Log in".tr,
                   style: const TextStyle(
                    fontSize: 25,
                    height:1,
                    fontStyle:FontStyle.italic,
                    color: Colors.white
                    ),
                   ),
                   onPressed: (){
                     onClickLogin() ;
                   },
                   style:ButtonStyle(
                     padding: WidgetStateProperty.all(const EdgeInsets.fromLTRB(100, 5, 100, 5)),
                     shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                     
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.pink[700]),
                   ),
                 ),
               ),
               TextButton.icon(
                onPressed: (){
                  
                  Get.to(()=>const Supersell9());
                },
                icon: const Icon(
                  Icons.emoji_food_beverage_outlined,
                  size: 32,
                  color: Colors.indigo,
                ),
                label: Text(
                  "Forgot Password".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                  ),
                  ),
              ),
               Image.asset(
                 "lib/L.png",
                 width:MediaQuery.of(
                   context
                   ).size.width ,
                   height:290,
               )
              ],
                     ),
            ] 
            ),
         ),
        ),
  );

  }
  void onClickLogin () async {
  EasyLoading.show(status: 'Loading...');
  await controller.loginonclick();
  if(controller.signupstatues){
    EasyLoading.showSuccess(controller.message);
    Get.offAll(()=>const Supersell4());
  }
  else{
    EasyLoading.showError(
    controller.message,
    duration: const Duration(seconds: 3),
    dismissOnTap: true
    );
  }
}
}