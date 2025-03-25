import 'package:flutter/material.dart';
import 'package:my_contacts/widgets/social_media_icon.dart';

class ContactsGrid extends StatelessWidget {
  const ContactsGrid({
    super.key,
    required this.socialMedia,
  });

  final Map<String, String> socialMedia;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: socialMedia.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return SocialMediaIcon(
          socialMedia: socialMedia.keys.toList()[index],
          socialMediaLink: socialMedia.values.toList()[index],
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
    );
  }
}
