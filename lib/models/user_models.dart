class UserModel {
  final String fullName;
  final String email;
  final String phone;
  final String userTitle; // Doc, Pharmacist, e.t.c
  final String idNumber;
  final String uid;
  final String age;
  final  startDate;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.userTitle,
    required this.idNumber,
    required this.uid,
    required this.age,
    required this.startDate,
  });

// toJson

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "userTitle": userTitle,
        "idNumber": idNumber,
        "uid": uid,
        "age": age,
        "startDate": startDate,
      };
}
