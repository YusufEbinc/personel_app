class UsersData {
  late String? expenses;
  late String? paymentType;
  late int? price;
  late DateTime? date;

  UsersData({this.expenses, this.paymentType, this.price, this.date});

  factory UsersData.fromMap(Map<String, dynamic> json) {
    return UsersData(
      expenses: json['expenses'],
      paymentType: json['paymnet'],
      price: json['price'],
      date: DateTime.parse(json['date'].toDate().toString()),
    );
  }

  Map<String, dynamic> toMap() => {
        'expenses': expenses,
        'paymnet': paymentType,
        'price': price,
        'date': date
      };
}
