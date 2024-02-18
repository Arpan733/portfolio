import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  bool isMobile = false;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;
    width = MediaQuery.of(context).size.width;

    return Consumer<UserProvider>(
      builder: (context, user, _) => Container(
        height: isMobile ? 500 : 420,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.16),
        color: const Color(0xFF4169E1),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Text(
                'Contact',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: Text(
                'Seasoned Full Stack Software Engineer with over a year of hands-on experience in designing and implementing robust, scalable, and innovative app solutions. Adept at leveraging a comprehensive skill set encompassing front-end and back-end technologies',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse('mailto:${user.profile.email}');

                  try {
                    await launchUrl(url);
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.mail_outline_outlined,
                      size: 17,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.profile.email,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  Uri url = Uri.parse('tel:${user.profile.phoneNo}');

                  try {
                    await launchUrl(url);
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.call_outlined,
                      size: 17,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.profile.phoneNo,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await launchUrlString(user.profile.github);
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('icons/github.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await launchUrlString(user.profile.linkedin);
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('icons/linkedin.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await launchUrlString(user.profile.facebook);
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('icons/facebook.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await launchUrlString(user.profile.instagram);
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset('icons/instagram.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
