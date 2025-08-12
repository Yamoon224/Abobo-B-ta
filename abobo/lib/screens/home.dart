import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('PagesJaunes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Conteneur jaune pour la recherche
            Container(
              color: Colors.yellow,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Onglets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTab('Explorer', isSelected: true),
                      _buildTab('PagesBlanches'),
                      _buildTab('Annuaire inversé'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Barre de recherche
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Que recherchez-vous ?',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Contenu principal
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nos suggestions à proximité', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 16),

                  // ----- PARTIE MODIFIÉE -----
                  // Raccourcis avec défilement horizontal
                  SizedBox(
                    height: 90, // Hauteur fixe pour la zone de défilement
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Activation du défilement horizontal
                      child: Row(
                        children: [
                          _buildShortcut(Icons.local_hospital, 'Médecin'),
                          _buildShortcut(Icons.cake, 'Pâtisserie'),
                          _buildShortcut(Icons.build, 'Garage-AUTO'),
                          _buildShortcut(Icons.restaurant, 'Épiceries'),
                          _buildShortcut(Icons.fastfood, 'Boucherie'),
                          _buildShortcut(Icons.local_pharmacy, 'Pharmacie'),
                          // Vous pouvez en ajouter d'autres pour voir le défilement
                          _buildShortcut(Icons.hotel, 'Hôtel'),
                          _buildShortcut(Icons.store, 'Magasin'),
                        ],
                      ),
                    ),
                  ),
                  // ----- FIN DE LA PARTIE MODIFIÉE -----

                  const SizedBox(height: 20),
                  // Publicité
                  Container(
                    height: 100,
                    color: Colors.grey[200],
                    child: const Center(child: Text('PagesJaunes Publicité')),
                  ),
                  const SizedBox(height: 20),
                  // Carte d'avis
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.teal[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("ENSEMBLE", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text("Votre expérience sur PagesJaunes nous intéresse : donnez-nous votre avis !", style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.teal[400]),
                            child: const Text('JE DONNE MON AVIS'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: Colors.black, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
    );
  }

  // Fonction _buildShortcut modifiée pour l'espacement
  Widget _buildShortcut(IconData icon, String label) {
    return Padding(
      // Ajout d'un padding horizontal pour espacer les éléments
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, color: Colors.red[700], size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}