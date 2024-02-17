import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/consts/routes.dart';
import 'package:portfolio/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Offset pointer = const Offset(0, 0);
  String _textToShow = '';
  double _opacity = 1;

  @override
  void initState() {
    _animateText();
    Provider.of<UserProvider>(context, listen: false).getProfile();

    Future.delayed(
      const Duration(seconds: 4),
      () {
        navigate();
      },
    );

    super.initState();
  }

  navigate() {
    if (Provider.of<UserProvider>(context, listen: false).profile != null) {
      setState(() {
        _opacity = 0;
      });

      Future.delayed(
        const Duration(seconds: 1),
        () {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homescreen, (route) => false);
        },
      );
    } else {
      navigate();
    }
  }

  void _animateText() async {
    String text = "Welcome to the World of\nArpan";
    for (int i = 0; i < text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _textToShow = text.substring(0, i + 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: AnimatedOpacity(
        curve: Curves.slowMiddle,
        duration: const Duration(milliseconds: 500),
        opacity: _opacity,
        child: MouseRegion(
          cursor: SystemMouseCursors.none,
          onHover: (eve) {
            setState(() {
              pointer = eve.position;
            });
          },
          child: Stack(
            children: [
              AnimatedBackground(
                vsync: this,
                behaviour: RandomParticleBehaviour(
                  options: const ParticleOptions(
                    spawnMaxRadius: 50,
                    spawnMinRadius: 5,
                    spawnMinSpeed: 10,
                    spawnMaxSpeed: 50,
                    particleCount: 15,
                    minOpacity: 0.3,
                    maxOpacity: 0.4,
                    baseColor: Color(0xFF8000FF),
                  ),
                ),
                child: AnimatedBackground(
                  vsync: this,
                  behaviour: RandomParticleBehaviour(
                    options: const ParticleOptions(
                      spawnMaxRadius: 50,
                      spawnMinRadius: 5,
                      spawnMinSpeed: 10,
                      spawnMaxSpeed: 50,
                      particleCount: 15,
                      minOpacity: 0.3,
                      maxOpacity: 0.4,
                      baseColor: Color(0xFFFF8660),
                    ),
                  ),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFF8660), Color(0xFF8000FF)],
                      ).createShader(bounds),
                      child: Text(
                        _textToShow,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                left: pointer.dx - 50,
                top: pointer.dy - 50,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFFF8660).withOpacity(0.3),
                        const Color(0xFF8000FF).withOpacity(0.3),
                      ],
                    ),
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
