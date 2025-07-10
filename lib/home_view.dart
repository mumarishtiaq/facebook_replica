import 'package:facebook_replica/Common/app_colors.dart';
import 'package:facebook_replica/stories_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppColors.white,
      body: SafeArea(
        child:
      Column(children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 2),
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

             Text("facebook", 
              style: GoogleFonts.roboto(color: AppColors.primaryBlue , fontWeight: FontWeight.bold , fontSize: 32 ,letterSpacing: 1),
              ),

              Row(
                children: [
                  _buildIconButton(Icons.add_box_outlined,false,0xFF9E9E9E),
                  SizedBox(width: 7,),
                  _buildIconButton(Icons.search_rounded,true,0xFF9E9E9E),
                  SizedBox(width: 7,),
                  _buildMessengerIcon(),


                ],
              ),
          ],
        )
        ),
        //building navigation icons
              _buildNavigationBar(),

              //building input row
              _buildInputRow(),

              buildStoriesList(),

      ],),
      )
    );
  }
 int _selectedIndex = 0;


//custon methods 
  Widget _buildIconButton(IconData icon , bool isbackground , int col)
{
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isbackground ? AppColors.lightGrey : AppColors.white
    ),
    child: Icon(icon, color:  Color(col) , size: 30,),
  );
}

Widget _buildMessengerIcon()
{
  return Stack(
    clipBehavior: Clip.none,
    children: [
      _buildIconButton(FontAwesomeIcons.facebookMessenger,true,0xFF757575),

      Positioned(right: -6 , top: -6,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.red,
            border: Border.all(color: AppColors.white , width: 2)
          ),
          child: Text("3" , style: GoogleFonts.roboto(fontSize: 12 , color: AppColors.white),),
        )
      ),
    ],
  );
}

Widget _buildNavigationBar()
{
 return Container(
  padding: EdgeInsets.symmetric(horizontal: 3),
  decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.borderGrey , width: 1)
        )
        
      ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      _buildNavigationButton(0,Icons.home_outlined, 36),
      
      _buildNavigationButton(1,Icons.ondemand_video_rounded ,30),
      _buildNavigationButton(2,Icons.group_outlined,33),
      _buildNavigationButton(3,Icons.notifications_outlined,33),
      _buildNavigationButton(4,Icons.store,33),
      _buildNavigationButton(5,Icons.menu,33),
    ],
  ),
 );
}

Widget _buildNavigationButton(int index,IconData icon , double iconSize)
{
  bool isSelected = index == _selectedIndex;
   return Column(
    children: [
   IconButton(
    onPressed: () { _iconOnPress(index);},
   icon: Icon(icon , color: isSelected ? AppColors.primaryBlue : AppColors.black87 , size: iconSize,),
   ),

   Container(
    height: 3,width: 60,
    decoration: BoxDecoration(
      color: isSelected? AppColors.primaryBlue : Colors.transparent,
      borderRadius: BorderRadius.circular(2)
    ),
   )
    ]
   );
}



void _iconOnPress(int index)
{
 setState(() {
   _selectedIndex = index;
 });
}

Widget _buildInputRow()
{
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border(
        bottom: BorderSide(color: AppColors.borderGrey , width: 5)
      )
    ),
    child: Row(
      children: [
         CircleAvatar(backgroundImage: AssetImage('assets/images/myPic.jpg'), radius: 20,),

         SizedBox(width: 10,),

         Expanded(
          child: Container(height: 40,
            child: OutlinedButton(onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.borderGrey
                ),
                borderRadius: BorderRadius.circular(25)

              )
            ), 
            child: Align( alignment: Alignment.centerLeft,
              child: Text("What's on your mind?" ,
            style: TextStyle(color: AppColors.black87 , fontSize: 20),),
            )
            
            ),
          ),
          ),


         SizedBox(width: 20,),

         IconButton(onPressed: () {}, 
         icon: Icon(Icons.image, color: Colors.green)
         ),
         SizedBox(width: 5,),

      ],
    )
  );
}

}

