import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../consts/experience.dart';

class ExpertiseWidget extends StatefulWidget {
  const ExpertiseWidget({super.key});

  @override
  State<ExpertiseWidget> createState() => _ExpertiseWidgetState();
}

class _ExpertiseWidgetState extends State<ExpertiseWidget> {
  List<bool> isHovering = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, _) => Column(
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
                experience.length,
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
                      height: isHovering[index] ? 80 : 50,
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            isHovering[index]
                                ? experience[index]['hoverImage']
                                : experience[index]['image'],
                            height: 50,
                            width: 50,
                          ),
                          isHovering[index]
                              ? Text(
                                  experience[index]['name'],
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
      ),
    );
  }
}
