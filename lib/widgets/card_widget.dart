import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wave/screens/scan_screen.dart';

class CardWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final bool? isClickable;
  const CardWidget({super.key, this.width, this.height, this.isClickable = false});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
      if (widget.isClickable!) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanScreen(),
            ));
      }
    },
     child: Align(
      alignment: Alignment.center,
      child: Container(
          width: widget.width ?? 400,
          height: widget.height?? 200,
          margin: const EdgeInsets.symmetric(
              vertical: 16, horizontal: 50
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: const AssetImage("./assets/images/bg.png"),

                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor.withOpacity(.3),
                      BlendMode.srcIn
                  )
              )
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                        children: [
                          Container(
                            height: 130,
                            padding: const EdgeInsets.all(6.0),
                            child: PrettyQrView.data(
                              data: "T'es vraiment con à ce point :) :) :) :) :) Reflechi mec",
                              decoration: const PrettyQrDecoration(
                                image: PrettyQrDecorationImage(
                                  image: AssetImage('images/flutter.png')
                                ),
                              ),
                            ),
                          ),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    Icons.camera_alt_rounded,
                                    size: 20
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Scanner")
                              ]
                          )
                        ]
                    )
                ),
              ),
              Positioned(
                bottom: -40,
                right: -90,
                child: Image.asset(
                  "./assets/images/wave.png",
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          )
      ),
    )
    );
  }
}
