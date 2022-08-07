import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expense/app/constant/color.dart';
import 'package:expense/app/data/data_sales.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';
import '../views/widget/balance_info.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            /// BACKGROUND
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    appYellowSoft,
                    appPrimary.withOpacity(0.2),
                  ],
                ),
              ),
            ),

            /// PAGE VIEW
            SafeArea(
              child: Column(
                children: [
                  /// TIDAK BISA DI SCROLL
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/profile/profile.jpg"),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.keyboard_arrow_down_outlined),
                            Text("Oktober"),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_active,
                            color: appPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),
                  const Text("Account Balance"),
                  const SizedBox(height: 9),
                  const Text(
                    "\$9400",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 27),

                  /// COMTAINER BALANCE DAN INCOME
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      /// CONTAINER 1 GREEN
                      BalanceInfo(isIncome: true, balance: 5000),

                      ///Container 2 red
                      BalanceInfo(isIncome: false, balance: 2500),
                    ],
                  ),
                  const SizedBox(height: 15),

                  /// BISA DI SCROLL
                  Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Spend Frequency",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        /// GRAFIK
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 300,
                            width: controller.chartData.length * 100,
                            child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(),
                              series: <ChartSeries>[
                                // Renders line chart
                                SplineSeries<SalesData, DateTime>(
                                  color: appPrimary,
                                  width: 4,
                                  dataSource: controller.chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                ),
                                SplineSeries<SalesData, DateTime>(
                                  color: appRed,
                                  width: 2,
                                  dataSource: controller.chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) => 300,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        /// TABBAR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: appYellowSoft,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Text(
                                "Today",
                                style: TextStyle(
                                  color: appYellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text(
                              "Week",
                              style: TextStyle(
                                color: appTextSoft,
                              ),
                            ),
                            const Text(
                              "Month",
                              style: TextStyle(
                                color: appTextSoft,
                              ),
                            ),
                            const Text(
                              "Year",
                              style: TextStyle(
                                color: appTextSoft,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// RECENT TRASACTION
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Recent Transaction",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: appVioletSoft,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                    color: appPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        ///
                        ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            /// DATA IMAGE URL
                            List urlImage = controller.urlImage;

                            /// DATA TITTLE BUTTON
                            List titleButton = controller.tilteButton;

                            /// DATA SUBTITTLE BUTTON
                            List subtitleButton = controller.subtilteButton;

                            /// DATA PRICE BUTTON
                            List priceButton = controller.priceButton;

                            /// DATA TIME BUTTON
                            List timeButton = controller.timeButton;

                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              title: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                      color: appYellowSoft,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                      urlImage[index],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              titleButton[index],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "- ${priceButton[index]}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: appRed,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              subtitleButton[index],
                                              style: const TextStyle(
                                                color: appTextSoft,
                                              ),
                                            ),
                                            Text(
                                              timeButton[index],
                                              style: const TextStyle(
                                                color: appTextSoft,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /// BOTTOM NAVIGATIION
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: appWhite,
            color: appPrimary,
            activeColor: appPrimary,
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Transaction'),
              TabItem(icon: Icons.add, title: 'Add'),
              TabItem(icon: Icons.message, title: 'Budget'),
              TabItem(icon: Icons.people, title: 'Profile'),
            ],
            initialActiveIndex: 0, //optional, default as 0
            onTap: (int i) {}));
  }
}
