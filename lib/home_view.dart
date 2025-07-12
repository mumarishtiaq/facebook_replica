import 'dart:io';

import 'package:facebook_replica/Common/app_colors.dart';
import 'package:facebook_replica/create_post_view.dart';
import 'package:facebook_replica/posts_view.dart';
import 'package:facebook_replica/stories_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> posts = [
    {
      "avatar": "assets/images/avatars/men3.jpg",
      "name": "Ali Raza",
      "time": "2h ago",
      "image": "assets/images/posts/beach.jpg",
      "caption": "Salt in the air, sand in my hair—vacation mode activated🌤️",
      "likesCount": "120",
      "pickedFile": null,
    },
    {
      "avatar": "assets/images/avatars/girl4.jpg",
      "name": "Hina Fatima",
      "time": "23 min ago",
      "image": "assets/images/posts/pizza.jpg",
      "caption": "Good food, good mood",
      "likesCount": "500",
      "pickedFile": null,
    },
    {
      "avatar": "assets/images/avatars/girl3.jpg",
      "name": "Ayesha khan",
      "time": "23 min ago",
      "image": "assets/images/posts/painting.jpg",
      "caption": "New painting I just finished 🎨",
      "likesCount": "1K +",
      "pickedFile": null,
    },
    {
      "avatar": "assets/images/avatars/men2.jpg",
      "name": "Bilal Rafique",
      "time": "2d ago",
      "image": "assets/images/posts/diving.jpg",
      "caption": "One jump. A thousand feelings. Would you try this?",
      "likesCount": "5K +",
      "pickedFile": null,
    },
  ];

  final List<Map<String, dynamic>> stories = [
    {
      'name': 'Emma Watson',
      'avatar': 'assets/images/avatars/girl1.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'isSeen': true,
    },
    {
      'name': 'Ayesha Khan',
      'avatar': 'assets/images/avatars/girl2.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
      'isSeen': false,
    },
    {
      'name': 'Hiro Tanaka',
      'avatar': 'assets/images/avatars/men1.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
      'isSeen': true,
    },
    {
      'name': 'Mei Lin',
      'avatar': 'assets/images/avatars/girl3.jpg',
      'thumbnail': 'https://images.unsplash.com/photo-1549921296-3a6b0353d94c',
      'isSeen': false,
    },
    {
      'name': 'Daniel Lee',
      'avatar': 'assets/images/avatars/men2.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1607082352311-069fdbf1f5a2',
      'isSeen': true,
    },
    {
      'name': 'Ravi Sharma',
      'avatar': 'assets/images/avatars/men3.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1470770841072-f978cf4d019e',
      'isSeen': true,
    },
    {
      'name': 'Sophia Miles',
      'avatar': 'assets/images/avatars/girl4.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1501973801540-537f08ccae7d',
      'isSeen': false,
    },
    {
      'name': 'Jin Park',
      'avatar': 'assets/images/avatars/men1.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      'isSeen': false,
    },
    {
      'name': 'Grace Kelly',
      'avatar': 'assets/images/avatars/girl1.jpg',
      'thumbnail':
          'https://images.unsplash.com/photo-1496483648148-47c686dc86a8',
      'isSeen': true,
    },
    {
      'name': 'Fatima Noor',
      'avatar': 'assets/images/avatars/girl2.jpg',
      'thumbnail': 'https://images.unsplash.com/photo-1549692520-acc6669e2f0c',
      'isSeen': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "facebook",
                      style: GoogleFonts.roboto(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 1,
                      ),
                    ),

                    Row(
                      children: [
                        _buildIconButton(
                          Icons.add_box_outlined,
                          false,
                          0xFF9E9E9E,
                        ),
                        SizedBox(width: 7),
                        _buildIconButton(
                          Icons.search_rounded,
                          true,
                          0xFF9E9E9E,
                        ),
                        SizedBox(width: 7),
                        _buildMessengerIcon(),
                      ],
                    ),
                  ],
                ),
              ),
              //building navigation icons
              _buildNavigationBar(),

              //building input row
              _buildInputRow(),

              buildStoriesList(stories),

              buildPostList(posts),
            ],
          ),
        ),
      ),
    );
  }

  int _selectedIndex = 0;

  //custon methods
  Widget _buildIconButton(IconData icon, bool isbackground, int col) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isbackground ? AppColors.lightGrey : AppColors.white,
      ),
      child: Icon(icon, color: Color(col), size: 30),
    );
  }

  Widget _buildMessengerIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildIconButton(FontAwesomeIcons.facebookMessenger, true, 0xFF757575),

        Positioned(
          right: -6,
          top: -6,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.red,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: Text(
              "3",
              style: GoogleFonts.roboto(fontSize: 12, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderGrey, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigationButton(0, Icons.home_outlined, 36),

          _buildNavigationButton(1, Icons.ondemand_video_rounded, 30),
          _buildNavigationButton(2, Icons.group_outlined, 33),
          _buildNavigationButton(4, Icons.store, 33),
          _buildNavigationButton(3, Icons.notifications_outlined, 33),
          _buildNavigationButton(5, Icons.menu, 33),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(int index, IconData icon, double iconSize) {
    bool isSelected = index == _selectedIndex;
    return Column(
      children: [
        IconButton(
          onPressed: () {
            _iconOnPress(index);
          },
          icon: Icon(
            icon,
            color: isSelected ? AppColors.primaryBlue : AppColors.black87,
            size: iconSize,
          ),
        ),

        Container(
          height: 3,
          width: 60,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  void _iconOnPress(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addNewPostAndUpdatePostList() {
    print("in home view");
  }

  Widget _buildInputRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderGrey, width: 5),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/myPic.jpg'),
            radius: 22,
          ),

          SizedBox(width: 10),

          Expanded(
            child: Container(
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  navigateToCreateSPostView(context);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.borderGrey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What's on your mind?",
                    style: TextStyle(color: AppColors.black87, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(width: 20),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.image, color: Colors.green),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }

  void navigateToCreateSPostView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreatePostView()),
    );
  }

  void addPostInListAndUpdate(String caption, File? selectedImage) {
    print("Test function in HomeView called!");
    setState(() {
      posts.insert(0, {
        "avatar": "assets/images/myPic.jpg",
        "name": "Umer Ishtiaq",
        "time": "Just now",
        "image": "assets/images/posts/hiking.jpg",
        "caption": caption,
        "likesCount": "0",
        "pickedFile": selectedImage,
      });
    });
  }
}
