class Note {
  int? id;
  String? name;
  int? age;
  String? address;
  String? profession;
  Note({this.id,required this.name, required this.age, required this.address, 
  required this.profession});
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      // id: json['id'],
      name: json['name'],
      age: json['age'],
      address: json['address'],
      profession: json['profession'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'address': address,
      'profession': profession,
    };
  }
}