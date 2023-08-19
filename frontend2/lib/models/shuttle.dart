class Shuttle {
  String? id;
  String? name;
  String? type;
  int? capacity;

  Shuttle({
    this.id,
    this.name,
    this.type,
    this.capacity,
  });

  static Shuttle fromJson(jsonDecode) {
    return Shuttle(
      id: jsonDecode['id'],
      name: jsonDecode['name'],
      type: jsonDecode['type'],
      capacity: jsonDecode['capacity'],
    );
  }

  static Map<String, dynamic> toJson(Shuttle shuttle) {
    return {
      'id': shuttle.id,
      'name': shuttle.name,
      'type': shuttle.type,
      'capacity': shuttle.capacity,
    };
  }

  @override
  String toString() {
    return 'Shuttle{id: $id, name: $name, type: $type, capacity: $capacity}';
  }
}
