import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/slot_provider.dart';
import '../widgets/slot_card.dart';
import 'booking_summary_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final slots = Provider.of<SlotProvider>(context).slots;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Parking Dashboard'),
      ),
      body: ListView.builder(
        itemCount: slots.length,
        itemBuilder: (ctx, index) {
          final slot = slots[index];
          return SlotCard(
            slotNumber: slot.slotNumber,
            status: slot.status,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const BookingSummaryScreen(),
            ),
          );
        },
        icon: const Icon(Icons.list),
        label: const Text('Bookings'),
      ),
    );
  }
}






