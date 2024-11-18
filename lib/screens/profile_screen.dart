import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet/constants.dart';
import 'package:projet/screens/upload_page.dart';

class ProfileScreen extends StatelessWidget {
  // Upload To App function (Incomplete)
  final picker = ImagePicker();
  Future<void> pickVideo(BuildContext context) async {
    final XFile? pickedFile =
        await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Picked video: ${pickedFile.path}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadPage(videoPath: pickedFile.path),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aucune vidéo selectée')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Mon Profil",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 3 * MediaQuery.of(context).size.width / 4,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 4,
              right: MediaQuery.of(context).size.width / 4,
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/5.jpg",
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 30, left: 35),
            child: const Text(
              "Nom d'utilisateur",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 30, left: 55),
            child: const Text("IlyasMH25"),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.all(20),
              color: green,
              child: const Row(
                children: [
                  Icon(
                    Icons.videocam,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Mes vidéos",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              pickVideo(context);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.all(20),
              color: green,
              child: const Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Ajouter une vidéo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
