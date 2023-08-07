class Test {
  final String id;
  final String name;

  Test({required this.id, required this.name});

  factory Test.fromJson(Map<String, dynamic> json) {
      return Test(
        id: json['id'] as String,
        name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}