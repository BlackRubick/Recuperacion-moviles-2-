import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir el enlace de GitHub

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  // Función para abrir la URL de GitHub
  Future<void> _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color accentBlue = Color(0xFF76A0D1);
    const Color backgroundColor = Color(0xFFF5F5F5);
    const Color cardColor = Color(0xFFFFFFFF);
    const Color textColor = Color(0xFF333333);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contenedor estilizado para el logo
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  'asset/img/uplogo.jpg',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 20),
              // Contenedor estilizado para la información personal
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    Text(
                      'Cesar Gomez Aguilera',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: accentBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '213507',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Botón estilizado para el enlace de GitHub
              ElevatedButton.icon(
                onPressed: _launchGitHub,
                icon: const Icon(Icons.link, color: Colors.white),
                label: const Text(
                  'Visitar GitHub',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Color(0xFF4CAF50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
