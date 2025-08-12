import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_app_screen.dart';
import 'screens/add_city.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _onFinish(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    // Navigate to MainAppScreen et replace l’onboarding
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainAppScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          _buildOnboardingPage(
            color: const Color(0xFF00B8D4),
            imagePath: 'assets/images/location_pin.png', // Remplacez par votre image
            title1: 'Le choix',
            title2: 'LOCAL',
            subtitle: 'Prenez place dans votre quartier ou votre ville et interagissez avec les commerçants, les professionnels proches de vous.',
            buttonText: 'SUIVANT',
            onButtonPressed: () {
              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
            },
          ),
          _buildOnboardingPage(
            color: const Color(0xFF8E44AD),
            imagePath: 'assets/images/chat_bubble.png', // Remplacez par votre image
            title1: 'Restons',
            title2: 'CONNECTÉS',
            subtitle: 'Cette appli a été pensée avec vous... et ce n\'est qu\'un début ! Un espace est dédié à vos remarques en page d\'accueil.',
            buttonText: 'SUIVANT',
            onButtonPressed: () {
              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
            },
          ),
          _buildOnboardingPage(
            color: const Color(0xFFE91E63),
            imagePath: 'assets/images/heart_hands.png', // Remplacez par votre image
            title1: 'Plus près',
            title2: 'de VOUS',
            subtitle: 'Enregistrez vos villes ou quartiers préférés pour découvrir nos recommandations de professionnels.',
            buttonText: 'AJOUTER UNE VILLE',
            onButtonPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddCityScreen()));
            },
          ),
        ],
      )
    );
  }

  Widget _buildOnboardingPage({
    required Color color,
    required String imagePath,
    required String title1,
    required String title2,
    required String subtitle,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) => Container(
    color: color,
    child: Column(
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(imagePath), height: 150), // Décommentez quand vous avez l'image
                const SizedBox(height: 50),
                _buildTitle(title1, title2),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => _buildDot(index, context)),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainAppScreen()));
                      },
                      child: const Text('IGNORER', style: TextStyle(color: Colors.grey)),
                    ),
                    ElevatedButton(
                      onPressed: onButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color == const Color(0xFFE91E63) ? color : const Color(0xFF0D47A1),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                      child: Text(buttonText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildTitle(String text1, String text2) => Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          color: Colors.white,
          child: Text(
            text1,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          color: Colors.yellow,
          child: Text(
            text2,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );

  Widget _buildDot(int index, BuildContext context) => Container(
    height: 10,
    width: _currentPage == index ? 25 : 10,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: _currentPage == index ? Colors.purple : Colors.grey.shade300,
    ),
  );
}