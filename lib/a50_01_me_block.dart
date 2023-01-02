import 'package:flutter/material.dart';

double meGab = 6.8;

class MeBlock1 extends StatelessWidget {
  const MeBlock1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      MeContent(title: 'Login Username', field: 'Peter@vyrox.com'),
      MeContent(title: 'Customer ID', field: '100004'),
      MeContent(title: 'Customer Account Entity', field: 'Personal'),
      MeNickname(),
      MeContent(title: 'Name', field: 'Teh Hon Kee'),
      MeContent(title: 'NRIC/Passport No.', field: '890508-08-5605'),
      MeContent(title: 'Mobile Phone no.', field: '0165313713'),
      MeContent(title: 'Whatsapp', field: '60165313713'),
      MeContent(title: 'Email', field: 'peter@vyrox.com'),
      MeContent(title: 'Gender', field: 'Male'),
      MeContent(title: 'Date of Birth', field: '1989-05-08'),
      MeContent(title: 'Smart Mirror Code', field: '5NKT8MHTV88VGH'),
      SizedBox(height: 20),
    ]);
  }
}

class MeBlock2 extends StatelessWidget {
  const MeBlock2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Divider(height: 0, color: Colors.black38),
      SizedBox(height: 20),
      MeContent(title: 'Project Name', field: 'Palazzo @ Ipoh Garden East'),
      MeContent(title: 'Account', field: 'PLZ-A-1F-7/1'),
      MeContent(title: 'Property No.', field: 'A-1F-7'),
      MeContent(title: 'Parking Lot 1', field: ' '),
      MeContent(title: 'Customer Status', field: 'Owner'),
      SizedBox(height: 20),
      Divider(height: 0, color: Colors.black38),
    ]);
  }
}

class MeContent extends StatelessWidget {
  final String? title;
  final String? field;

  const MeContent({Key? key, required this.title, required this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicWidth(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(field!)))
                ]),
          ),
          SizedBox(height: meGab)
        ]);
  }
}

class MeNickname extends StatelessWidget {
  const MeNickname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicWidth(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 10),
                          child: const Text('Nickname',
                              style: TextStyle(fontWeight: FontWeight.bold)))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(children: [
                            const Text('-'),
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                    onTap: () {},
                                    child: const Text('Change',
                                        style: TextStyle(color: Colors.blue)))),
                          ])))
                ]),
          ),
          SizedBox(height: meGab)
        ]);
  }
}
