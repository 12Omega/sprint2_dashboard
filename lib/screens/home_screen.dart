import 'package:flutter/material.dart';
import '../widgets/slot_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Parking')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(6, (index) {
          return SlotCard(
            slotNumber: index + 1,
            status: index % 2 == 0 ? 'Available' : 'Occupied',
          );
        }),
      ),
    );
  }
}
