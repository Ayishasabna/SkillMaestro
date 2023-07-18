import 'package:flutter/material.dart';
import 'package:skillmaestro/common/settings/about.dart';
import 'package:skillmaestro/common/settings/privacy_policy.dart';
import 'package:skillmaestro/common/settings/terms_and_conditions_screen.dart';
import 'package:skillmaestro/expert/view/expert_profile.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../core/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Version 1.0',
              style: normalText.copyWith(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 119, 119, 119)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text(
          'Settings',
          style: headText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Tile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()
                        //AboutScreen(),
                        ));
              },
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'About ',
                style: normalText,
              ),
              leading: const CircleAvatar(
                //backgroundColor: Colors.amber,
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 28,
                ),
              ),
            ),
            Tile(
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              title: Text(
                'Terms & Conditions',
                style: normalText,
              ),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.format_align_justify,
                  size: 28,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditionsScreen()
                      //TermsAndConditionsScreen()
                      ,
                    ));
              },
            ),
            Tile(
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPoclicyScrn()
                      //PrivacyPoclicyScrn(),
                      )),
              title: Text(
                'Privacy Policy',
                style: normalText,
              ),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.privacy_tip_outlined,
                  size: 28,
                ),
              ),
            ),
            Tile(
              title: Text(
                'Share ',
                style: normalText,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.share_outlined,
                  size: 28,
                ),
              ),
              onTap: () async {},
            ),
            /* Tile(
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {},
              title: Text(
                'Rate',
                style: normalText,
              ),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.rate_review,
                  size: 28,
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
