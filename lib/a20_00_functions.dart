import 'package:flutter/material.dart';
import 'package:homeserva_2/a20_01_suggestions.dart';
import 'package:homeserva_2/a20_02_complaints.dart';
import 'package:homeserva_2/a20_03_visitor.dart';
import 'package:homeserva_2/a20_04_facility_bookings.dart';
import 'package:homeserva_2/a20_05_management_account.dart';
import 'package:homeserva_2/a20_06_meeting_minutes.dart';
import 'package:homeserva_2/a20_07_emergency_numbers.dart';
import 'package:homeserva_2/a20_08_emergency_sos.dart';
import 'package:homeserva_2/a20_09_access_cards.dart';
import 'package:homeserva_2/a20_10_home_services_applications.dart';
import 'package:homeserva_2/a20_11_marketplace.dart';
import 'package:homeserva_2/a20_12_concierge_services.dart';
import 'package:homeserva_2/a20_13_tukangman.dart';
import 'package:homeserva_2/a20_14_laundry.dart';
import 'package:homeserva_2/a20_15_qrkeys.dart';
import 'package:homeserva_2/a20_16_tenant_accounts.dart';
import 'package:homeserva_2/a20_17_committee.dart';
import 'package:homeserva_2/a20_18_delivery_lockers.dart';

class Functions extends StatelessWidget {
  const Functions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Functions"),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const visitor()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 12,left: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/visitors.png',height: 53,width: 53)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Visitor",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const facilitybookings()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 30,left: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/facility bookings.png',height: 68,width: 68)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Facility\n       Bookings",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const complaints()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 12,left: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/complaints.png',height: 53,width: 53)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Complaints",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const suggestions()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/suggestions.png',height: 65,width: 65)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("        Suggestions",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const managementaccount()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/management account.png',height: 60,width: 60)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Management\n       Account",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const meetingminutes()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/meeting minutes.png',height: 65,width: 65)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Meeting\n       Minutes",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const emergencynumbers()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 29),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/useful contacts.png',height: 57,width: 57)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Emergency\n       Numbers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const emergencysos()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 28),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/emergency sos.png',height: 60,width: 60)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Emergency\n       SOS",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const accesscards()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 32),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/access%20card.png',height: 60,width: 60)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Access\n       Cards",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const homeservicesapplications()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 17),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/home services applications.png',height: 59,width: 59)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("      Home Services\n      Applications",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                const SizedBox(width: 13),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const marketplace()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/marketplace.png',height: 55,width: 55)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(" Marketplace",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const conciergeservices()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 26),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/concierge services.png',height: 70,width: 70)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Concierge\n       Services",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const tukangman()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(left: 29,top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/tukangman.png',height: 65,width: 65)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("      TukangMan",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const laundry()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(left: 29,top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/laundry.png',height: 60,width: 60)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("        Laundry",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const qrkeys()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(left: 29,top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/qr keys.png',height: 60,width: 60)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("        QR-Keys",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const tenantaccounts()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/tenant accounts.png',height: 59,width: 59)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("      Tenant\n      Accounts",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const committee()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/committee.png',height: 60,width: 60)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(" Committee",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const deliverylockers()),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(top: 20,left: 26),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 246, 247, 249),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/delivery lockers.png',height: 54,width: 54)
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Text("       Delivery\n       Lockers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15)
          ],
        ),
      )
    );
  }
}
