import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/consts/routes.dart';
import 'package:portfolio/widgets/about.dart';
import 'package:portfolio/widgets/bottom.dart';
import 'package:portfolio/widgets/cv.dart';
import 'package:portfolio/widgets/experiences.dart';
import 'package:portfolio/widgets/expertise.dart';
import 'package:portfolio/widgets/projects.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _bottomKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  Offset pointer = const Offset(0, 0);
  bool isMobile = false;
  double width = 0.0;
  double _opacity = 0;

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          _opacity = 1;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () => Navigator.pushNamedAndRemoveUntil(
          context, Routes.splashscreen, (route) => false),
      color: const Color(0xFF4169E1),
      backgroundColor: const Color(0xFF2A2A2A),
      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: AnimatedOpacity(
          opacity: _opacity,
          curve: Curves.slowMiddle,
          duration: const Duration(milliseconds: 500),
          child: AnimatedBackground(
            vsync: this,
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMaxRadius: 50,
                spawnMinRadius: 5,
                spawnMinSpeed: 10,
                spawnMaxSpeed: 50,
                particleCount: 30,
                minOpacity: 0.3,
                maxOpacity: 0.4,
                baseColor: Color(0xFF4169E1),
              ),
            ),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  flexibleSpace: Container(
                    height: 90,
                    color: const Color(0xFF4169E1),
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * 0.15625),
                    child: AdaptiveNavBar(
                      screenWidth: width,
                      backgroundColor: const Color(0xFF4169E1),
                      foregroundColor: Colors.white,
                      toolbarHeight: 80,
                      title: SizedBox(
                        width: 80,
                        child: Image.asset(
                          'images/signature.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      toolbarTextStyle: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      navBarItems: [
                        NavBarItem(
                          text: 'Projects',
                          onTap: () {
                            RenderObject? renderObject =
                                _projectKey.currentContext!.findRenderObject();
                            if (renderObject != null) {
                              _scrollController.position.ensureVisible(
                                renderObject,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }

                            if (isMobile) {
                              Navigator.pop(context);
                            }
                          },
                          hoverColor: Colors.white24,
                        ),
                        NavBarItem(
                          text: 'Experience',
                          onTap: () {
                            RenderObject? renderObject = _experienceKey
                                .currentContext!
                                .findRenderObject();
                            if (renderObject != null) {
                              _scrollController.position.ensureVisible(
                                renderObject,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }

                            if (isMobile) {
                              Navigator.pop(context);
                            }
                          },
                          hoverColor: Colors.white24,
                        ),
                        NavBarItem(
                          text: 'Contact',
                          onTap: () {
                            RenderObject? renderObject =
                                _bottomKey.currentContext!.findRenderObject();
                            if (renderObject != null) {
                              _scrollController.position.ensureVisible(
                                renderObject,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            }

                            if (isMobile) {
                              Navigator.pop(context);
                            }
                          },
                          hoverColor: Colors.white24,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AboutWidget(),
                            const ExpertiseWidget(),
                            const CVWidget(),
                            Container(
                              margin: const EdgeInsets.only(top: 100),
                              key: _projectKey,
                              child: const ProjectWidget(),
                            ),
                            Container(
                              key: _experienceKey,
                              margin: const EdgeInsets.only(top: 100),
                              child: const ExperienceWidget(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 120),
                              key: _bottomKey,
                              child: const BottomWidget(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
