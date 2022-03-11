class TransactionModel {
  String transactionNumber;
  String transactionDate;
  String transactionStatus;
  String transactionSum;
  String transactionPerson;
  String sent;
  String amount;
  String person;

  TransactionModel(
      this.transactionNumber,
      this.transactionDate,
      this.transactionStatus,
      this.transactionPerson,
      this.transactionSum,
      this.sent,
      this.amount,
      this.person);
}

List<TransactionModel> transaction = transactionData
    .map((item) => TransactionModel(
        item['transactionNumber'].toString(),
        item['transactionDate'].toString(),
        item['transactionStatus'].toString(),
        item['transactionSum'].toString(),
        item['transactionPerson'].toString(),
        item['sent'].toString(),
        item['amount'].toString(),
        item['person'].toString()))
    .toList();

var transactionData = [
  {
    "transactionNumber": "N 2343434",
    "transactionDate": "21 декабря 2021",
    "transactionStatus": "Статус",
    "transactionSum": "Сумма",
    "transactionPerson": "Получатель",
    "sent": "Отправлено",
    "amount": "3 000 000 UZS",
    "person": "Bayahmedov Sardor"
  },
];
