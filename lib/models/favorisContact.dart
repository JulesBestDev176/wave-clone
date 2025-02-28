import 'package:flutter_contacts/flutter_contacts.dart';

class FavorisContact {
  static final List<Contact> _favoris = [];

  static List<Contact> get favoris => _favoris;

  static void ajouterOuSupprimer(Contact contact) {
    if (_favoris.contains(contact)) {
      _favoris.remove(contact);
    } else {
      _favoris.add(contact);
    }
  }

  static bool estFavori(Contact contact) {
    return _favoris.contains(contact);
  }
}
