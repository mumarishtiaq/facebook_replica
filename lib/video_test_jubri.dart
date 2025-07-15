import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickerScreen extends StatefulWidget {
  const VideoPickerScreen({super.key});

  @override
  _VideoPickerScreenState createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  XFile? _pickedVideo;
  VideoPlayerController? _videoController;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final picked = await picker.pickVideo(source: ImageSource.gallery);

    if (picked != null) {
      _pickedVideo = picked;

      _videoController?.dispose(); // Dispose previous
      _videoController = VideoPlayerController.file(File(picked.path));

      await _videoController!.initialize(); // must initialize
      _videoController!.setLooping(true);
      _videoController!.play();

      setState(() {}); // Refresh UI
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick & Play Video")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickVideo,
            child: Text("Pick Video from Gallery"),
          ),
          SizedBox(height: 20),
          _videoController != null && _videoController!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                )
              : Text("No video selected"),
        ],
      ),
      floatingActionButton: _videoController != null &&
              _videoController!.value.isInitialized
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _videoController!.value.isPlaying
                      ? _videoController!.pause()
                      : _videoController!.play();
                });
              },
              child: Icon(
                _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            )
          : null,
    );
  }
}
