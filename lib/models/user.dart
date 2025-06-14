class UserModel {
  final String id;
  final String image;
  final String name;
  final String description;

  UserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'description': description,
    };
  }
}
