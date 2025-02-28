import 'package:flutter/material.dart';
import 'package:wave/models/items.dart';

class PlafondScreen extends StatefulWidget {
  const PlafondScreen({super.key});

  @override
  State<PlafondScreen> createState() => _PlafondScreenState();
}

class _PlafondScreenState extends State<PlafondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plafonds du Compte'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Plafonds Actuels',
                style: TextStyle(color: Colors.grey)
              ),
              Card(

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: Padding(

                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                            itemCount: ItemPl.itemsPl.length,
                            itemBuilder: (context, index) {
                              final item = ItemPl.itemsPl[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name),
                                    Row(
                                      children: [
                                        Text(
                                            item.value.toString(),
                                            style: const TextStyle(
                                                color: Colors.grey
                                            )
                                        ),
                                        SizedBox(width: 5),
                                        const Text(
                                            'F',
                                          style: TextStyle(
                                            color: Colors.grey
                                          )
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              );
                            }
                        ),
                    ),
                    ),
                )
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(45),
                      ),
                        child: const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),



                    ),
                  ),
                  Text('Votre compte dispose du plafond maximum alloué')

                ],
              )

            ],
          )
      )
    );
  }
}
