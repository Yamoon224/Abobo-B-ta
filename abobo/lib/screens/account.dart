import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<Account> {
  @override
  void initState() {
    super.initState();
    // Affiche la pop-up d'avis après le premier rendu
    WidgetsBinding.instance.addPostFrameCallback((_) => _showFeedbackDialog());
  }

  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Titre stylisé
              Stack(
                alignment: Alignment.center,
                children: [
                  Text('VOTRE AVIS', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, backgroundColor: Colors.cyan[200])),
                  Positioned(
                      top: 25,
                      child: Text('COMPTE !', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, backgroundColor: Colors.yellow))
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Vous utilisez régulièrement notre application ?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Text(
                'Aidez-nous à l\'améliorer en rejoignant notre panel de testeurs exclusifs !',
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
                child: const Text('Je participe'),
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
        title: const Text('Compte'),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.account_circle_outlined, size: 80, color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              'Connectez-vous pour accéder à plus de fonctionnalités',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Avec votre compte, partagez vos expériences, synchronisez vos favoris et retrouvez vos RDV !',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[400],
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('S\'INSCRIRE / SE CONNECTER'),
            )
          ],
        ),
      ),
    );
  }
}