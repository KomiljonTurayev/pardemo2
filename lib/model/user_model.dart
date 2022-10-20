class User {
  int id = -1;
  String name = "";
  String salary = "";
  String age = "";

  User(
      {required this.id,
      required this.name,
      required this.salary,
      required this.age});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'salary': salary,
        'age': age,
      };
}
