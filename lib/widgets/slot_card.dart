import 'package:flutter/material.dart';

class SlotCard extends StatelessWidget {
  final int slotNumber;
  final String status;

  const SlotCard({
    super.key,
    required this.slotNumber,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text('Slot $slotNumber'),
        subtitle: Text('Status: $status'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigation to detail screen will come later
        },
      ),
    );
  }
}
