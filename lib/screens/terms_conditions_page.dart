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
                  "Notre But",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
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
                "Conditions à respecter :\n\n"
                "🔺Interdiction de publier des vidéos de Fitna (terrorisme, sectarisme etc…)\n\n"
                "🔺Pas de vidéo de plus de 3 minutes\n\n"
                "🔺Au bout de 2 vidéos supprimées de votre compte vous serez banni de la plate-forme\n\n"
                "⚠ Toute vidéo en contradiction avec le Coran, la sunna et la compréhension des pieux prédécesseurs sera supprimée ⚠",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
