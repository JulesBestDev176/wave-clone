import 'package:flutter/material.dart';
import 'package:wave/models/country.dart';

class PhoneInputField extends StatefulWidget {
  final ValueChanged<String>? onPhoneNumberChanged;
  final String initialPhoneNumber; // Nouveau paramètre

  const PhoneInputField({
    Key? key,
    this.onPhoneNumberChanged,
    required this.initialPhoneNumber, // Initialisation du paramètre
  }) : super(key: key);

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  late TextEditingController _controller; // Controller pour le TextField
  CountryModel selectedCountry = const CountryModel(
    name: 'Sénégal',
    code: '+221',
    indicator: 'assets/images/pays/SN.png',
  );

  final List<CountryModel> countries = [
    const CountryModel(name: 'Burkina Faso', code: '+226', indicator: 'assets/images/pays/BF.png'),
    const CountryModel(name: 'Code d\'Ivoire', code: '+225', indicator: 'assets/images/pays/CI.png'),
    const CountryModel(name: 'Mail', code: '+223', indicator: 'assets/images/pays/ML.png'),
    const CountryModel(name: 'Sénégal', code: '+221', indicator: 'assets/images/pays/SN.png'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialPhoneNumber); // Initialisation du controller
  }

  @override
  void didUpdateWidget(PhoneInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Mettre à jour le contrôleur si la valeur initiale change
    if (widget.initialPhoneNumber != oldWidget.initialPhoneNumber) {
      _controller.text = widget.initialPhoneNumber;
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Nettoyage du controller
    super.dispose();
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            // Bouton "Annuler" et titre "Sélectionnez votre pays"
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Row(
                children: [
                  // Bouton "Annuler"
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Fermer le modal
                    },
                    child: const Text(
                      'Annuler',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const  Expanded(
                    child: Center(
                      child: const Text(
                        'Sélectionnez votre pays',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: Image.asset(
                      country.indicator,
                      width: 24,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      country.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      country.code,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    onTap: () {
                      setState(() {
                        selectedCountry = country;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
  String _getPhoneNumberFormat() {
    if (selectedCountry.code == '+221') {
      return '7X XXX XX XX'; // Format pour le Sénégal
    } else {
      return 'XX XX XX XX'; // Format par défaut pour les autres pays
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Indicatif pays avec drapeau
          GestureDetector(
            onTap: _showCountryPicker,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.blue.shade200, width: 2),
                ),
              ),
              child: Row(
                children: [
                  // Drapeau du pays
                  Image.asset(
                    selectedCountry.indicator,
                    width: 24,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  Text(selectedCountry.code),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),

          // Champ de saisie du numéro
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.blue.shade200, width: 2),
                ),
              ),
              child: TextField(
                controller: _controller, // Utilisation du controller
                decoration: InputDecoration(
                  hintText: _getPhoneNumberFormat(), // Format dynamique
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 16, color: Colors.black),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (widget.onPhoneNumberChanged != null) {
                    widget.onPhoneNumberChanged!(value); // Mise à jour du numéro
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}