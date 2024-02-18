import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/experience.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool showAll = false;
  bool isMobile = false;
  double width = 0.0;

  List<Widget> texts({required ExperienceModel experienceModel}) => [
        Text(
          experienceModel.title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          experienceModel.duration,
          style: GoogleFonts.poppins(
            color: const Color(0xFF8491A0),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: 680,
          alignment: Alignment.center,
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF5BADFF), Color(0xFF4169E1)],
            ).createShader(bounds),
            child: Text(
              'EXPERIENCE',
              style: GoogleFonts.poppins(
                color: const Color(0xFFC5C5C5),
                fontSize: isMobile ? 45 : 55,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        StreamBuilder(
          stream: firestore.collection('experience').snapshots(),
          builder: (context, snapshot) {
            List<Widget> containers = [];

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: isMobile ? 150 : 115,
                width: 680,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardLoading(
                          height: 22,
                          width: 250,
                          borderRadius: BorderRadius.circular(10),
                          cardLoadingTheme: CardLoadingTheme(
                            colorOne: const Color(0xFF4169E1).withOpacity(0.2),
                            colorTwo: const Color(0xFF869DE3).withOpacity(0.2),
                          ),
                        ),
                        CardLoading(
                          height: 15,
                          width: 100,
                          borderRadius: BorderRadius.circular(7),
                          cardLoadingTheme: CardLoadingTheme(
                            colorOne: const Color(0xFF4169E1).withOpacity(0.2),
                            colorTwo: const Color(0xFF869DE3).withOpacity(0.2),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CardLoading(
                      height: 15,
                      width: isMobile ? width : 830,
                      borderRadius: BorderRadius.circular(7),
                      cardLoadingTheme: CardLoadingTheme(
                        colorOne: const Color(0xFF4169E1).withOpacity(0.2),
                        colorTwo: const Color(0xFF869DE3).withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CardLoading(
                      height: 15,
                      width: isMobile ? width : 830,
                      borderRadius: BorderRadius.circular(7),
                      cardLoadingTheme: CardLoadingTheme(
                        colorOne: const Color(0xFF4169E1).withOpacity(0.2),
                        colorTwo: const Color(0xFF869DE3).withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CardLoading(
                      height: 15,
                      width: isMobile ? width : 830,
                      borderRadius: BorderRadius.circular(7),
                      cardLoadingTheme: CardLoadingTheme(
                        colorOne: const Color(0xFF4169E1).withOpacity(0.2),
                        colorTwo: const Color(0xFF869DE3).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.data != null) {
              for (var element in snapshot.data!.docs) {
                ExperienceModel experienceModel =
                    ExperienceModel.fromJson(element.data());

                containers.add(
                  Container(
                    width: isMobile ? width : 680,
                    margin: const EdgeInsets.only(top: 60),
                    padding:
                        EdgeInsets.symmetric(horizontal: isMobile ? 10 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    texts(experienceModel: experienceModel),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:
                                    texts(experienceModel: experienceModel),
                              ),
                        Text(
                          experienceModel.description,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFC5C5C5),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }

            if (containers.length > 3) {
              List<Widget> container = containers.sublist(0, 3);
              container.add(
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showAll = true;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.only(top: 60),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4169E1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Show more ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFC5C5C5),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Color(0xFFC5C5C5),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );

              containers.add(
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showAll = false;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    margin: const EdgeInsets.only(top: 60),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4169E1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Show less',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFC5C5C5),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Color(0xFFC5C5C5),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );

              return Column(
                children: showAll ? containers : container,
              );
            } else {
              return Column(
                children: containers,
              );
            }
          },
        ),
      ],
    );
  }
}
