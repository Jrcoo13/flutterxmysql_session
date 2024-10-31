class User {
  int? id;
  // String? userName;
  // String? email;
  // String? mobileNumber;
  // String? address;

  User({this.id});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    // userName = json['name'] ?? '';
    // email = json['email'] ?? '';
    // mobileNumber = json['mobileNumber'] ?? '';
    // address = json['address'] ?? '';
  }

  toJson() {
    return {
      'id': id ?? 0,
      // 'name': userName ?? '',
      // 'email': email ?? '',
      // 'mobileNumber': mobileNumber ?? '',
      // 'address': address ?? '',
    };
  }
}
