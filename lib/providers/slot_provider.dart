import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/slot.dart';

class SlotProvider with ChangeNotifier {
  List<Slot> _slots = [];

  SlotProvider() {
    _loadSlotsFromPrefs();
  }

  List<Slot> get slots => _slots;

  Future<void> _loadSlotsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('slot_count') ?? 3;

    _slots = List.generate(count, (index) {
      final key = 'slot_${index + 1}_status';
      final status = prefs.getString(key) ?? 'Available';
      return Slot(slotNumber: index + 1, status: status);
    });

    notifyListeners();
  }

  Future<void> updateStatus(int slotNumber, String newStatus) async {
    final index = _slots.indexWhere((slot) => slot.slotNumber == slotNumber);
    if (index != -1) {
      _slots[index] = Slot(slotNumber: slotNumber, status: newStatus);
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('slot_${slotNumber}_status', newStatus); // ✅ fixed
    }
  }
}


