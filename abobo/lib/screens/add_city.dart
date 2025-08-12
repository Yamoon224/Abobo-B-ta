import 'package:flutter/material.dart';
import '../main_app_screen.dart'; // Pour y naviguer après

class AddCityScreen extends StatelessWidget {
  const AddCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Permet de sauter cette étape et d'aller à l'accueil
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainAppScreen()),
            );
          },
        ),
        title: const Text('Ajouter une ville', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Saisir ma ville ou code postal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                // Logique pour utiliser la géolocalisation
                // Puis naviguer vers l'accueil
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainAppScreen()),
                );
              },
              icon: const Icon(Icons.my_location),
              label: const Text('Utiliser ma position'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal[300],
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
              ),
            ),
          ],
        ),
      ),
    );
  }
}