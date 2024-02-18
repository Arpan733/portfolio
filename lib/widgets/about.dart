import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:portfolio/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  bool isMobile = false;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    width = MediaQuery.of(context).size.width;

    return Consumer<UserProvider>(
      builder: (context, user, _) => Column(
        children: [
          Container(
            height: 220,
            width: 220,
            margin: const EdgeInsets.only(top: 150),
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF8660), Color(0xFF8000FF)],
              ),
            ),
            child: ClipOval(
              child: ImageNetwork(
                image: user.profile.url,
                height: 220,
                width: 220,
                curve: Curves.slowMiddle,
                onError: Container(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'I do code and\n',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isMobile ? 40 : 55,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  WidgetSpan(
                    child: Text(
                      'build ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: isMobile ? 40 : 55,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFF8660), Color(0xFF8000FF)],
                      ).createShader(bounds),
                      child: Text(
                        'Apps & Games!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: isMobile ? 40 : 55,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 680,
            margin: const EdgeInsets.only(top: 40),
            child: Text(
              user.profile.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xFFC5C5C5),
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
