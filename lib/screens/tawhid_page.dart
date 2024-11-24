import 'package:flutter/material.dart';
import 'package:projet/constants.dart';

class TawhidPage extends StatefulWidget {
  const TawhidPage({super.key});

  @override
  _TawhidPageState createState() => _TawhidPageState();
}

class _TawhidPageState extends State<TawhidPage> {
  bool _isBoxVisible = true; // Controls whether the green box is visible

  @override
  Widget build(BuildContext context) {
    // Get screen height for responsive design
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight / 3, // Adjust height based on screen size
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/1.jpg",
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Text(
                      "Tawhid",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // White container with a slight overflow and scrolling
          Positioned(
            top: screenHeight / 3 - 30, // Overflow the top image a little
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                color: Colors.white,
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(
                    overscroll: false, // Remove glow effect
                  ),
                  child: SingleChildScrollView( // Make the white container scrollable
                    child: Column(
                      children: [
                        // Green message box inside the white container
                        if (_isBoxVisible)
                          Container(
                            color: Colors.green,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Cheikh Abderrazak Al Badr : \n\n"
                              "« Le Tawhid est la pierre angulaire de la prédication des prophètes et des messagers comme Allah تعالى le dit :\n\n"
                              "وَلَقَدْ بَعَثْنَا فِى كُلِّ أُمَّةٍ رَّسُولًا أَنِ ٱعْبُدُوا۟ ٱللَّهَ وَٱجْتَنِبُوا۟ ٱلطَّٰغُوتَ فَمِنْهُم مَّنْ هَدَى ٱللَّهُ وَمِنْهُم مَّنْ حَقَّتْ عَلَيْهِ ٱلضَّلَٰلَةُ فَسِيرُوا۟ فِى ٱلْأَرْضِ فَٱنظُرُوا۟ كَيْفَ كَانَ عَٰقِبَةُ ٱلْمُكَذِّبِينَ\n\n"
                              "16 : 36 - Nous avons envoyé dans chaque communauté un Messager, [pour leur dire]: \"Adorez Allah et écartez-vous du Tagut\". Alors Allah en guida certains, mais il y en eut qui ont été destinés a l'égarement. Parcourez donc la terre, et regardez quelle fut la fin de ceux qui traitaient [Nos messagers] de menteurs.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight * 0.02, // Smaller responsive text size
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center, // Center the text
                            ),
                          ),
                        // Circular progress indicator below the green box
                        SizedBox(height: 20), // Space between text and progress indicator
                        Container(
                          height: screenHeight/2,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(green),
                            ),
                          ),
                        ),
                        SizedBox(height: 20), // Space at the bottom
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Arrow button positioned in the top center (outside the white container)
          Positioned(
            top: screenHeight / 3 - 50, // Adjust the position above the white container
            left: MediaQuery.of(context).size.width / 2 - 20, // Center horizontally
            child: IconButton(
              icon: Icon(
                _isBoxVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: _isBoxVisible ? Colors.white : Colors.green, // White if visible, green if hidden
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isBoxVisible = !_isBoxVisible; // Toggle visibility of the green box
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
