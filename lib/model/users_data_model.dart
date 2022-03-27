class UsersData {
  late String? expenses;
  late String? paymentType;
  late int? price;
  late DateTime? date;

  UsersData({this.expenses, this.paymentType, this.price, this.date});

  factory UsersData.fromMap(Map<String, dynamic> json) {
    return UsersData(
      expenses: json['expenses'],
      paymentType: json['payment'],
      price: json['price'],
      date: DateTime.parse(json['date'].toDate().toString()),
    );
  }

  Map<String, dynamic> toMap() => {
        'expenses': expenses,
        'payment': paymentType,
        'price': price,
        'date': date
      };
}
