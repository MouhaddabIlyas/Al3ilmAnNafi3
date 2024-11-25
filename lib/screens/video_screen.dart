import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  bool isPlaying = false; // To track the playing state of the video
  bool isFavorite = false; // To track the favorite state of the heart icon

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the video URL (a publicly accessible video)
    _videoPlayerController = VideoPlayerController.network(
      'https://www.w3schools.com/html/mov_bbb.mp4', // Sample video URL
    );

    _videoPlayerController.setLooping(true); // Optional: Loop the video
    _videoPlayerController.setVolume(1.0); // Optional: Set volume to 100%

    // Initialize the video and start playing once initialized
    _videoPlayerController.initialize().then((_) {
      setState(() {}); // Refresh the UI after video is initialized
      _videoPlayerController.play(); // Play the video after initialization
      setState(() {
        isPlaying = true; // Set initial state to playing
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose(); // Dispose of the controller when done
  }

  // Function to toggle play/pause
  void togglePlayPause() {
    setState(() {
      if (isPlaying) {
        _videoPlayerController.pause(); // Pause the video
      } else {
        _videoPlayerController.play(); // Play the video
      }
      isPlaying = !isPlaying; // Toggle the play/pause state
    });
  }

  // Function to toggle favorite (heart)
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle favorite state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Video player fills most of the screen
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.green, // Custom green color for the progress indicator
                    ),
                  ),
          ),
          
          // Top text "Title" with updated background opacity and regular font weight
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.black.withOpacity(0.3), // Reduced opacity for background
              child: Text(
                'bunny',
                style: TextStyle(
                  fontSize: 12, // Adjusted font size to 12 pixels
                  fontWeight: FontWeight.normal, // Regular font weight
                  color: Colors.white,
                ),
                maxLines: null, // Allow multiple lines
                softWrap: true, // Enable text wrapping
                overflow: TextOverflow.visible, // Ensure text doesn't get cut off
              ),
            ),
          ),
          
          // Bottom row containing Avatar, Play/Pause Button, and Favorite Button
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Equally spaced elements
              children: [
                // CircleAvatar with image (left)
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/profiles/profile1.PNG'),
                  backgroundColor: Colors.black,
                ),
                
                // Play/Pause button (centered)
                IconButton(
                  onPressed: togglePlayPause, // Toggle play/pause
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow, // Change icon based on play/pause state
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                
                // Heart icon button (right)
                IconButton(
                  onPressed: toggleFavorite, // Toggle favorite state
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border, // Filled or outlined heart
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
