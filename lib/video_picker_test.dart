import 'dart:io';

import 'package:facebook_replica/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickerTest extends StatefulWidget {
  const VideoPickerTest({super.key});

  @override
  State<VideoPickerTest> createState() => _VideoPickerTestState();
}

class _VideoPickerTestState extends State<VideoPickerTest> {

  File? media;
 VideoPlayerController? videoPlayerController;
 bool isVideo = false;

  @override
  void initState() {
    super.initState();
    videoPlayerController = null;
  }

 @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ListView(
          children: [
            TextButton(onPressed: () async {
              media = await pickMediaFromGallery();
              if (media != null) {
                onMediaSelected();
              }
            },
             child: Text("Pick Media")
             ),
             SizedBox(height: 10,),

             isVideo ?buildVideoPlayer() : buildImagePreview(),

      


          ],
        ),
      ),
    );
  }

  Widget buildVideoPlayer() {
    if (videoPlayerController != null && videoPlayerController!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: videoPlayerController!.value.aspectRatio,
        child: VideoPlayer(videoPlayerController!),
      );
    } else {
      return Text("No video selected", style: TextStyle(color: Colors.red));
    }
  }

  Widget buildImagePreview() {
    if (media != null) {
      return Image.file(
        media!,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Text("No image selected", style: TextStyle(color: Colors.red));
    }
  }

  Future<void> onMediaSelected() async {

    final ext = media!.path.split('.').last.toLowerCase();
    isVideo = ext == 'mp4' || ext == 'mov' || ext == 'avi';

    if(isVideo)
    {
    videoPlayerController?.dispose();
    videoPlayerController = VideoPlayerController.file(File(media!.path));
    await videoPlayerController?.initialize();
    videoPlayerController?.play();
    }
  
    setState(() {
        
      }); 
  }

        
  


  Future<File?> pickVideoFromGallery() async {
   
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);

    if(video !=null)
    {
    return File(video.path);
    }
    else 
    {
      return null;
    }
  }
 
}