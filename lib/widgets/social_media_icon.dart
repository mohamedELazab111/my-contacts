import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/$socialMedia'),
          radius: 40,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
                ),
                onPressed: () {
                  launchUrl(Uri.parse(socialMediaLink),
                      mode: LaunchMode.externalApplication);
                },
                child: const Text('Start Social Media'),
              );
            },
          );
        },
      ),
    );
  }
}
