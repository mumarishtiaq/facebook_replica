import 'package:facebook_replica/home_view.dart';
import 'package:facebook_replica/login_view.dart';
import 'package:flutter/material.dart';

void main()
{
 runApp(const FacebookReplica());
}
class FacebookReplica extends StatelessWidget {
  const FacebookReplica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Facebook",
      home: LoginView(),
      // home: HomeView(),

    );
  }
}