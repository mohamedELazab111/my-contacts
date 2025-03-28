import 'package:flutter/material.dart';
import 'package:my_contacts/my_provider.dart';
import 'package:my_contacts/widgets/social_media_icon.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContacts extends StatelessWidget {
  MyContacts({super.key});

  Map<String, String> socialMedia = {
    'Facebook.jpg':
        'https://www.facebook.com/profile.php?id=100011286970311&locale=ar_AR',
    'whatsapp.png': 'https://wa.me/+201145037756',
    'Instagram.png': 'https://www.instagram.com/mohamedwael727/',
    'github.jpg': 'https://github.com/mohamedELazab111',
    'linkedin.jpg': 'https://www.linkedin.com/in/mohamed-barakat-74666b313/',
    'twitter.jpg': 'https://x.com/MohamedBar32759',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 7, 30),
        title: const Text(
          'My Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        actions: [
          Selector<MyProvider, Tuple2<String?, String?>>(
            selector: (p0, p1) => Tuple2(p1.getMyPlatform(), p1.getMyUrl()),
            builder: (context, value, child) => IconButton(
              onPressed: () {
                value.item2 == null
                    ? launchUrl(Uri.parse('tel:+201145037756'))
                    : launchUrl(Uri.parse(value.item2!),
                        mode: LaunchMode.externalApplication);
              },
              icon: value.item1 == null
                  ? const Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.white,
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/${value.item1}'),
                      radius: 18,
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 3, 7, 30),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/mohamed.jpg'),
                radius: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mohamed ELazab',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '+201145037756',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+201145037756'));
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: socialMedia.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return SocialMediaIcon(
                    socialMedia: socialMedia.keys.toList()[index],
                    socialMediaLink: socialMedia.values.toList()[index],
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
