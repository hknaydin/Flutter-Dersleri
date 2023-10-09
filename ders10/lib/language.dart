import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'English'; // Başlangıçta seçilen dil

  final List<String> languages = ['English', 'Türkçe', 'Français', '中文'];

  final Map<String, String> flagImages = {
    'English': 'assets/images/countries/flag_australia.png',
    'Türkçe': 'assets/images/countries/flag_tr.png',
    'Français': 'assets/images/countries/flag_france.png',
    '中文': 'assets/images/countries/flag_china.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(flagImages[_selectedLanguage] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(flagImages[language] ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(language),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
