import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supersell/supersell4.dart';
class Supersell11 extends StatefulWidget{
  const Supersell11({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Supersell11State();
}
class _Supersell11State extends State <Supersell11>{
  bool passwordvisibilty=true;

  get decoration => null;

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
                 image: const AssetImage("lib/tt.jpg",),
                 fit: BoxFit.fitHeight,
                 
                 width: MediaQuery.of(
                   context
                   ).size.width,
               ),
               
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "User Name",
                    labelStyle: const TextStyle(fontSize: 25,color: Colors.deepPurple,),
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(fontSize: 20),
                    icon: const Icon(Icons.person_outline,
                    size: 25,
                    color: Colors.deepPurple,
                    ),
                   ),
                  keyboardType: TextInputType.text,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                   decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20,color: Colors.blueGrey),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "E-mail",
                    labelStyle: const TextStyle(fontSize: 25,color: Colors.deepPurple,),
                    hintText: "Enter your E-mail",
                    hintStyle: const TextStyle(fontSize: 20),
                    icon: const Icon(
                    Icons.alternate_email,
                    size: 25,
                    color: Colors.deepPurple,
                    ),
                   ),
                  keyboardType: TextInputType.emailAddress,
                 ),
               ),
               Container(
                 margin: const EdgeInsets.all(8.0),
                 child: TextField(
                   decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Password",
                    labelStyle: const TextStyle(fontSize: 25,color: Colors.deepPurple,),
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
                    color: Colors.deepPurple,
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
                   decoration: InputDecoration(
                     prefixText: "+963  ",
                      border: OutlineInputBorder(
                       borderSide: const BorderSide(width: 20),
                       borderRadius: BorderRadius.circular(50.0),
                     ),
                    labelText: "Phone Number",
                    labelStyle: const TextStyle(fontSize: 25,color: Colors.deepPurple,),
                    hintText: "Enter your Phone Number",
                    hintStyle: const TextStyle(fontSize: 20,),
                    icon: const Icon(
                    Icons.phone,
                    size: 25,
                    color: Colors.deepPurple,
                    ),
                   ),
                  keyboardType: TextInputType.number,
                 ),
               ),
                Container(
                 margin: const EdgeInsets.all(8.0),
                 child: ElevatedButton.icon(
                   label: const Text("Edit",
                   style: TextStyle(
                    fontSize: 30,
                    height: 1,
                    fontStyle:FontStyle.italic,
                    color: Colors.white,
                    ),
                   ),
                   icon: const Icon(
                     Icons.edit,
                     color: Colors.white,
                     size: 40,
                   ),
                   onPressed: (){
                    Get.offAll(()=>const Supersell4());
                   },
                   style:ButtonStyle(
                     padding: WidgetStateProperty.all(const EdgeInsets.fromLTRB(100, 5, 100, 5)),
                     shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      //side: BorderSide(width: 2),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                   ),
                 ),
               ),
               Image.asset(
                 "lib/tt1.jpg",
                 width:MediaQuery.of(
                   context
                   ).size.width ,
                   height:300,
               )
             ],
           )
           ]
         ),
           ),
        ),
        );

  }
}