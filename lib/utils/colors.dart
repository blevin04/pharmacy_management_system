import 'package:flutter/material.dart';

const Color primaryColor = Colors.white; // white color - primary color
const Color redColor = Colors.red; // red color
const Color secondaryColor = Colors.grey; // grey color - secondary color

const LinearGradient drugsAddedColors = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      redColor,
      Colors.pink,
      Colors.orange,
    ]);

const LinearGradient lowStockDrugsGradientColors = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Colors.green,
      Colors.purple,
      Colors.pink,
    ]);

const LinearGradient expiredProductsGradientColors = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Colors.blue,
      Color.fromARGB(255, 176, 139, 39),
      Color.fromARGB(255, 30, 233, 199),
    ]);

const LinearGradient totalSalesMadeGradientColors = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 184, 33, 243),
      Color.fromARGB(255, 176, 39, 146),
      Color.fromARGB(255, 233, 30, 74),
    ]);

const LinearGradient profitCurrentMonthGradientColors = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 243, 194, 33),
      Color.fromARGB(255, 139, 176, 39),
      Color.fromARGB(255, 30, 233, 81),
    ]);

const LinearGradient totalProfitMadeGradientColors = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 243, 100, 33),
      Color.fromARGB(255, 176, 117, 39),
      Color.fromARGB(255, 233, 186, 30),
    ]);
