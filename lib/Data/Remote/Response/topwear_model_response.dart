class TopWearModel {

  int? id;
  String? title;
  String? description;
  String? image;
  String? price;


  TopWearModel({this.id,this.title,this.description,this.image,this.price});

  factory TopWearModel.fromJson(Map<String, dynamic> json) {
    return TopWearModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        price: json['price']
    );
  }

}