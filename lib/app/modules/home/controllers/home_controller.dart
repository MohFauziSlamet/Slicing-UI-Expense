import 'package:expense/app/data/data_sales.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// DATA IMAGE URL
  List urlImage = [
    "assets/icon/shopping-bag.png",
    "assets/icon/recurring-bill.png",
    "assets/icon/restaurant.png",
  ];

  /// DATA IMAGE URL
  List tilteButton = [
    "Shopping",
    "Subscription",
    "Food",
  ];

  /// DATA SUBTITTLE BUTTON
  List subtilteButton = [
    "Buy some grocery",
    "Disney+ Annual..",
    "Buy a ramen",
  ];

  /// DATA PRICE BUTTON
  List priceButton = [
    "\$120",
    "\$80",
    "\$32",
  ];

  /// DATA TIME BUTTON
  List timeButton = [
    "10.00 AM",
    "03.30 AM",
    "07.30 AM",
  ];

  final List<SalesData> chartData = [
    SalesData(DateTime(2010), 451),
    SalesData(DateTime(2011), 282),
    SalesData(DateTime(2012), 343),
    SalesData(DateTime(2013), 524),
    SalesData(DateTime(2014), 205),
    SalesData(DateTime(2015), 205),
    SalesData(DateTime(2016), 205),
  ];
}
