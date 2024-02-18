import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CVWidget extends StatefulWidget {
  const CVWidget({super.key});

  @override
  State<CVWidget> createState() => _CVWidgetState();
}

class _CVWidgetState extends State<CVWidget> {
  bool isMobile = false;

  List<Widget> buttons({required UserProvider user}) => [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () async {
              String phoneNumber =
                  user.profile.phoneNo.substring(1).split(" ").join("");
              Uri url = Uri.parse(
                  'https://wa.me/$phoneNumber/?text=${Uri.encodeFull("Hello")}');

              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
              height: 65,
              width: 195,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                'Get In Touch',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              html.window.open(user.profile.resume, 'Arpan_Resume');

              // var anchorElement =
              //     html.AnchorElement(href: user.profile.resume)
              //       ..setAttribute("download", "Arpan_Resume");
              //
              // anchorElement.click();
            },
            child: Container(
              height: 65,
              width: 195,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Text(
                'Download CV',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width > 700 ? false : true;

    return Consumer<UserProvider>(
      builder: (context, user, _) => Container(
        height: isMobile ? 150 : 65,
        width: isMobile ? 200 : 420,
        margin: const EdgeInsets.only(top: 60),
        child: isMobile
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buttons(user: user),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buttons(user: user),
              ),
      ),
    );
  }
}
