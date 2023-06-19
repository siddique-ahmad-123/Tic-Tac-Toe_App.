import 'package:flutter/material.dart';
import 'package:newprjj/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 final GlobalKey<FormState> _formKey = GlobalKey<FormState> ();

 final TextEditingController Player1Controller = TextEditingController();
 final TextEditingController Player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323D5B),
      body: Form(
        key: _formKey,
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Text("Enter Players Name",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 254, 249, 249),
            ),
            ),

            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: Player1Controller,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                ),

                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: "Player 1 Name",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 139, 136, 136)
                ),
              ),

              validator: (value) {
                if(value==null || value.isEmpty){
                  return "Please enter Player 1 Name";
                }
                return null;
              },
            ),
            ),
            
            SizedBox(height: 8.0,),
            Padding(padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: Player2Controller,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                ),

                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                hintText: "Player 2 Name",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 139, 136, 136)
                ),
              ),

              validator: (value) {
                if(value==null || value.isEmpty){
                  return "Please enter Player 2 Name";
                }
                return null;
              },
            ),
            ),

            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                if(_formKey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(
                    Player1: Player1Controller.text,
                     Player2: Player2Controller.text,
                    ),
                    )
                    );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 12 ,horizontal: 15),
                child: Text (
                  "Start Game",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ),
            
           ],
        ),

         ),
    );
  }
}