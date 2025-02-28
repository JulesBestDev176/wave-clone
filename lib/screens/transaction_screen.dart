import 'package:flutter/material.dart';
import 'package:wave/models/transaction.dart';
import 'package:wave/widgets/prefix_search_widget.dart';

/// Enum pour distinguer l'onglet sélectionné
enum ActionType { transfert, facture }

class TransactionScreen extends StatefulWidget {
  static String routeName = '/transactions';

  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => TransactionScreenState();
}

class TransactionScreenState extends State<TransactionScreen> {
  ActionType? selectedType;
  final controller = TextEditingController();
  late List<Transaction> transactionItems;

  List<Transaction> _filterTransactionsByType(ActionType type) {
    if (type == ActionType.transfert) {
      return transactionItems.where((tx) =>
      tx.type == TransactionType.deposit ||
          tx.type == TransactionType.withdraw ||
          tx.type == TransactionType.transfertE ||
          tx.type == TransactionType.transfertS).toList();
    } else {
      return transactionItems.where((tx) =>
      tx.type == TransactionType.operation).toList();
    }
  }

  List<Transaction> getMergedTransactions() {
    if (selectedType == null) {
      return transactionItems;
    } else {
      return _filterTransactionsByType(selectedType!);
    }
  }

  void filterTransactions() {
    final text = controller.text.trim().toLowerCase();
    setState(() {
      transactionItems = Transaction.tList
          .where((tx) => tx.title.toLowerCase().contains(text))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    transactionItems = List<Transaction>.from(Transaction.tList);
    controller.addListener(filterTransactions);
  }

  @override
  void dispose() {
    controller.removeListener(filterTransactions);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Transactions'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: PrefixSearchField(
              prefix: null,
              controller: controller,
              hintText: 'Rechercher ',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            child: Row(
              children: [
                TabSwitcher(
                  onPressed: () {
                    setState(() {
                      selectedType = (selectedType == ActionType.transfert)
                          ? null
                          : ActionType.transfert;
                    });
                  },
                  selected: selectedType == ActionType.transfert,
                  label: 'Transferts',
                  icon: Icons.person,
                ),
                const SizedBox(width: 12),
                TabSwitcher(
                  onPressed: () {
                    setState(() {
                      selectedType = (selectedType == ActionType.facture)
                          ? null
                          : ActionType.facture;
                    });
                  },
                  selected: selectedType == ActionType.facture,
                  label: 'Factures',
                  icon: Icons.lightbulb,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: getMergedTransactions().length,
                itemBuilder: (context, index) {
                  Transaction t = getMergedTransactions()[index];

                  // Détermine si la transaction est un crédit ou un débit
                  bool credit = t.type == TransactionType.transfertE || t.type == TransactionType.deposit;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${t.type == TransactionType.transfertE ? "De" : t.type == TransactionType.transfertS ? "A" : ""} ${t.title}",
                                style: const TextStyle(
                                  color: Color(0xff4749cd),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "${credit ? "" : "-"}${t.amount}F",
                              style: TextStyle(
                                color:Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          t.date.toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabSwitcher extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const TabSwitcher({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
        backgroundColor: WidgetStatePropertyAll(
          Colors.black12.withOpacity(selected ? 0.32 : 0.08),
        ),
      ),
      onPressed: onPressed,
      icon: Row(
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}