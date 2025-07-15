import 'package:facebook_replica/Common/app_colors.dart';
import 'package:facebook_replica/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = true;

  void togglePasswordVisiblity() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void onLogin(BuildContext context) {
    //will implement email and password check
    //

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjvzC_QRv6moAhgNb5C6e3yicKgFND1g2RwA&s",
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone or Email",
                  hintStyle: GoogleFonts.roboto(color: AppColors.iconGrey),
                  filled: true,
                  fillColor: AppColors.lightGrey, // light grey background
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.iconGrey,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.borderGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.focusBorderBlue,
                      width: 1.2,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                obscureText: _isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: GoogleFonts.roboto(color: AppColors.iconGrey),
                  filled: true,
                  fillColor: AppColors.lightGrey,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.key_rounded,
                    color: AppColors.iconGrey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      togglePasswordVisiblity();
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.iconGrey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.borderGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.focusBorderBlue,
                      width: 1.2,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    onLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: Text(
                    "Log in",
                    style: GoogleFonts.roboto(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.roboto(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryBlue,
                    side: BorderSide(color: Color(0xFF1877F2)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(double.infinity, 0),
                  ),
                  child: Text(
                    "Create new account",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
