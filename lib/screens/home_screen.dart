import 'package:flutter/material.dart';
import 'package:sprint2_dashbaord/widgets/slot_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const SlotListPage(),
    const BookingsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart Parking',
          style: TextStyle(
            fontFamily: 'Romanesco',
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Slots',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class SlotListPage extends StatelessWidget {
  const SlotListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> slots = [
      {'slotNumber': 1, 'status': 'Available'},
      {'slotNumber': 2, 'status': 'Occupied'},
      {'slotNumber': 3, 'status': 'Available'},
    ];

    return ListView.builder(
      itemCount: slots.length,
      itemBuilder: (context, index) {
        return SlotCard(
          slotNumber: slots[index]['slotNumber'],
          status: slots[index]['status'],
        );
      },
    );
  }
}

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> bookings = [
      {
        'slot': '2',
        'vehicle': 'BA 2 PA 1234',
        'time': '10:00 AM - 12:00 PM',
      },
      {
        'slot': '5',
        'vehicle': 'BA 3 PA 5678',
        'time': '1:00 PM - 3:00 PM',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: const Icon(Icons.car_rental),
            title: Text('Slot ${booking['slot']}'),
            subtitle: Text(
              'Vehicle: ${booking['vehicle']}\nTime: ${booking['time']}',
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pratham Shrestha',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'pratham@example.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}




