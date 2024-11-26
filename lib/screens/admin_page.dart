import 'package:flutter/material.dart';
import 'package:projet/constants.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool _isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 200; // You can adjust this width as needed.

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: buttonWidth, // Set the same width for both buttons
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/admin_video_page');
                  //Navigator.pushReplacementNamed(context, '/admin_video_page');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text(
                  "Espace Admin",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20), // Space between buttons
            SizedBox(
              width: buttonWidth, // Set the same width for both buttons
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                  //Navigator.pushReplacementNamed(context, '/home');
                  // Dialog TEST
                  setState(() {
                    _isDialogOpen = true;
                  });
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          color: Colors.white,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Center(
                              child: Text(
                                "Félicitations!\nVotre vidéo a été approuvée!!!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((_) {
                    setState(() {
                      _isDialogOpen = false;
                    });
                  });
                  // Dialog TEST END
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                ),
                child: Text(
                  "Espace Utilisateur",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
