import 'package:flutter/material.dart';

class SlotCard extends StatelessWidget {
  final int slotNumber;
  final String status;

  const SlotCard({
    super.key,
    required this.slotNumber,
    required this.status,
  });

  Color getStatusColor() {
    return status == 'Available' ? Colors.green : Colors.red;
  }

  IconData getStatusIcon() {
    return status == 'Available' ? Icons.check_circle : Icons.cancel;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              getStatusIcon(),
              color: getStatusColor(),
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Slot $slotNumber',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Status: $status',
                    style: TextStyle(
                      fontSize: 14,
                      color: getStatusColor(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

