class AllProductsModel {

  int? id;
  String? title;
  String? description;
  String? image;
  String? price;


  AllProductsModel({this.id,this.title,this.description,this.image,this.price});

factory AllProductsModel.fromJson(Map<String, dynamic> json) {
  return AllProductsModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    image: json['image'],
    price: json['price']
  );
}

}