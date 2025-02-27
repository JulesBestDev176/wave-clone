import 'package:flutter/material.dart';
import 'package:wave/models/bankItem.dart';

class ActivationScreen extends StatefulWidget {
  final BankItem bankItem;

  const ActivationScreen({super.key, required this.bankItem});

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lier votre banque ou SFD'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                child: widget.bankItem.img
            ),
            const SizedBox(height: 20),
            const Text(
              '1% de frais, plafonné à 500F',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const Text(
              'Clé d\'activation:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'HNZ2 7PY8',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Donnez cette clé à votre conseiller client.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'En utilisant cette clé d\'activation, j\'accepte\n',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'les conditions générales de Wave',
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}