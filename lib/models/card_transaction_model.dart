class CardTransactionModel {
  String userAvatar;
  String userName;
  String transactionStatus;
  String transactionAmount;
  String transactionTime;

  CardTransactionModel(this.userAvatar, this.userName, this.transactionStatus,
      this.transactionAmount, this.transactionTime);
}

List<CardTransactionModel> cardTransactionList = cardTransactionData
    .map((item) => CardTransactionModel(
        item['userAvatar'].toString(),
        item['userName'].toString(),
        item['transactionStatus'].toString(),
        item['transactionAmount'].toString(),
        item['transactionTime'].toString()))
    .toList();

var cardTransactionData = [
  {
    "userAvatar": "assets/images/userAvatar.png",
    "userName": "Bayahmedov S.R",
    "transactionStatus": "Отправлено",
    "transactionAmount": "- 1 000 000",
    "transactionTime": "14:00"
  },

];
