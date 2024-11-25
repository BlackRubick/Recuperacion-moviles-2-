import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF0F4F8);
    const TextStyle titleStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    const TextStyle valueStyle = TextStyle(
      fontSize: 16,
      color: Colors.black87,
    );

    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Acelerómetro
            _buildSensorCard(
              title: 'Acelerómetro',
              icon: Icons.speed,
              stream: accelerometerEvents,
              titleStyle: titleStyle,
              valueStyle: valueStyle,
            ),
            // Giroscopio
            _buildSensorCard(
              title: 'Giroscopio',
              icon: Icons.rotate_right,
              stream: gyroscopeEvents,
              titleStyle: titleStyle,
              valueStyle: valueStyle,
            ),
            // Magnetómetro
            _buildSensorCard(
              title: 'Magnetómetro',
              icon: Icons.explore,
              stream: magnetometerEvents,
              titleStyle: titleStyle,
              valueStyle: valueStyle,
              unit: 'μT',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorCard<T>({
    required String title,
    required IconData icon,
    required Stream<T> stream,
    required TextStyle titleStyle,
    required TextStyle valueStyle,
    String? unit,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icono
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF4A90E2),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 20),
            // Contenido del sensor
            Expanded(
              child: StreamBuilder<T>(
                stream: stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as dynamic;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: titleStyle),
                        const SizedBox(height: 10),
                        Text('X: ${data.x.toStringAsFixed(2)} ${unit ?? ''}', style: valueStyle),
                        Text('Y: ${data.y.toStringAsFixed(2)} ${unit ?? ''}', style: valueStyle),
                        Text('Z: ${data.z.toStringAsFixed(2)} ${unit ?? ''}', style: valueStyle),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
