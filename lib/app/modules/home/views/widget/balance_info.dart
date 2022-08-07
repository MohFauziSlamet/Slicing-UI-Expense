import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:expense/app/constant/color.dart';

class BalanceInfo extends StatelessWidget {
  const BalanceInfo({Key? key, required this.isIncome, required this.balance})
      : super(key: key);

  final bool isIncome;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isIncome == true ? appGreen : appRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: appWhite,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(
              isIncome == true ? "assets/icon/in.png" : "assets/icon/out.png",
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isIncome == true ? "Income" : "Outcome",
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: appWhite,
                  ),
                ),
                const SizedBox(height: 5),
                FittedBox(
                  child: Text(
                    "\$$balance",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: appWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
