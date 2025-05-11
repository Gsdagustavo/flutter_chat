class User {
  final String id;
  final String name;
  final String image;

  User(this.id, this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['image']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, image: $image}';
  }
}
