import 'package:facebook_replica/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FacebookReplica());
}

class FacebookReplica extends StatelessWidget {
  const FacebookReplica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Facebook",

      // home: VideoPickerTest(),

      // home: VideoPickerScreen(),

      home: LoginView(),
      // home: HomeView(),
      // home: CreatePostView(),
    );
  }
}
