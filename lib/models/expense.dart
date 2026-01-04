enum ExpenseCategory {
  food,
  travel,
  shopping,
  others,
}

class Expense {
  final String id;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;

  Expense({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
  });

  /// Helper to get a display name for the category
  String get categoryName {
    switch (category) {
      case ExpenseCategory.food:
        return 'Food';
      case ExpenseCategory.travel:
        return 'Travel';
      case ExpenseCategory.shopping:
        return 'Shopping';
      case ExpenseCategory.others:
        return 'Others';
    }
  }
}
