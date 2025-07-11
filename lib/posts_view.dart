
import 'package:facebook_replica/Common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPostListOld()
{
  return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Header
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/user_profile.jpg"), // Replace with your local asset
            ),
            title: Text("Umar Ishtiaq", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Text("Jul 3 · "),
                Icon(Icons.public, size: 14, color: Colors.grey),
              ],
            ),
            trailing: Icon(Icons.more_horiz),
          ),

          // Post Image
          Image.asset(
            "assets/images/myPic.jpg", // Replace with your local image
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Reaction Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.blue, size: 18),
                SizedBox(width: 4),
                Text("1k"),
              ],
            ),
          ),

          // Divider(),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _PostAction(icon: Icons.thumb_up_alt_outlined, label: "Like"),
                _PostAction(icon: Icons.comment_outlined, label: "Comment"),
                _PostAction(icon: FontAwesomeIcons.whatsapp, label: "Send"),
              ],
            ),
          ),
        ],
      ),
    );
  }


Widget buildPostList()
{
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 20,
    itemBuilder: (context , index) {
      return _buildPostTemplate("assets/images/myPic.jpg","Umar Ishtiaq");
    }
    );
}

Widget _buildPostTemplate(String avatar , String name)
{
  
    return Container(
    padding: EdgeInsets.symmetric(vertical: 10 ),
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border(bottom: BorderSide(color: AppColors.borderGrey , width: 5))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatar),
          ),
          title:  Text(name , style: GoogleFonts.roboto(fontWeight: FontWeight.bold , color: AppColors.black87 , fontSize: 16),),
          subtitle: Text("2d" , style: GoogleFonts.roboto(color: AppColors.iconGrey , fontSize: 14)),
          // trailing: Row(
          //   children: [
          //     Icon(Icons.more_horiz),
          //     Icon(Icons.close),

          //   ],
          // ),
          trailing:  Icon(Icons.more_horiz),
        )
      ],
    ),

  );
}


class _PostAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _PostAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        SizedBox(width: 4),
        Text(label, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}