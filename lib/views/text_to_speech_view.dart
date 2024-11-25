import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechView extends StatefulWidget {
  @override
  _TextToSpeechViewState createState() => _TextToSpeechViewState();
}

class _TextToSpeechViewState extends State<TextToSpeechView> {
  FlutterTts flutterTts = FlutterTts();
  String _text = 'Escribe algo para convertirlo en voz';

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF4CAF50);
    const Color backgroundColor = Color(0xFFF8F9FA);

    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            Text(
              'Escribe el texto:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            // Campo de texto
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (val) => setState(() => _text = val),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  hintText: 'Ingresa el texto aquí',
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
            const SizedBox(height: 30),
            // Botón para escuchar el texto
            ElevatedButton(
              onPressed: _speak,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Escuchar Texto',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Future _speak() async {
    await flutterTts.speak(_text);
  }
}
