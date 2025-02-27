import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
          const Text('Paramètres', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
            child: CustomScrollView(slivers: [

              SliverToBoxAdapter(
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Compte',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      Icons.account_box_outlined,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Ajouter un autre compte",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Partager',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      CupertinoIcons.share,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Inviter un ami à rejoindre Wave",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      CupertinoIcons.sparkles,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Utiliser le code promotionnel",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assistance',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      CupertinoIcons.phone_fill,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Contactez le service client",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Trouvez les agents à proximité",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      CupertinoIcons.square_favorites_fill,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Vérifiez votre plafond",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),



                            ],
                          ),
                        ),
                      ],
                    )
                ),

              ),
              SliverToBoxAdapter(
                child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sécurité',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      Icons.phone_android,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Vos appareils connectés",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: const Row(
                                  children:  [
                                    Icon(
                                      CupertinoIcons.shield_lefthalf_fill,
                                      size: 30,
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(child: Text(
                                      "Modifier votre code secret",
                                      style: TextStyle(fontSize: 16),
                                    ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
              SliverToBoxAdapter(child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16,),
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const Row(
                    children:  [
                      Icon(
                        Icons.logout_outlined,
                        size: 30,
                      ),
                      const SizedBox(width: 16),
                      Flexible(child: Row(
                        children: const [
                          Text(
                            "Se déconnecter",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "(77 715 10 61)",
                            style: TextStyle(fontSize: 16,color: Colors.grey),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Image.asset("assets/images/uba.png",height: 25,color: Colors.grey.shade400,),
                      //     const SizedBox(width: 10),
                      //     Image.asset("assets/images/ecobank.png",height: 25,color: Colors.grey.shade400,),
                      //   ],
                      // ),
                      const SizedBox(height: 10),
                      Text("wave digital finance",
                        style: TextStyle(fontSize: 11,color: Colors.grey.shade400),),
                      const SizedBox(height: 10),
                      Text("Conditions Générales | Avis de Confidentialite",
                        style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
                      const SizedBox(height: 10),
                      Text("Version: 25.2.18 ",
                        style: TextStyle(fontSize: 14,color: Colors.grey.shade400),),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "Fermer mon compte wave",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                            decoration: TextDecoration.underline, // Ajout du soulignement
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ])));
  }
}