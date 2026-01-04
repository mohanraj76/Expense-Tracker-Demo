import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/expense.dart';

class ExpenseStorage {
  static const String _key = 'expenses';

  /// Save expenses to local storage
  static Future<void> saveExpenses(List<Expense> expenses) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList = expenses.map((e) => {
      'id': e.id,
      'amount': e.amount,
      'category': e.category.index,
      'date': e.date.toIso8601String(),
    }).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  /// Load expenses from local storage
  static Future<List<Expense>> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_key);
    
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Expense(
        id: json['id'] as String,
        amount: (json['amount'] as num).toDouble(),
        category: ExpenseCategory.values[json['category'] as int],
        date: DateTime.parse(json['date'] as String),
      )).toList();
    } catch (e) {
      return [];
    }
  }
}
