// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebContentTPD extends StatelessWidget {
  const WebContentTPD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 40),
      Container(
          height: 30,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Row(children: const [
            WebLink(
                title: 'Terms of Service',
                link: 'https://homeserva.com/terms_of_service.php'),
            VerticalDivider(color: Colors.black38, thickness: 1),
            WebLink(
                title: 'Privacy Policy',
                link: 'https://homeserva.com/privacy_policy.php'),
            VerticalDivider(color: Colors.black38, thickness: 1),
            WebLink(
                title: 'Disclaimer',
                link: 'https://homeserva.com/disclaimer.php'),
          ])),
    ]);
  }
}

class WebLink extends StatelessWidget {
  const WebLink({Key? key, required this.title, required this.link})
      : super(key: key);

  final link;
  final title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
            child: GestureDetector(
                child: Text(title), onTap: () => launchURL(link))));
  }
}

launchURL(link) async {
  final url = link;
  final uri = Uri.parse(url);
  if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  } else {
    throw 'Could not launch $url';
  }
}
