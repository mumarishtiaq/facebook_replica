import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Colors.white,

     body: Center( child: 
     Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Login" , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold , fontSize: 24),),

      Padding(padding: EdgeInsets.symmetric(horizontal: 32 , vertical: 10),
      child: 
      TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 24 , vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          hintText: "Phone / Email Id",
          prefixIcon: Icon(Icons.email , color: Colors.grey)


        ),
      )
      ),
       Padding(padding: EdgeInsets.symmetric(horizontal: 32 , vertical: 10),
      child: 
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          hintText: "Password"


        ),
      )
      ),
      Padding(
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Phone or Email",
      filled: true,
      fillColor: Color(0xFFF0F2F5), // light grey background
      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.blue.shade700, width: 1.2),
      ),
    ),
  )),
      
     ],),


    ));
  }
}