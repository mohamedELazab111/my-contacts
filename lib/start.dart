import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartSocialMedia extends StatelessWidget {
  String socialMediaLink;
  StartSocialMedia({
    Key? key,
    required this.socialMediaLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 7, 30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
            ),
            onPressed: () {
              launchUrl(Uri.parse(socialMediaLink),
                  mode: LaunchMode.externalApplication);
            },
            child: const Text('Start Social Media')),
      ),
    );
  }
}
