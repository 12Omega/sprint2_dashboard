import 'package:flutter/material.dart';
import '../widgets/slot_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart Parking',
          style: TextStyle(
            fontFamily: 'Romanesco',
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlotCard(
            slotNumber: index + 1,
            status: index % 2 == 0 ? 'Available' : 'Occupied',
          );
        },
      ),
    );
  }
}

