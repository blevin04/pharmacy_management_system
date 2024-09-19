// ignore_for_file: prefer_typing_uninitialized_variables

class SupplierModel {
  final String uid; // uid of the supplier
  final String category; // product category
  final String email; // email address of the supplier
  final String supplierContact; // phone number of the supplier
  final dateJoined;

  SupplierModel(
      {required this.uid,
      required this.category,
      required this.email,
      required this.dateJoined,
      required this.supplierContact});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "category": category,
        "email": email,
        "dateJoined": dateJoined,
        "supplierContact": supplierContact,
      };
}
