import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave/models/arrets.dart';

class ArretsScreen extends StatefulWidget {
  const ArretsScreen({super.key});

  @override
  State<ArretsScreen> createState() => _ArretsScreenState();
}

class _ArretsScreenState extends State<ArretsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélectionner le départ'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded( // Permet à la carte de prendre tout l’espace restant
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: VerticalDivider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                            ),
                            Expanded( // Permet au `ListView.builder` d'occuper tout l'espace restant
                              child: ListView.builder(
                                itemCount: Zone.zones.length,
                                itemBuilder: (context, index) {
                                  Zone z = Zone.zones[index];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          z.name,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(), // Empêche le conflit de scroll
                                        itemCount: z.arrets.length,
                                        itemBuilder: (context, index) {
                                          Arret a = z.arrets[index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.circle,
                                                ),
                                                Text(a.name)
                                              ]
                                            )
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
