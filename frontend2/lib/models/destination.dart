class Destination{
  String? id;
  String? name;
  String? description;
  String? image;
  List<String>? docks;

  Destination({
    this.id,
    this.name,
    this.description,
    this.image,
    this.docks,
  });

  static Destination fromJson(jsonDecode) {
    return Destination(
      id: jsonDecode['id'],
      name: jsonDecode['name'],
      description: jsonDecode['description'],
      image: jsonDecode['image'],
      docks: jsonDecode['docks'],
    );
  }

  static Map<String, dynamic> toJson(Destination destination) {
    return {
      'id': destination.id,
      'name': destination.name,
      'description': destination.description,
      'image': destination.image,
      'docks': destination.docks,
    };
  }

  @override
  String toString() {
    return 'Destination{id: $id, name: $name, description: $description, image: $image, docks: $docks}';
  }

}
