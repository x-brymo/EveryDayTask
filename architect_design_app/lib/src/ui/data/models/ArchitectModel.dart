class ArchitectModel {
  String imageUrl, name, description, price;

  ArchitectModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'price': price,
    };
  }
  factory ArchitectModel.fromMap(Map<String, dynamic> map) {
    return ArchitectModel(
      imageUrl: map['imageUrl'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }
  @override
  String toString() {
    return 'ArchitectModel(imageUrl: $imageUrl, name: $name, description: $description, price: $price)';
  }
}

List<ArchitectModel> listModel = [
  ArchitectModel(
    imageUrl: "kitchen.png",
    name: "Kitchen 1",
    description: "The furniture from \n quality designed houses.",
    price: "\$4,800",
  ),
  ArchitectModel(
    imageUrl: "office.png",
    name: "Office 1",
    description: "Highest level of \n refinement and comfort.",
    price: "\$4,800",
  ),
  ArchitectModel(
    imageUrl: "land.png",
    name: "Land 1",
    description: "The land from \n the heaven.",
    price: "\$4,800",
  ),
];
