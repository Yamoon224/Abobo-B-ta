import 'package:flutter/material.dart';

class Explorer extends StatefulWidget {
  const Explorer({super.key});

  @override
  State<Explorer> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<Explorer> {
  // Simuler un état d'erreur
  final bool _hasError = true;

  @override
  void initState() {
    super.initState();
    // Affiche la pop-up de bienvenue après le premier rendu
    WidgetsBinding.instance.addPostFrameCallback((_) => _showWelcomeDialog());
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image(asset: AssetImage('assets/images/professionals_map.png')), // Votre image ici
              const SizedBox(height: 20),
              const Text(
                'Les professionnels autour de vous',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Sélectionnez une catégorie et identifiez sur la carte les professionnels correspondant à vos besoins.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[300],
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text('JE ME LANCE !'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorer'),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Placeholder pour la carte Google Maps
          Container(
            color: const Color(0xFFF5F5DC), // Couleur de fond beige
            child: const Center(
              child: Text('Google Maps Placeholder'),
            ),
          ),

          // Affichage du message d'erreur - SOLUTION 1: Augmenter la hauteur
          if (_hasError)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 220, // Augmenté de 200 à 220 pixels
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.blue, size: 40),
                    const SizedBox(height: 10),
                    const Text(
                      'Une erreur technique est survenue',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Nous nous excusons pour la gêne occasionnée. Veuillez réessayer ultérieurement.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 15),
                    OutlinedButton(
                      onPressed: () {
                        // Logique pour réessayer
                      },
                      child: const Text('RÉESSAYER'),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}