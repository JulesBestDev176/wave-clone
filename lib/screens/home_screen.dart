import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wave/models/options.dart';
import 'package:wave/models/transaction.dart';
import 'package:wave/screens/bank_screen.dart';
import 'package:wave/screens/credit_screen.dart';
import 'package:wave/screens/settings_screen.dart';
import 'package:wave/screens/transfer_screen.dart';
import 'package:wave/screens/transport_screen.dart';
import 'package:wave/widgets/card_widget.dart';
import 'package:intl/intl.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = true;
  List<Option> optionList = [
    Option(title : "Transfert", icon: Icons.person, color: const Color(0xff4749cd)),
    Option(title : "Paiements", icon: Icons.shopping_basket, color: Colors.orange),
    Option(title : "Crédit", icon: Icons.phone_android_outlined, color: Colors.blue),
    Option(title : "Banque", icon: Icons.account_balance_sharp, color: Colors.red),
    Option(title : "Cadeaux", icon: Icons.card_giftcard_outlined, color: Colors.green),
    Option(title : "Transport", icon: Icons.bus_alert_outlined, color: Colors.yellow),

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 90,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SettingsScreen();
            }));
            },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: isVisible ? "10.285.521" : "••••••••••",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: isVisible ? "F" : "",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 210,
                  child: Stack(
                    children: [
                      Container(
                        color: Theme.of(context).primaryColor,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          height: 60,
                        ),
                      ),
                      const CardWidget(
                        isClickable: true,
                      )
                    ],
                  ),
                ),
                Container(

                  color: Colors.white,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4
                    ),
                    itemCount: optionList.length,
                    itemBuilder: (context, index) {
                      Option o = optionList[index];
                      return optionWidget(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const OperationScreen(
                                      isTransfer: true,
                                    );
                                  },
                                ));
                                break;
                              case 2:
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const CreditScreen();
                                  },
                                ));
                                break;

                              case 3:
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const BankScreen();
                                  },
                                ));
                                break;
                              case 5:
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const TransportScreen();
                                  },
                                ));
                                break;

                            }
                          },
                          title: o.title!,
                          icon: o.icon!,
                          color: o.color!
                      );

                    },
                     // Ajustez selon le nombre d'éléments nécessaires
                  ),
                ),
                Divider(
                  thickness: 4,
                  height: 5,
                  color: Colors.grey.shade300,
                ),
                Container(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: Transaction.tList.length,
                    itemBuilder: (context, index) {
                      Transaction t = Transaction.tList[index];
                      bool debit = t.type == TransactionType.transfertE ||
                          t.type == TransactionType.deposit
                          ? true
                          : false;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${t.type == TransactionType.transfertE ? "De" : t.type == TransactionType.transfertS ? "A" : ""} ${t.title}",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text("${debit ? "" : "-"}${t.amount}F",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              t.date.toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(

                    decoration: BoxDecoration(

                      color: Theme.of(context).primaryColor.withOpacity(.3),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 40,
                    width: 130,
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 20, color: Color(0xff4749cd)),
                          SizedBox(width: 5),
                          Text(
                            "Rechercher",
                            style: TextStyle(
                              color: Color(0xff4749cd),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )

                  ),
                ),
                const SizedBox(
                  height: 1000,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget optionWidget({required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap:onTap,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Icon(
                icon,
                size: 35,
                color: color,
              )
          ),
          const SizedBox(
            height: 5,
          ),
          Text(title)
        ],
      ),
    );
  }

  String formatAmount(int amount) {
    final number = amount.toString();
    final buffer = StringBuffer();

    // Ajoute un point tous les trois chiffres
    for (int i = 0; i < number.length; i++) {
      if (i > 0 && (number.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(number[i]);
    }

    return buffer.toString();
  }
}
