import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/slot_provider.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookedSlots = Provider.of<SlotProvider>(context)
        .slots
        .where((slot) => slot.status == 'Booked')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Slots'),
      ),
      body: bookedSlots.isEmpty
          ? const Center(child: Text('No slots booked yet.'))
          : ListView.builder(
        itemCount: bookedSlots.length,
        itemBuilder: (ctx, index) {
          final slot = bookedSlots[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.directions_car),
              title: Text('Slot ${slot.slotNumber}'),
              subtitle: const Text('Status: Booked'),
            ),
          );
        },
      ),
    );
  }
}
