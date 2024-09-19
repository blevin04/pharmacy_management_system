import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management_system/models/category_model.dart';
import 'package:pharmacy_management_system/models/drugs_model.dart';
import 'package:pharmacy_management_system/models/stock_model.dart';
import 'package:uuid/uuid.dart';
import '../models/supplier_model.dart';

/// This is the engine of the software that controls the whole backend
/// system of the software.
/// The backend system has been coded and worked on solely by Simon Kamangaru

class FirestoreMethods {
  // firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // auth
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  // ============================== add data to the database ===================
  // function to add stock to the database
  Future<void> addStock(
    String supplierName, //  name of the supplier
    String productSupplied, // the supllied product
    String number, // number of supplied products
    String totalAmount,
  ) async {
    try {
      // unique id
      String stockId = const Uuid().v1();

      // stock model
      StockModel stockModel = StockModel(
        uid: stockId,
        supplierName: supplierName,
        productSupplied: productSupplied,
        number: number,
        totalAmount: totalAmount,
        dateOfSupply: DateTime.now(),
      );

      // send the data to the database
      await _firestore
          .collection("stock")
          .doc(stockId)
          .set(stockModel.toJson());
    } catch (e) {
      e.toString();
    }
  }

  bool repeated = false;

  // function to add category
  Future<void> addCategory(
    String category, // name of the category
  ) async {
    try {
      // unique id
      String categoryId = const Uuid().v1();

      CategoryModel categoryModel = CategoryModel(
        uid: categoryId,
        category: category,
      );
      _firestore
          .collection("category")
          .where("category", isEqualTo: category)
          .get()
          .then((query) {
        if (query.docs.isNotEmpty) {
          SnackBar(content: Text("${category} is already added"));
          repeated = true;
        }
      });
      // send the data to the database
      if (!repeated) {
        await _firestore
            .collection("category")
            .doc(categoryId)
            .set(categoryModel.toJson());
      }
    } catch (e) {
      e.toString();
    }
  }

  // function to add drugs
  Future<void> addDrugs(
    String photoUri,
    String productName,
    String costPrice,
    manufacturingDate,
    String productsQuantity,
    String productsCategory,
    String sellingPrice,
    expiryDate,
    String barcodeNumber,
  ) async {
    try {
      // unique id
      String drugId = const Uuid().v1();

      // drug's model
      DrugsModel drugModel = DrugsModel(
        uid: drugId,
        image: photoUri,
        productName: productName,
        costPrice: costPrice,
        manufacturingDate: manufacturingDate,
        productsQuantity: productsQuantity,
        productsCategory: productsCategory,
        sellingPrice: sellingPrice,
        expiryDate: expiryDate,
        barcodeNumber: barcodeNumber,
      );

      // send the data to the database
      await _firestore.collection("drugs").doc(drugId).set(drugModel.toJson());
    } catch (e) {
      e.toString();
    }
  }

  // function to add supplier
  Future<void> addSupplier(
    String category, // product category
    String email, // email address of the supplier
    String supplierContact,
  ) async {
    try {
      // unique id
      String supplerId = const Uuid().v1();

      SupplierModel supplierModel = SupplierModel(
          uid: supplerId,
          category: category,
          email: email,
          supplierContact: supplierContact,
          dateJoined: DateTime.now());

      // send the data to the database
      await _firestore
          .collection("suppliers")
          .doc(supplerId)
          .set(supplierModel.toJson());
    } catch (e) {
      e.toString();
    }
  }

  // =========================== functions to delete products ======================

  // function to delete a  category
  Future<void> deleteCategory(String categoryId) async {
    try {
      // delete data from the database
      await _firestore.collection("category").doc(categoryId).delete();
    } catch (e) {
      e.toString();
    }
  }

  // function to delete a drugs
  Future<void> deleteDrugs(String drugId) async {
    try {
      // delete data from the database
      await _firestore.collection("drugs").doc(drugId).delete();
    } catch (e) {
      e.toString();
    }
  }

  // function to delete a products supplier
  Future<void> deleteProductSuppliers(String supplierId) async {
    try {
      // delete data from the database
      await _firestore.collection("suppliers").doc(supplierId).delete();
    } catch (e) {
      e.toString();
    }
  }

  // ================== functions to update database =================================

  // function to update a  category
  Future<void> updateCategory(
    String categoryId,
    String category,
  ) async {
    try {
      // update
      await _firestore
          .collection("category")
          .doc(categoryId)
          .update({"category": category});
    } catch (e) {
      e.toString();
    }
  }

  // function to update a drugs
  Future<void> updateDrugs(
    String photoUri,
    String productName,
    String costPrice,
    manufacturingDate,
    String productsQuantity,
    String productsCategory,
    String sellingPrice,
    expiryDate,
    String barcodeNumber,
    String drugId,
  ) async {
    try {
      // drug's model
      DrugsModel drugModel = DrugsModel(
        uid: drugId,
        image: photoUri,
        productName: productName,
        costPrice: costPrice,
        manufacturingDate: manufacturingDate,
        productsQuantity: productsQuantity,
        productsCategory: productsCategory,
        sellingPrice: sellingPrice,
        expiryDate: expiryDate,
        barcodeNumber: barcodeNumber,
      );
      // update
      await _firestore
          .collection("drugs")
          .doc(drugId)
          .update(drugModel.toJson());
    } catch (e) {
      e.toString();
    }
  }

  // function to update a products supplier
  Future<void> updateProductSuppliers(
    String uid, // uid of the supplier
    String category, // product category
    String email, // email address of the supplier
    String supplierContact,
  ) async {
    try {
      // update
      await _firestore.collection("suppliers").doc(uid).update({
        "category": category,
        "email": email,
        "supplierContact": supplierContact,
      });
    } catch (e) {
      e.toString();
    }
  }
}
