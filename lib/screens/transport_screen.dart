import 'package:flutter/material.dart';
import 'package:wave/models/trajetFavoris.dart';
import 'package:wave/screens/arret_screen.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Acheter un billet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        //leading: const Icon(Icons.arrow_back),
      ),
      body: Column(

        children: [
          Expanded(


            child: SingleChildScrollView(
              child: Container(
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SunuBRT Card
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset('assets/images/sunubrt.png'),
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'SunuBRT',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Selection Card
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // Departure Selection
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const ArretScreen(type: "Depart");
                                  }));
                                },
                                child: const Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sélectionner le départ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                              ),

                              Row(
                                children: [
                                  Expanded(child: Divider(thickness: 2, height: 32)),
                                  Transform.translate(
                                    offset:  Offset(-50, 0),
                                    child: Container(

                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue.withOpacity(0.2),
                                        shape: BoxShape.circle,

                                      ),
                                      child: const Icon(
                                        Icons.swap_vert,
                                        color: Colors.lightBlue,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ]
                              ),


                              // Arrival Selection
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return const ArretScreen(type: "Arrive");
                                    }));
                                  },
                                  child: const Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sélectionner l\'arrivée',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Info Text
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'Les tickets sont valables une heure.',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Achetez votre ticket quand vous êtes prêt à partir.',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Purchase Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Acheter un billet',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Purchase Again Section
                      const Text(
                        'Acheter à nouveau',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Frequent Routes Card
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,

                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          //child: cardVideWidget()
                            child: trajetWidget()
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )


    );
  }
}

Widget cardVideWidget( ) {
  return const Padding(

    padding: EdgeInsets.all(16.0),
    child: Column(

      children: [
        Icon(
          Icons.favorite_border,
          color: Colors.grey,
          size: 28,
        ),
        SizedBox(height: 16),
        Text(
          'Les itinéraires fréquents apparaîtront ici.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Appuyez sur "Départ" pour commencer.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget trajetWidget() {
  return Container(

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: TrajetFavoris.trajets.length,
      itemBuilder: (context, index)  {
        TrajetFavoris t = TrajetFavoris.trajets[index];
        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_downward)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${t.depart.toString()}"),
                          Text("${t.arrive.toString()}")
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text("CFA"),
                            ),
                            Text(t.prix.toString())
                          ],
                        ),

                      ],
                    )


                  ],
                ),
              ),
              TrajetFavoris.trajets.length == index + 1 ?
               Row()
              :Row(
                children: [
                  Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,

                      )
                  )
                ]
              )

            ],
          )

        );
      },
    )
  );
}