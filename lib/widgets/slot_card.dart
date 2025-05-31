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

  void _toggleStatus(BuildContext context) {
    final newStatus = status == 'Available' ? 'Occupied' : 'Available';
    Provider.of<SlotProvider>(context, listen: false)
        .updateStatus(slotNumber, newStatus);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toggleStatus(context),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: status == 'Available' ? Colors.green[100] : Colors.red[100],
        elevation: 3,
        child: ListTile(
          leading: Icon(
            status == 'Available' ? Icons.check_circle : Icons.cancel,
            color: status == 'Available' ? Colors.green : Colors.red,
          ),
          title: Text(
            'Slot $slotNumber',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            status,
            style: TextStyle(
              color: status == 'Available' ? Colors.green : Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}


