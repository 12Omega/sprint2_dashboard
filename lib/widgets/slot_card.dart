import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/slot_provider.dart';

class SlotCard extends StatelessWidget {
  final int slotNumber;
  final String status;

  const SlotCard({
    super.key,
    required this.slotNumber,
    required this.status,
  });

  void _toggleBooking(BuildContext context) {
    final isAvailable = status == 'Available';
    final newStatus = isAvailable ? 'Booked' : 'Available';
    Provider.of<SlotProvider>(context, listen: false)
        .updateStatus(slotNumber, newStatus);
  }

  @override
  Widget build(BuildContext context) {
    final isAvailable = status == 'Available';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      color: isAvailable ? Colors.green[100] : Colors.blue[100],
      child: ListTile(
        leading: Icon(
          isAvailable ? Icons.check_circle : Icons.directions_car,
          color: isAvailable ? Colors.green : Colors.blue,
        ),
        title: Text(
          'Slot $slotNumber',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          status,
          style: TextStyle(
            color: isAvailable ? Colors.green : Colors.blue[900],
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: ElevatedButton(
          onPressed: () => _toggleBooking(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: isAvailable ? Colors.green : Colors.red,
            foregroundColor: Colors.white,
          ),
          child: Text(isAvailable ? 'Book' : 'Cancel'),
        ),
      ),
    );
  }
}



