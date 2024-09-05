import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'translation_provider.dart'; // Import TranslationProvider

class Page3 extends StatelessWidget {
  final String selectedLanguage;

  Page3({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TranslationProvider()..changeLanguage(selectedLanguage),
      child: MaterialApp(
        home: StickyHeaderExample(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class StickyHeaderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFDFF7CB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            backgroundColor: const Color(0xFF024206),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(10),
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.grass,
                    size: 90,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFB81C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to another page (you can pass selected language here too if needed)
                      },
                      child: Text(
                        translationProvider.translations['startButton'] ?? 'Start Now',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF024206),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildHowItWorksSection(context),
                _buildImageSection(),
                _buildAboutSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDFF7CB),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              translationProvider.translations['howItWorksTitle'] ?? 'HOW IT WORKS',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            buildStep(Icons.camera_alt, translationProvider.translations['snap'] ?? 'Snap', translationProvider.translations['snapDescription'] ?? 'Take a photo of your crops'),
            const SizedBox(height: 30),
            buildStep(Icons.location_on, translationProvider.translations['share'] ?? 'Share', translationProvider.translations['shareDescription'] ?? 'Add your location and send the photo'),
            const SizedBox(height: 30),
            buildStep(Icons.check_box, translationProvider.translations['check'] ?? 'Check', translationProvider.translations['checkDescription'] ?? 'Get instant results with solutions'),
            const SizedBox(height: 30),
            buildStep(Icons.eco, translationProvider.translations['do'] ?? 'Do', translationProvider.translations['doDescription'] ?? 'Follow the steps to treat and protect your farm'),
          ],
        ),
      ),
    );
  }

  Widget buildStep(IconData icon, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Color(0xFF024206)),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF024206),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30.0),
        child: Image.asset(
          'assets/img2.png',
          height: 239,
          width: 239,
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final translationProvider = Provider.of<TranslationProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDFF7CB),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              translationProvider.translations['aboutTitle'] ?? 'ABOUT',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF024206),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
                'At Fasal Forecast, we\'re committed to helping farmers protect their crops and boost their yields with advanced technology. Our AI-driven Crop Disease Prediction uses the latest machine learning to analyze crop images and environmental data, giving you fast and accurate disease detection.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
                'We know crop diseases can be unpredictable and costly. That’s why we’re here to support you in overcoming these challenges. Join us in our mission to make farming more productive and sustainable. Together, we can build a brighter future for agriculture.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
