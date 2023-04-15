
import 'package:flutter/material.dart';

class Advances extends StatefulWidget {
  const Advances({Key? key}) : super(key: key);

  @override
  State<Advances> createState() => _AdvancesState();
}

class _AdvancesState extends State<Advances> {

  final List<String> payment = <String>[
    '-- Select --',
    'SERVICE CHARGE',
    'SERVICE CHARGE DEPOSIT',
    'SINKING FUND',
    'SINKING FUND DEPOSIT',
    'WATER & SEWERAGE',
    'WATER & SEWERAGE DEPOSIT',
    'QUIT RENT',
    '6% SERVICE TAX OF SERVICE CHARGE',
    '6% SERVICE TAX OF SINKING FUND',
    'FIRE INSURANCE PREMIUM',
    'INTEREST CHARGE ON OVERDUE INVOICES',
    'HOME SERVICE DEPOSIT',
    'ACCESS CARD DEPOSIT',
    'ACCESS CARD',
    'FACILITY BOOKING DEPOSIT',
    'FACILITY BOOKING FEE',
    'CLAMP RELEASE FEE',
    'CONCIERGE SERVICE DEPOSIT',
    'CONCIERGE SERVICE',
    'AMENITY CHARGE',
    'TRANSFER OWNERSHIP FEE',
    'RENTAL SECURITY DEPOSIT',
    'UTILITY DEPOSIT',
    'ELECTRICITY DEPOSIT',
    'INDAH WATER KONSORTIUM (IWK) DEPOSIT',
    'RESTORATION DEPOSIT',
    'DEBRIS REMOVAL DEPOSIT',
    'RENTAL FEE',
    'DISBURSEMENT FEE',
    'STAMP DUTY FEE',
    'INDAH WATER KONSORTIUM (IWK)'
  ];

  String? selectedPayment;
  final _formKey = GlobalKey<FormState>();

  void showSetPaymentDialog() {
    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(
            builder: (context,setState){
              return Center(
                child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child:  Form(
                            key: _formKey,
                            child: ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(overscroll: false),
                                child: ListView(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: Text("Set Auto Payment",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                                        ),
                                        const SizedBox(height: 7),
                                        Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: DropdownButtonFormField(
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            isExpanded: true,
                                            value: payment.first,
                                            items: payment.map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text('   $value',),
                                            )).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                selectedPayment = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: (){Navigator.pop(context);
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        primary: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: const BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: const Text(
                                        'Update',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                      ),
                    )
                ),
              );
            }
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: const [
            Text('Advances',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
            Text('RM 0.00',style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400),)
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              showSetPaymentDialog();
            },
            child: const Icon(Icons.settings),
          ),
          const SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
      ),
      body: const Center(
        child: Text('Advances'),
      ),
    );
  }
}