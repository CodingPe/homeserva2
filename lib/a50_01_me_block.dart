import 'package:flutter/material.dart';

double meGab = 6.8;

class MeDetails {
  String login = "peter@vyrox.com";
  String customerID = "100004";
  String customerAccountEntity = "Personal";
  String nickname = "asdasd";
  String name = "Teh Hon Kee";
  String identity = "890508-08-5605";
  String mobilePhone = "0165313713";
  String whatsapp = "60165313713";
  String email = "peter@vyrox.com";
  String gender = "Male";
  String dateOfBirth = "1989-05-08";
  String mirrorCode = "5NKT8MHTV88VGH";
  String buttonName = "Add Nickname";
  double space = 0;

  showWidget() {
    if (nickname == "") {
      buttonName = "Change";
      space = 10;
    } else {}
  }
}

class MeBlock1 extends StatelessWidget {
  MeBlock1({Key? key}) : super(key: key);

  final _myDetails = MeDetails();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MeContent(title: 'Login Username', field: _myDetails.login),
      MeContent(title: 'Customer ID', field: _myDetails.customerID),
      MeContent(
          title: 'Customer Account Entity',
          field: _myDetails.customerAccountEntity),
      MeNickname(field: _myDetails.nickname),
      MeContent(title: 'Name', field: _myDetails.name),
      MeContent(title: 'NRIC/Passport No.', field: _myDetails.identity),
      MeContent(title: 'Mobile Phone no.', field: _myDetails.mobilePhone),
      MeContent(title: 'Whatsapp', field: _myDetails.whatsapp),
      MeContent(title: 'Email', field: _myDetails.email),
      MeContent(title: 'Gender', field: _myDetails.gender),
      MeContent(title: 'Date of Birth', field: _myDetails.dateOfBirth),
      MeContent(title: 'Smart Mirror Code', field: _myDetails.mirrorCode),
      const SizedBox(height: 20),
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
  const MeContent({Key? key, required this.title, required this.field})
      : super(key: key);
  final String title, field;

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
                          child: Text(title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)))),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(field)))
                ]),
          ),
          SizedBox(height: meGab)
        ]);
  }
}

class MeNickname extends StatelessWidget {
  MeNickname({Key? key, required this.field}) : super(key: key);
  final String field;
  final _myDetails = MeDetails();
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
                            Text(field),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: _myDetails.space),
                                child: InkWell(
                                    onTap: () {},
                                    child: Text(_myDetails.buttonName,
                                        style: const TextStyle(
                                            color: Colors.blue)))),
                          ])))
                ]),
          ),
          SizedBox(height: meGab)
        ]);
  }
}
