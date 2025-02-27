import 'package:flutter/material.dart';

class Arret {
  final String name;

  Arret({required this.name});
}

class Zone {
  final String name;
  final List<Arret> arrets;

  Zone({required this.name, required this.arrets});

  static List<Zone> zones = [
    Zone(
      name: 'Zone Guédiawaye',
      arrets: [
        Arret(name: 'Prefecture de Guediawaye'),
        Arret(name: 'Golf Nord'),
        Arret(name: 'Hôpital Dalal Jam'),
        Arret(name: 'Golf Sud'),
        Arret(name: 'Ndingala'),
        Arret(name: 'Parcelles'),
      ]),
    Zone(
      name: 'Zone Grand Médine',
      arrets: [
        Arret(name: 'Croisement 22'),
        Arret(name: 'Police des Parcelles'),
        Arret(name: 'Grand Médine'),
        Arret(name: 'Cardinal Hyacinthe Thiandoum'),
        Arret(name: 'Scat Urbann'),
        Arret(name: 'Khar Yalla'),
      ],
    ),
    Zone(
        name: 'Zone Petersen',
        arrets: [
          Arret(name: 'Liberté 6'),
          Arret(name: 'Liberté 5'),
          Arret(name: 'Sacré-Coeur'),
          Arret(name: 'Liberté 1'),
          Arret(name: 'Grand Dakar'),
          Arret(name: 'Dial Diop'),
          Arret(name: 'Place de la Nation'),
          Arret(name: 'Grande Mosquée'),
          Arret(name: 'Pape Gueye Fall (Petersen)'),
        ],
    )
  ];

}
