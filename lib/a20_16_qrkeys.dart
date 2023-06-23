import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRKeys extends StatefulWidget {
  const QRKeys({Key? key}) : super(key: key);

  @override
  State<QRKeys> createState() => _QRKeysState();
}

class _QRKeysState extends State<QRKeys> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              title: const Text('QR-Keys',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          body: Column(
            children: [
              const Center(
                child: Text('QR-Keys'),
              ),
              const SizedBox(height: 20),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            builder: (BuildContext context) {
                              return SizedBox(
                                  height: 600,
                                  child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                        Text('display QR-Keys here'),
                                        QrImageView(
                                            data: '1234123',
                                            version: QrVersions.auto,
                                            size: 200.0),
                                      ])));
                            });
                      },
                      child: const Text('Generate QR-Keys'))),
            ],
          )));
}
