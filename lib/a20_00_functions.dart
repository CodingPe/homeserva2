import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_01_functions_path.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'dart:async';

class Functions extends StatefulWidget {
  const Functions({Key? key}) : super(key: key);

  @override
  State<Functions> createState() => _FunctionsState();
}

class _FunctionsState extends State<Functions> {
  int _countdown = 0;
  bool _countdownEnded = false;
  bool _isPressed = false;
  Timer? _timer;
  bool _isAmbulance = true;
  bool _isPolice = true;
  bool _isFireFighter = true;
  TextEditingController remark = TextEditingController();
  final List<String> unit = <String>[
    'D-5-19',
  ];
  String? selectedUnit;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_countdown == 0) {
          _countdownEnded = true;
          _timer?.cancel();
        } else {
          _countdown--;
        }
      });
    });
  }

  void _showSOSAccessDialog() {
    setState(() {
      _isPressed = false;
      _countdown = 0;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("SOS Alert"),
          content: const Text("The SOS alarm has been successfully called!"),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.clear),
            )
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Functions"),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1)),
        elevation: 0.5,
        actions: [
          SizedBox(
            width: 35,
            height: 35,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isPressed = false;
                    _countdown = 3;
                    _countdownEnded = false; // set flag to false
                  });
                },
                onLongPressStart: (_) {
                  setState(() {
                    _isPressed = true;
                  });
                  _startTimer();
                },
                onLongPressEnd: (_) {
                  setState(() {
                    _isPressed = false;
                    _timer?.cancel();
                    if (_countdownEnded) {
                      _isPressed = true;
                      _countdown = 1;
                    }
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(
                    child: Text(
                      "SOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Scrollbar(
                    child: GridView.count(
                        childAspectRatio: 0.8,
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        crossAxisSpacing: 8,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          _buildGridViewItem(
                              'assets/icons/visitors.png', 'Visitor',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Visitor()))),
                          _buildGridViewItem(
                              'assets/icons/facility bookings.png',
                              'Facility\nBookings',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FacilityBookings()))),
                          _buildGridViewItem(
                              'assets/icons/complaints.png', 'Complaints',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Complaints()))),
                          _buildGridViewItem(
                              'assets/icons/suggestions.png', 'Suggestions',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Suggestions()))),
                          _buildGridViewItem(
                              'assets/icons/management account.png',
                              'Management\nAccount',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ManagementAccount()))),
                          _buildGridViewItem('assets/icons/meeting minutes.png',
                              'Meeting\nMinutes',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MeetingMinutes()))),
                          _buildGridViewItem('assets/icons/useful contacts.png',
                              'Emergency\nNumbers',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmergencyNumbers()))),
                          _buildGridViewItem('assets/icons/emergency sos.png',
                              'Emergency\nSOS',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EmergencySOS()))),
                          _buildGridViewItem(
                              'assets/icons/sub-user accounts.png',
                              'Sub-User\nAccounts',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SubUser()))),
                          _buildGridViewItem(
                              'assets/icons/access%20card.png', 'Access\nCards',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccessCards()))),
                          _buildGridViewItem(
                              'assets/icons/home services applications.png',
                              'Home Services\nPermit',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeServicesApplications()))),
                          _buildGridViewItem(
                              'assets/icons/marketplace.png', 'Marketplace',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Marketplace()))),
                          _buildGridViewItem(
                              'assets/icons/concierge services.png',
                              'Concierge\nServices',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConciergeServices()))),
                          _buildGridViewItem(
                              'assets/icons/tukangman.png', 'TukangMan',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TukangMan()))),
                          _buildGridViewItem(
                              'assets/icons/laundry.png', 'Laundry',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Laundry()))),
                          _buildGridViewItem(
                              'assets/icons/qr keys.png', 'QR-Keys',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const QRKeys()))),
                          _buildGridViewItem('assets/icons/tenant accounts.png',
                              'Tenant\nAccounts',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TenantAccounts()))),
                          _buildGridViewItem(
                              'assets/icons/committee.png', 'Committee',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Committee()))),
                          _buildGridViewItem(
                              'assets/icons/delivery lockers.png',
                              'Delivery\nLockers',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DeliveryLockers()))),
                        ]),
                  ),
                  Container(
                    height: 30,
                  )
                ],
              )),
          if (_isPressed)
            Container(
              color: const Color.fromARGB(255, 51, 51, 51).withOpacity(0.8),
            ),
          if (!_countdownEnded)
            Center(
              child: AnimatedOpacity(
                opacity: _isPressed ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Emergency SOS',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            _countdown.toString(),
                            style: const TextStyle(
                              fontSize: 120,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: MediaQuery.of(context).size.width *
                                _countdown /
                                3,
                            height: 10,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Initializing...',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (_countdownEnded)
            Center(
              child: AnimatedOpacity(
                opacity: _isPressed ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formKey,
                      child: ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(overscroll: false),
                          child: ListView(
                            children: [
                              const Center(
                                child: Text(
                                  'Emergency SOS',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'I need help from',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isAmbulance = !_isAmbulance;
                                  });
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: _isAmbulance
                                          ? Colors.white
                                          : Colors.red,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        'Ambulance',
                                        style: TextStyle(
                                          color: _isAmbulance
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPolice = !_isPolice;
                                  });
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color:
                                          _isPolice ? Colors.white : Colors.red,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        'Police',
                                        style: TextStyle(
                                          color: _isPolice
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isFireFighter = !_isFireFighter;
                                  });
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: _isFireFighter
                                          ? Colors.white
                                          : Colors.red,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        'Fire Fighter',
                                        style: TextStyle(
                                          color: _isFireFighter
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: 300,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Center(
                                    child: TextFormField(
                                      controller: remark,
                                      decoration: InputDecoration(
                                        hintText: 'Remark',
                                        border: InputBorder.none,
                                        suffixIcon: remark.text.isNotEmpty
                                            ? IconButton(
                                                icon: const Icon(
                                                  Icons.clear,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    remark.clear();
                                                  });
                                                },
                                              )
                                            : null,
                                      ),
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    value: unit.first,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedUnit = newValue!;
                                      });
                                    },
                                    items: unit
                                        .map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                '   $value',
                                              ),
                                            ))
                                        .toList(),
                                  )),
                              const SizedBox(height: 15),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SlideAction(
                                      borderRadius: 30,
                                      elevation: 0,
                                      innerColor: Colors.red,
                                      outerColor: Colors.white,
                                      sliderButtonIcon: const Icon(
                                        Icons.sos,
                                        color: Colors.white,
                                      ),
                                      text: '       Slide to Request',
                                      onSubmit: () {
                                        _showSOSAccessDialog();
                                      },
                                    )),
                              )
                            ],
                          ))),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget _buildGridViewItem(String iconAssetPath, String label,
    {required VoidCallback onTap}) {
  return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 246, 247, 249),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconAssetPath, height: 52, width: 52),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center)
      ]));
}
