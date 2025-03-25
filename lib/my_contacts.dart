import 'package:flutter/material.dart';
import 'package:my_contacts/widgets/social_media_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContacts extends StatelessWidget {
  MyContacts({super.key});
  Map<String,String> socialMedia ={
    'Facebook.jpg':'https://www.facebook.com/profile.php?id=100011286970311&locale=ar_AR',
    'whatsapp.png':'https://wa.me/+201145037756',
    'Instagram.png':'https://www.instagram.com/mohamedwael727/',
    'github.jpg':'https://github.com/mohamedELazab111',
    'linkedin.jpg':'https://www.linkedin.com/in/mohamed-barakat-74666b313/',
    'twitter.jpg':'https://x.com/MohamedBar32759',
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 7, 30),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/mohamed.jpg'),
                radius: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mohamed ELazab',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+201145037756',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
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
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: socialMedia.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return SocialMediaIcon(
                    socialMedia: socialMedia.keys.toList()[index], socialMediaLink: socialMedia.values.toList()[index],
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
