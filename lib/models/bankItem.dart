import 'package:flutter/material.dart';

enum BankType { bank, sfd }

class BankItem {
  final String name;
  final Widget img;
  final Color bgColor;
  final BankType type;

  BankItem({
    required this.name,
    required this.img,
    required this.bgColor,
    required this.type,
  });
}

final bankItems = [
  BankItem(
      name: 'Banque Altantique',
      img: Image.asset(
        'assets/images/banque-atlantique.png',
      ),
      bgColor: const Color(0xfffbeadc),
      type: BankType.bank),
  BankItem(
      name: "Banque de l'Habitat du Sénégal",
      img: Image.asset(
        'assets/images/bhs.png',
      ),
      bgColor: const Color(0xffedf7e9),
      type: BankType.sfd),
  BankItem(
      name: 'Banque Islamique',
      img: Image.asset(
        'assets/images/bis.png',
      ),
      bgColor: const Color(0xffedf7e9),
      type: BankType.sfd),
  BankItem(
      name: 'BOA',
      img: Image.asset(
        'assets/images/boa.png',
      ),
      bgColor: const Color(0xffbddecc),
      type: BankType.bank),
  BankItem(
      name: 'CBAO',
      img: Image.asset(
        'assets/images/cbao.png',
      ),
      bgColor: const Color(0xffbddecc),
      type: BankType.bank),
  BankItem(
      name: 'Ecobank',
      img: Image.asset(
        'assets/images/ecobank.png',
      ),
      bgColor: const Color(0xffd8e6ed),
      type: BankType.bank),
  BankItem(
      name: 'Orabank',
      img: Image.asset(
        'assets/images/orabank.png',
      ),
      bgColor: const Color(0xffedf7e9),
      type: BankType.bank),
  BankItem(
      name: 'UBA',
      img: Image.asset(
        'assets/images/uba.png',
      ),
      bgColor: const Color.fromARGB(255, 184, 232, 166),
      type: BankType.bank),
];