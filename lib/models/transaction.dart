import 'package:flutter/material.dart';

class Transaction {
  int amount;
  DateTime date;
  String title;
  TransactionType type;

  Transaction(
      {required this.amount,
        required this.date,
        required this.title,
        required this.type
      });
  static List<Transaction> tList = [
    Transaction(amount: 3000000, date: DateTime.now(), title: 'Depot', type: TransactionType.deposit),
    Transaction(amount: 3500000, date: DateTime.now().subtract(Duration(days: 1)), title: 'Retrait', type: TransactionType.withdraw),
    Transaction(amount: 6000000, date: DateTime.now().subtract(Duration(days: 2)), title: 'Modou Fall 77 382 17 61', type: TransactionType.transfertE),
    Transaction(amount: 3500000, date: DateTime.now().subtract(Duration(days: 3)), title: 'Madame Ndiaye', type: TransactionType.transfertS),
    Transaction(amount: 5000000, date: DateTime.now().subtract(Duration(days: 4)), title: 'Canal +', type: TransactionType.operation)
  ];
}

enum TransactionType {
  deposit,
  operation,
  withdraw,
  transfertE,
  transfertS
}