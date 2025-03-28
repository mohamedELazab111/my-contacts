import 'package:flutter/material.dart';
import 'package:my_contacts/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  String socialMedia;
  String socialMediaLink;
  SocialMediaIcon({
    Key? key,
    required this.socialMedia,
    required this.socialMediaLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(12),
        child: InkWell(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/$socialMedia'),
            radius: 40,
          ),
          onTap: () {
            value.setMyPlatform(socialMedia);
            value.setMyUrl(socialMediaLink);
            launchUrl(Uri.parse(socialMediaLink),
                mode: LaunchMode.externalApplication);
          },
        ),
      ),
    );
  }
}
