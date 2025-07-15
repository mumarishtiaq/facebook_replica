import 'dart:io';

import 'package:facebook_replica/Common/app_colors.dart';
import 'package:facebook_replica/home_view.dart';
import 'package:facebook_replica/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _controller = TextEditingController();
  bool isTyping = false;
  File? selectedMediaFile;
  VideoPlayerController? videoPlayerController;
   bool isVideo = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = null;
    _controller.addListener(() {
      setState(() {
        isTyping = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text("Create post"),
        actions: [
          TextButton(
            onPressed:
                isTyping
                    ? () {
                      _onPosted();
                    }
                    : null,
            style: TextButton.styleFrom(
              backgroundColor:
                  isTyping ? AppColors.primaryBlue : Colors.grey.shade300,
              foregroundColor: isTyping ? AppColors.white : Colors.grey,
            ),
            child: Text("Post"),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    "assets/images/myPic.jpg",
                  ), // Dummy avatar
                ),
                SizedBox(width: 10),
                Text(
                  "Umer Ishtiaq",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),

          // What's on your mind
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 150),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: InputBorder.none,
              ),
              maxLines: null,
            ),
          ),

          // Optional Divider with collapse icon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(child: Icon(Icons.keyboard_arrow_up, size: 20)),
          ),

          Divider(height: 1),

          // Options List
          Expanded(
            child: ListView(
              children: [

                if(selectedMediaFile != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  isVideo ?buildVideoPlayer() : buildImagePreview(),
                  ),




                _optionItem(Icons.photo, "Photo/video", Colors.green),
                _optionItem(Icons.person_add, "Tag people", Colors.blue),

                _optionItem(
                  Icons.emoji_emotions,
                  "Feeling/activity",
                  Colors.amber,
                ),
                _optionItem(Icons.location_on, "Check in", Colors.red),
                _optionItem(Icons.videocam, "Live video", Colors.pink),
                _optionItem(
                  Icons.format_color_fill,
                  "Background color",
                  Colors.teal,
                ),
                _optionItem(Icons.camera_alt, "Camera", Colors.blueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionItem(IconData icon, String text, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      onTap: () async {
        selectedMediaFile = await pickMediaFromGallery();

        if (selectedMediaFile != null) {
          _onMediaSelected();
        }
      },
    );
  }

  Future<void> _onMediaSelected() async {
    isVideo = isVideoFile(selectedMediaFile!.path);

    if(isVideo)
    {
    videoPlayerController?.dispose();
    videoPlayerController = VideoPlayerController.file(File(selectedMediaFile!.path));
    await videoPlayerController?.initialize();
    videoPlayerController?.play();
    }
  
    setState(() {
        
      }); 
  }

   Widget buildVideoPlayer() {
    if (videoPlayerController != null && videoPlayerController!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: videoPlayerController!.value.aspectRatio,
        child: VideoPlayer(videoPlayerController!),
      );
    } else {
      return Container();
    }
  }

  Widget buildImagePreview() {
    if (selectedMediaFile != null) {
      return Image.file(
        selectedMediaFile!,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
       return Container();
    }
  }

  void _onPosted() {
   postViewKey.currentState?.addPostInListAndUpdate(
      _controller.text,
      selectedMediaFile,
    );


    
    Navigator.pop(context);
  }


}


