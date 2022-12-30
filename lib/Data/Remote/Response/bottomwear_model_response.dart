class BottomWearModel {

  int? id;
  String? title;
  String? description;
  String? image;
  String? price;


  BottomWearModel({this.id,this.title,this.description,this.image,this.price});

  factory BottomWearModel.fromJson(Map<String, dynamic> json) {
    return BottomWearModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        price: json['price']
    );
  }

}