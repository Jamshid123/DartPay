class CardModel {
  String cardName;
  String cardType;
  String cardNumber;

  CardModel(this.cardName, this.cardType, this.cardNumber);
}

List<CardModel> cardList = cardData
    .map((item) => CardModel(item['cardName'].toString(),
        item['cardType'].toString(), item['cardNumber'].toString()))
    .toList();

var cardData = [
  {
    "cardName": "Название карты",
    "cardType": "assets/images/uzcard_logo_large.png",
    "cardNumber": "8600 **** **** 0000",
  },
  {
    "cardName": "Название карты",
    "cardType": "assets/images/uzcard_logo_large.png",
    "cardNumber": "8600 **** **** 0000",
  },
  {
    "cardName": "Название карты",
    "cardType": "assets/images/uzcard_logo_large.png",
    "cardNumber": "8600 **** **** 0000",
  }
];
