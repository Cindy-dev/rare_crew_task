class DBModel {
  final String id;
  final String name;
  final String occupation;
  final num age;

  DBModel(
      {required this.id,
      required this.name,
      required this.occupation,
      required this.age});

  DBModel copyWith(
      {required String id,
      required String name,
      required String occupation,
      required num age}) {
    return DBModel(
      id: this.id,
      name: name,
      occupation: occupation,
      age: age
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "occupation": occupation,
        "age": age,
      };
}
