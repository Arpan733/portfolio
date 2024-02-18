import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/experties.dart';

class ExpertiseWidget extends StatefulWidget {
  const ExpertiseWidget({super.key});

  @override
  State<ExpertiseWidget> createState() => _ExpertiseWidgetState();
}

class _ExpertiseWidgetState extends State<ExpertiseWidget> {
  bool isMobile = false;
  double width = 0.0;
  List<bool> isHovering = [];

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: 680,
          margin: const EdgeInsets.only(top: 90),
          child: Text(
            'EXPERIENCE WITH',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFFC5C5C5),
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          width: 680,
          height: 80,
          margin: const EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              expertise.length,
              (index) {
                isHovering.add(false);

                return MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      isHovering[index] = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      isHovering[index] = false;
                    });
                  },
                  child: Container(
                    height: isHovering[index] || isMobile ? 80 : 50,
                    width: 100,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          isHovering[index] || isMobile
                              ? expertise[index]['hoverImage']
                              : expertise[index]['image'],
                          height: 50,
                          width: 50,
                        ),
                        isHovering[index] || isMobile
                            ? Text(
                                expertise[index]['name'],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFC5C5C5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
