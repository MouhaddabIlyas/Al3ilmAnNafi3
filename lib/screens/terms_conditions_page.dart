import 'package:flutter/material.dart';
import 'package:projet/constants.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const Center(
                child: Text(
                  "Notre objectif",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "\"Élever la parole d’Allah\"",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF029933),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "سلام عليكم ورحمة الله وبركاته",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              Text(
                "Al عilm An Nafiع est une application qui vas te permettre par la grâce d’Allah سبحانه وتعالى "
                "d’apprendre ou d’en savoir plus, sur l’islam authentique « le Coran, la sunna du Messager ﷺ selon la "
                "compréhension des pieux prédécesseurs.",
                style: TextStyle(
                  fontSize: 16,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Il y a aussi la mise en place de partage de vidéo pour espérer une sadaka Jariya ( صدقة جارية) in sha Allah.\n"
                "Qu’Allah nous facilite et accepte nos œuvres.\n",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Amin !",
                style: TextStyle(
                  fontSize: 16,
                  color: green,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Conditions",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Conditions de partage des vidéos :\n\n"
                "🟢 La vidéo acceptée : Le savant/ étudiant en science - le thème doivent être est en relation avec la vidéo.\n\n"
                "🔴 La vidéo refusée : Le savant/ étudiant en science n’est pas en relation avec la vidéo et/ou le thème.\n\n",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
