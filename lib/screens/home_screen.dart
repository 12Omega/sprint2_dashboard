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
    const Center(child: Text('Bookings Page')),
    const Center(child: Text('Profile Page')),
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
    // Dummy data — we’ll replace this in a later commit with real logic
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



