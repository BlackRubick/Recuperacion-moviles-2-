import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRView extends StatefulWidget {
  @override
  _QRViewState createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  final MobileScannerController controller = MobileScannerController();
  bool isFlashOn = false;
  bool isScanning = true;
  String lastScannedCode = "";

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn;
                controller.toggleTorch();
              });
            },
          ),
          IconButton(
            icon: Icon(isScanning ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                isScanning = !isScanning;
                if (isScanning) {
                  controller.start();
                } else {
                  controller.stop();
                }
              });
            },
          ),
        ],
      ),
      body: Center(
        child: MobileScanner(
          controller: controller,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              if (barcode.rawValue != null &&
                  barcode.rawValue != lastScannedCode) {
                final String code = barcode.rawValue!;
                lastScannedCode = code;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Matrícula: $code')),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
