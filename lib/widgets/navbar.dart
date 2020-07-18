import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/responsiveLayout.dart';

class NavBar extends StatelessWidget {
  final navLinks = ['Home', 'Docs', 'Connpass'];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: const EdgeInsets.only(left: 18),
        child: InkWell(
            child: Text(
                text,
                style: const TextStyle(fontFamily: 'Montserrat-Bold')
            ),
            onTap: () async {
              var url = '';
              switch (text) {
                case 'Home':
                  url = '/';
                  break;
                case 'Docs':
                  url = 'https://flutter-osaka.netlify.app/';
                  break;
                case 'Connpass':
                  url = 'https://flutter-jp.connpass.com/';
                  break;
                default:
                  url = '/';
                  break;
              }
              if (await canLaunch(url)) {
                await launch(url);
              }
            }
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFFC86DD7),
                          Color(0xFF3023AE),
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft)
                ),
                child: const Center(
                  child: Text('F',
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text('Flutter Osaka', style: const TextStyle(fontSize: 26))
            ],
          ),
          if (!ResponsiveLayout.isSmallScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[...navItem()]..add(InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF6078ea).withOpacity(.3),
                              offset: const Offset(0, 8),
                              blurRadius: 8)
                        ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: InkWell(
                            child: const Text('Join Slack',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    fontFamily: 'Montserrat-Bold'
                                )
                            ),
                            onTap: () async {
                              const url = 'https://join.slack.com/t/flutter-osaka/shared_invite/enQtODg3NTMxNTg4Njg5LTBhY2ZiMWFhOTI3NjZmN2IwZTc1MWY1Yzc3ODQ4NGRhYzQyNWM0NTg2NzY3OWEwNjk2MmMxMzQ4ZjFmNTZhNTI';
                              if (await canLaunch(url)) {
                                await launch(url);
                              }
                            },
                        ),
                      ),
                    ),
                  )
              )),
            )
          else
            Image.network('assets/menu.png', width: 26, height: 26)
        ],
      ),
    );
  }
}