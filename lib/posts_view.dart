import 'dart:io';

import 'package:facebook_replica/Common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostView extends StatefulWidget {

   const PostView({super.key});

  @override
  State<PostView> createState() => PostViewState();


  
}

class PostViewState extends State<PostView> {
  final List<Map<String, dynamic>> posts = [
    {
      "avatar": "assets/images/avatars/men3.jpg",
      "name": "Ali Raza",
      "time": "2h ago",
      "postMedia": "assets/images/posts/beach.jpg",
      "caption": "Salt in the air, sand in my hair—vacation mode activated🌤️",
      "likesCount": "120",
      "pickedFile": null,
    },
    {
      "avatar": "assets/images/avatars/girl4.jpg",
      "name": "Hina Fatima",
      "time": "23 min ago",
      "postMedia": "assets/images/posts/pizza.jpg",
      "caption": "Good food, good mood",
      "likesCount": "500",
      "pickedFile": null,
    },
    {
      "avatar": "assets/images/avatars/girl3.jpg",
      "name": "Ayesha khan",
      "time": "23 min ago",
      "postMedia": "assets/images/posts/painting.jpg",
      "caption": "New painting I just finished 🎨",
      "likesCount": "1K +",
      "pickedFile": null,
    },
    {
      "avatar": "assets/images/avatars/men2.jpg",
      "name": "Bilal Rafique",
      "time": "2d ago",
      "postMedia": "assets/images/posts/diving.jpg",
      "caption": "One jump. A thousand feelings. Would you try this?",
      "likesCount": "5K +",
      "pickedFile": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final post = posts[index];
      return _buildPostTemplate(
        post["avatar"],
        post["name"],
        post["time"],
        post["postMedia"],
        post["caption"],
        post["likesCount"],
        post["pickedFile"],
      );
    },
  );
  }

  void addPostInListAndUpdate(String caption, File? selectedFile) {
    setState(() {
      posts.insert(0, {
        "avatar": "assets/images/myPic.jpg",
        "name": "Umer Ishtiaq",
        "time": "Just now",
        "postMedia": "assets/images/posts/hiking.jpg",
        "caption": caption,
        "likesCount": "0",
        "pickedFile": selectedFile,
      });
    });
  }




Widget _buildPostTemplate(
  String avatar,
  String name,
  String time,
  String image,
  String caption,
  String likesCount,
  File? pickedFile,
) {

  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border(bottom: BorderSide(color: AppColors.borderGrey, width: 5)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(avatar)),
          title: Text(
            name,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: AppColors.black87,
              fontSize: 16,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                time,
                style: GoogleFonts.roboto(
                  color: AppColors.iconGrey,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.public, size: 18, color: AppColors.black87),
            ],
          ),
          trailing: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.more_horiz, size: 30, color: AppColors.iconGrey),
                SizedBox(width: 20),
                Icon(Icons.close, size: 30, color: AppColors.iconGrey),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              caption,
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
            ),
          ),
        ),

        // Image.asset(image, width: double.infinity, fit: BoxFit.cover),
        pickedFile != null
            ? Image.file(
              File(pickedFile.path),
              width: double.infinity,
              fit: BoxFit.cover,
            )
            : Image.asset(image, width: double.infinity, fit: BoxFit.cover),

        // Reaction Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.thumb_up, color: AppColors.primaryBlue, size: 18),
              SizedBox(width: 3),
              Icon(FontAwesomeIcons.solidHeart, color: Colors.pink, size: 18),
              SizedBox(width: 4),
              Text(likesCount),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPostActionIcons(Icons.thumb_up_alt_outlined, "Like"),
              _buildPostActionIcons(Icons.comment_outlined, "Comment"),
              _buildPostActionIcons(FontAwesomeIcons.whatsapp, "Send"),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildPostActionIcons(IconData icon, String label) {
  return Row(
    children: [
      Icon(icon, size: 20, color: AppColors.iconGrey),
      SizedBox(width: 4),
      Text(label, style: GoogleFonts.roboto(color: AppColors.iconGrey)),
    ],
  );
}
}