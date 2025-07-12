import 'package:facebook_replica/Common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildStoriesList(List stories) {
  return Container(
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
