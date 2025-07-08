import 'package:facebook_replica/Common/app_colors.dart';
import 'package:flutter/material.dart';
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
        Padding(padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 12),
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

             Text("facebook", 
              style: GoogleFonts.roboto(color: AppColors.primaryBlue , fontWeight: FontWeight.bold , fontSize: 32 ,letterSpacing: 2),
              ),

              Row(
                children: [
                  _buildIconButton(Icons.add_box_outlined,false),
                  SizedBox(width: 7,),
                  _buildIconButton(Icons.search_rounded,true),
                  SizedBox(width: 7,),
                  _buildMessengerIcon(),


                ],
              ),
            
          ],
        )
        )
      ],),
      )
    );
  }


//custon methods 
  Widget _buildIconButton(IconData icon , bool isbackground)
{
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isbackground ? AppColors.lightGrey : AppColors.white
    ),
    child: Icon(icon, color: Colors.black87 , size: 30,),
  );
}

Widget _buildMessengerIcon()
{
  return Stack(
    clipBehavior: Clip.none,
    children: [
      _buildIconButton(Icons.message_sharp,true),

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
      )
    ],
  );
}
}