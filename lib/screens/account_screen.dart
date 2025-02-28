import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave/widgets/phone_input_widget.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  // Variable pour stocker le numéro de téléphone entré
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Ajouter un autre compte',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Zone supérieure avec l'image, le texte et le champ de saisie
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Image d'illustration et texte
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 120,
                        child: Stack(
                          children: [
                            // Phone images and penguin icon
                            Positioned(
                              left: 20,
                              bottom: 20,
                              child: Container(
                                width: 60,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.phone_android, color: Colors.blue),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 90,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(Icons.person, color: Colors.black, size: 30),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              bottom: 20,
                              child: Container(
                                width: 60,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.phone_android, color: Colors.blue),
                              ),
                            ),
                            // Flèches
                            Positioned(
                              left: 70,
                              top: 25,
                              child: Icon(Icons.arrow_back, color: Colors.purple.shade300),
                            ),
                            Positioned(
                              right: 70,
                              top: 25,
                              child: Icon(Icons.arrow_forward, color: Colors.purple.shade300),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Texte d'instruction
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Entrez le numéro de mobile que vous souhaitez ajouter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Utilisation du composant PhoneInputField
                    PhoneInputField(
                      initialPhoneNumber: phoneNumber, // Passage de la valeur
                      onPhoneNumberChanged: (value) {
                        setState(() {
                          phoneNumber = value; // Mise à jour de la valeur
                        });
                      },
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),

            // Bouton Suivant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: phoneNumber.isNotEmpty ? () {
                  // Action à effectuer quand on clique sur Suivant
                  print('Numéro de téléphone saisi : $phoneNumber');
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue.shade200,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  disabledBackgroundColor: Colors.lightBlue.shade100,
                ),
                child: const Text(
                  'Suivant',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  // Méthode pour construire les boutons du clavier
  Widget _buildKeypadButton(String number, String letters) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Limite à 9 chiffres pour le numéro (sans compter l'indicatif +221)
          if (phoneNumber.length < 9) {
            setState(() {
              phoneNumber += number;
            });
          }
        },
        child: Container(
          height: 50, // Réduit la hauteur du bouton
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(fontSize: 20), // Police réduite
              ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: const TextStyle(fontSize: 9), // Police réduite
                ),
            ],
          ),
        ),
      ),
    );
  }
}