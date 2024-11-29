import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}
void succesAlert(BuildContext context){
   Alert(
    context: context,
    type: AlertType.success,
    title: "Succes",
    desc: "Selamat anda berhasil membuat sebuah QR",
    buttons: [
      DialogButton(
        child: const Text(
          "Yes",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () => Navigator.pop(context),
      )
    ],
  ).show();
  return;
}


class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrRawValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/scan");
            },
            icon: const Icon(Icons.qr_code_scanner),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  "Generate to Barcode",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Generate your Link here",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (qrRawValue != null)
              Container(
                padding: const EdgeInsets.all(30.0), // Padding di sekitar QR Code
                decoration: BoxDecoration(
                  color: Colors.purple[50], // Background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  border: Border.all(color: const Color(0xFF494AE2), width:2 ), // Border color
                ),
                child: PrettyQr(
                  data: qrRawValue!,
                  size: 300, // Data QR Code
                ),
              ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      qrRawValue = null;
                    });
                  },
                ),
                labelText: 'Enter your code here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  qrRawValue = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () 
                => succesAlert(context),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF494AE2),
                padding: const EdgeInsets.symmetric(horizontal:70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)
                )
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
               
                child: Text("Save",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            )
          )
          ],
        ),
      ),
    );
  }
}
