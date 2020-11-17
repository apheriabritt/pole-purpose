


class SavedModel {
  int id;
  int card1;
  int card2;
  int card3;

  SavedModel({this.id, this.card1, this.card2, this.card3});

  SavedModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.card1 = map['card1'];
    this.card2 = map['card2'];
    this.card3 = map['card3'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'card1': this.card1,
      'card2': this.card1,
      'card3': this.card3,
    };
  }
}