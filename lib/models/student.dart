class Student {
  final String id;
  final String name;
  final String nisn;
  final String adress; // kept as 'adress' to match your firestore field name if used
  final String phone;

  Student({
    required this.id,
    required this.name,
    required this.nisn,
    required this.adress,
    required this.phone,
  });

  factory Student.fromMap(String id, Map<String, dynamic> data) {
    // accept both 'address' and 'adress' keys
    final addr = data['adress'] ?? data['address'] ?? '';
    return Student(
      id: id,
      name: data['name'] ?? '',
      nisn: data['nisn'] ?? data['NISN'] ?? '',
      adress: addr,
      phone: data['phone'] ?? data['Phone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nisn': nisn,
      'adress': adress,
      'phone': phone,
    };
  }
}
