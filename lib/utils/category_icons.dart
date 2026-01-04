import 'package:flutter/material.dart';
import '../models/expense.dart';

/// Returns the appropriate icon for each expense category
IconData getCategoryIcon(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.food:
      return Icons.restaurant;
    case ExpenseCategory.travel:
      return Icons.flight;
    case ExpenseCategory.shopping:
      return Icons.shopping_bag;
    case ExpenseCategory.others:
      return Icons.inventory_2;
  }
}

/// Returns a color for each expense category
Color getCategoryColor(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.food:
      return Colors.orange;
    case ExpenseCategory.travel:
      return Colors.blue;
    case ExpenseCategory.shopping:
      return Colors.pink;
    case ExpenseCategory.others:
      return Colors.grey;
  }
}
