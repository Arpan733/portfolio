import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:portfolio/models/project.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  PageController pageController = PageController();
  int pageIndex = 0;

  double width = 0;
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;

    return Column(
      children: [
        Container(
          width: isMobile ? width : 680,
          alignment: Alignment.center,
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF8660), Color(0xFFD5491D)],
            ).createShader(bounds),
            child: Text(
              'Projects',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: isMobile ? 45 : 55,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        StreamBuilder(
          stream: firebase.collection("projects").snapshots(),
          builder: (context, snapshot) {
            List<Widget> containers = [];

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 300,
                    width: !isMobile ? 390 : width - 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CardLoading(
                          height: 235,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        Container(
                          height: 65,
                          width: !isMobile ? 390 : width - 10,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CardLoading(
                                    height: 10,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CardLoading(
                                    height: 20,
                                    width: 200,
                                  ),
                                ],
                              ),
                              CardLoading(
                                height: 15,
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            if (snapshot.data != null) {
              for (var element in snapshot.data!.docs) {
                ProjectModel project = ProjectModel.fromJson(element.data());

                containers.add(
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(project.githubLink));
                    },
                    child: Container(
                      height: 300,
                      width: !isMobile ? 390 : width - 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 235,
                            width: !isMobile ? 390 : width - 10,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: AssetImage('images/background.jpg'),
                                fit: BoxFit.cover,
                                opacity: 0.1,
                              ),
                            ),
                            child: ImageNetwork(
                              image: project.imageUrl,
                              height: 235,
                              width: 395,
                              curve: Curves.slowMiddle,
                              fullScreen: true,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              onError: Container(),
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              height: 65,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Click for more (Code)',
                                        style: GoogleFonts.rubik(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        project.title,
                                        style: GoogleFonts.rubik(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'icons/arrow.png',
                                    height: 15,
                                    width: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }

            return StatefulBuilder(
              builder: (context, set) => SizedBox(
                width: !isMobile ? 510 : width - 10,
                height: 350,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isMobile
                            ? Container()
                            : MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    if (pageIndex != 0) {
                                      if (pageController.hasClients) {
                                        pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.slowMiddle,
                                        );
                                        set(() {
                                          pageIndex--;
                                        });
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: pageIndex == 0
                                        ? Colors.white24
                                        : Colors.white70,
                                    size: 40,
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: isMobile ? 0 : 10,
                        ),
                        Container(
                          height: 300,
                          width: !isMobile ? 410 : width - 10,
                          alignment: Alignment.center,
                          child: PageView(
                            controller: pageController,
                            children: containers,
                          ),
                        ),
                        SizedBox(
                          width: isMobile ? 0 : 10,
                        ),
                        isMobile
                            ? Container()
                            : MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    if (pageIndex != containers.length - 1) {
                                      if (pageController.hasClients) {
                                        pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.slowMiddle,
                                        );
                                        set(() {
                                          pageIndex++;
                                        });
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: pageIndex == containers.length - 1
                                        ? Colors.white24
                                        : Colors.white70,
                                    size: 40,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: containers.length,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          color: const Color(0xFF2A2A2A),
                          height: 15,
                          width: 15,
                          borderRadius: BorderRadius.circular(10),
                          rotationAngle: 90,
                        ),
                        activeDotDecoration: DotDecoration(
                          color: const Color(0xFF4169E1),
                          height: 15,
                          width: 15,
                          rotationAngle: 135,
                          borderRadius: BorderRadius.circular(4),
                          dotBorder: const DotBorder(
                            width: 2,
                            color: Color(0xFF4169E1),
                            padding: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
