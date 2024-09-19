
class DrugsModel {
  final String uid;
  final String image;
  final String productName;
  final String costPrice;
  final  manufacturingDate;
  final String productsQuantity;
  final String productsCategory;
  final String sellingPrice;
  final  expiryDate;
  final String barcodeNumber;

  DrugsModel({
    required this.uid,
    required this.image,
    required this.productName,
    required this.costPrice,
    required this.manufacturingDate,
    required this.productsQuantity,
    required this.productsCategory,
    required this.sellingPrice,
    required this.expiryDate,
    required this.barcodeNumber,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "image": image,
        "productName": productName,
        "costPrice": costPrice,
        "manufacturingDate": manufacturingDate,
        "productsQuantity": productsQuantity,
        "productsCategory": productsCategory,
        "sellingPrice": sellingPrice,
        "expiryDate": expiryDate,
        "barcodeNumber": barcodeNumber,
      };
}
