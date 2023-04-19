import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_02_accounting_path.dart';
import 'dart:async';
import 'package:slide_to_act/slide_to_act.dart';

class Accounting extends StatefulWidget {
  const Accounting({Key? key}) : super(key: key);

  @override
  State<Accounting> createState() => _AccountingState();
}

class _AccountingState extends State<Accounting> {
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
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.clear),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Accounting',style: TextStyle(fontWeight: FontWeight.bold),),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: Color.fromARGB(255, 2, 122, 252),
                  indicatorWeight: 3,
                  labelColor: Color.fromARGB(255, 2, 122, 252),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Documents',
                    ),
                    Tab(
                      text: 'Overview',
                    ),
                  ],
                ),
                Container(
                  height: 0.7,
                  color: Colors.black,
                )
              ],
            ),
          ),
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
        ),
        body: Stack(
          children: [
            TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    const SizedBox(height: 15),
                    GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        crossAxisSpacing: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        children: [
                          _buildGridViewItem('Invoices',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Invoices()))),
                          _buildGridViewItem('Payments',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Payments()))),
                          _buildGridViewItem('Statement',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Statement()))),
                          _buildGridViewItem('Deposits',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Deposits()))),
                          _buildGridViewItem('Advances',
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Advances()))),
                        ])
                  ],
                ),
                ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: Scrollbar(
                      child: ListView(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("Item",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("Balance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("SERVICE CHARGE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" SERVICE CHARGE",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          flex: 2,
                                          child: Text(" 6% SERVICE TAX OF SERVICE CHARGE",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("SINKING FUND",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" SINKING FUND",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("WATER & SEWERAGE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" WATER & SEWERAGE",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 349.44",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("INTEREST ADVICE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          flex: 2,
                                          child: Text(" INTEREST CHARGE ON OVERDUE INVOICES",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text("RM 3519.34",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("DEPOSITS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" SERVICE CHARGE DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" SINKING FUND DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" WATER & SEWERAGE DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" SERVICE CHARGE DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" HOME SERVICE DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 3800.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" ACCESS CARD DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" FACILITY BOOKING DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" CONCIERGE SERVICE DEPOSIT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("ADVANCE PAYMENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" ADVANCE PAYMENT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("QUIT RENT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" QUIT RENT",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("FIRE INSURANCE PREMIUM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" FIRE INSURANCE PREMIUM",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("ACCESS CARD",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" ACCESS CARD",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("FACILITY BOOKING",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" FACILITY BOOKING",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("CONCIERGE SERVICE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" CONCIERGE SERVICE",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text("AMENITY CHARGE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.start,)
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Text(" AMENITY CHARGE",style: TextStyle(fontSize: 13),textAlign: TextAlign.start,)
                                      ),
                                      Expanded(
                                          child: Text("RM 0.00",style: TextStyle(fontSize: 13),textAlign: TextAlign.end,)
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 100,
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    ))
              ],
            ),
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
                              width: MediaQuery.of(context).size.width * _countdown / 3,
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
                            behavior: const ScrollBehavior().copyWith(overscroll: false),
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
                                        color: _isAmbulance ? Colors.white : Colors.red,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          'Ambulance',
                                          style: TextStyle(
                                            color: _isAmbulance ? Colors.black : Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                  ),
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
                                        color: _isPolice ? Colors.white : Colors.red,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          'Police',
                                          style: TextStyle(
                                            color: _isPolice ? Colors.black : Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                  ),
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
                                        color: _isFireFighter ? Colors.white : Colors.red,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          'Fire Fighter',
                                          style: TextStyle(
                                            color: _isFireFighter ? Colors.black : Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                  ),
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
                                            icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
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
                                      onChanged: (String? newValue){
                                        setState(() {
                                          selectedUnit = newValue!;
                                        });
                                      },
                                      items: unit.map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text('   $value',),
                                      )).toList(),
                                    )
                                ),
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
                                        onSubmit: (){
                                          _showSOSAccessDialog();
                                        },
                                      )),
                                )
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
  );
}

Widget _buildGridViewItem(String label,
    {required VoidCallback onTap}) {
  return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
                label,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center),
          ),
        ),
      ]
      )
  );
}
