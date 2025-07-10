import 'package:facebook_replica/Common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildStoriesList() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border(bottom: BorderSide(color: AppColors.borderGrey, width: 5)),
    ),
    child: SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, i) {
          return _buildStoryTemplate(
            "Umar Ishtiaq",
            "assets/images/myPic.jpg",
            "assets/images/myPic.jpg",
            true,
          );
        },
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
        // image: DecorationImage(image: AssetImage('assets/images/myPic.jpg'), fit: BoxFit.cover),
        color: AppColors.black87,
      ),
      child: Stack(
        children: [
          //circle avatar of profile
          Positioned(
            top: 8,
            left: 8,
            child: CircleAvatar(
              radius: 20,
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
              "Umar Ishtiaq",
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
