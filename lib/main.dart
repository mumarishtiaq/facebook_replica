import 'package:facebook_replica/create_post_view.dart';
import 'package:facebook_replica/home_view.dart';
import 'package:facebook_replica/login_view.dart';
import 'package:facebook_replica/video_picker_test.dart';
import 'package:facebook_replica/video_test_jubri.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FacebookReplica());
}

class FacebookReplica extends StatelessWidget {
  FacebookReplica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Facebook",

      home: VideoPickerTest(),

      // home: VideoPickerScreen(),

      // home: LoginView(),
      // home: HomeView(),
      // home: CreatePostView(),
    );
  }
}
