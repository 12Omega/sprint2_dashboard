import 'package:flutter/material.dart';
import '../models/slot.dart';

class SlotProvider with ChangeNotifier {
  final List<Slot> _slots = [
    Slot(slotNumber: 1, status: 'Available'),
    Slot(slotNumber: 2, status: 'Occupied'),
    Slot(slotNumber: 3, status: 'Available'),
  ];

  List<Slot> get slots => _slots;

  void updateStatus(int slotNumber, String newStatus) {
    final index = _slots.indexWhere((slot) => slot.slotNumber == slotNumber);
    if (index != -1) {
      _slots[index] = Slot(slotNumber: slotNumber, status: newStatus);
      notifyListeners();
    }
  }
}
