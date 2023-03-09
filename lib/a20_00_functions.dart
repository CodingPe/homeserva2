import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_01_functions_path.dart';

//TODO: to improve the UI, use GridView to display the functions icons.
//Chee Mun, use Gridview to display the functions icons.
//Each icon is a GestureDetector, when tapped, it will navigate to the respective page.
//Write a function to display the icons and text. Do not hardcode the icons and text.
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
          actions: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {},
                  child: const Text('SOS',style: TextStyle(color: Colors.white,fontSize: 13),)
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: Scrollbar(
          child: GridView.count(
            childAspectRatio: 0.8,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildGridViewItem(
                'assets/icons/visitors.png',
                'Visitor',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const visitor()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/facility bookings.png',
                'Facility\nBookings',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const facilitybookings()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/complaints.png',
                'Complaints',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const complaints()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/suggestions.png',
                'Suggestions',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const suggestions()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/management account.png',
                'Management\nAccount',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const managementaccount()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/meeting minutes.png',
                'Meeting\nMinutes',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const meetingminutes()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/useful contacts.png',
                'Emergency\nNumbers',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const emergencysos()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/emergency sos.png',
                'Emergency\nSOS',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const emergencynumbers()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/sub-user accounts.png',
                'Sub-User\nAccounts',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const subuser()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/access%20card.png',
                'Access\nCards',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const accesscards()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/home services applications.png',
                'Home Services\nApplications',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const homeservicesapplications()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/marketplace.png',
                'Marketplace',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const marketplace()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/concierge services.png',
                'Concierge\nServices',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const conciergeservices()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/tukangman.png',
                'TukangMan',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const tukangman()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/laundry.png',
                'Laundry',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const laundry()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/qr keys.png',
                'QR-Keys',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const qrkeys()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/tenant accounts.png',
                'Tenant\nAccounts',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const tenantaccounts()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/committee.png',
                'Committee',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const committee()),
                ),
              ),
              _buildGridViewItem(
                'assets/icons/delivery lockers.png',
                'Delivery\nLockers',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const deliverylockers()),
                ),
              ),
            ],
          ),
        )
    );
  }
}

Widget _buildGridViewItem(String iconAssetPath, String label, {required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
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
              Image.asset(iconAssetPath, height: 53, width: 53),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

