import 'package:facebook_replica/Common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoriesView extends StatelessWidget {
   StoriesView({super.key});

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
    return  Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border(bottom: BorderSide(color: AppColors.borderGrey, width: 5)),
    ),
    child: SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: stories.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return _buildMyStoryCard();
          }
          final story = stories[i - 1];
          return _buildStoryTemplate(
            story["name"],
            story["avatar"],
            story["thumbnail"],
            story["isSeen"],
          );
        },
      ),
    ),
  );
  }
}



Widget _buildMyStoryCard() {
  return Padding(
    padding: EdgeInsets.only(left: 12, top: 16, bottom: 16),
    child: Container(
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightGrey,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image(
              image: AssetImage('assets/images/myPic.jpg'),
              fit: BoxFit.cover,
              height: 135,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 45,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryBlue,
                border: Border.all(width: 2, color: AppColors.white),
              ),
              child: Center(child: Icon(Icons.add, color: AppColors.white)),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Text(
              "Create Story",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: AppColors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStoryTemplate(
  String name,
  String avatar,
  String thumbnail,
  bool isSeen,
) {
  return Padding(
    padding: EdgeInsets.only(left: 8, top: 16, bottom: 16),
    child: Container(
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(thumbnail),
          fit: BoxFit.cover,
        ),
        color: AppColors.black87,
      ),
      child: Stack(
        children: [
          //circle avatar of profile
          Positioned(
            top: 12,
            left: 12,
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(avatar),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSeen ? AppColors.iconGrey : AppColors.primaryBlue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              name,
              style: GoogleFonts.roboto(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
