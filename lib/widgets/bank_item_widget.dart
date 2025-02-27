import 'package:flutter/material.dart';
import 'package:wave/models/bankItem.dart';
import 'package:wave/screens/activation_screen.dart';


class BankItemWidget extends StatelessWidget {
  final BankItem bankItem;

  const BankItemWidget({super.key, required this.bankItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivationScreen(bankItem: bankItem),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration:  const BoxDecoration(
          color: Colors.white,
          //  border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: bankItem.bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: bankItem.img, // Image du logo
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Container(
                color: Colors.white,
                child: Text(
                  bankItem.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}