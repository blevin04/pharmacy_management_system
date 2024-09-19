class StockModel {
  final String uid; // stcok uid
  final String supplierName; //  name of the supplier
  final String productSupplied; // the supllied profuct
  final String number; // number of supplied products
  final String totalAmount;
  final dateOfSupply;

  StockModel({
    required this.uid,
    required this.supplierName,
    required this.productSupplied,
    required this.number,
    required this.totalAmount,
    required this.dateOfSupply,
  });

  // tojSon
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "supplierName": supplierName,
        "productSupplied": productSupplied,
        "number": number,
        "totalAmount": totalAmount,
        "dateOfSupply": dateOfSupply
      };
}
