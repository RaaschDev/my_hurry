import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/events/events_store.dart';
import 'package:hurry/app/modules/src/appbar/ht_default_appbar.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class Consumiveis extends StatefulWidget {
  const Consumiveis({Key? key}) : super(key: key);

  @override
  _ConsumiveisState createState() => _ConsumiveisState();
}

class _ConsumiveisState extends State<Consumiveis> {
  PageController pageController = PageController();
  int? currentPage;

  @override
  void initState() {
    currentPage = 0;
    super.initState();
  }

  double tamanhoCard = 100;
  EventsStore eventsStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        child: HTDefaultAppBar(),
        preferredSize: Size(double.maxFinite, 150),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      currentPage = 0;
                      setState(() {});
                      pageController.jumpToPage(0);
                    },
                    child: Text(
                      'Bebidas',
                      style: currentPage == 0
                          ? HTText.primaryTextStyle
                          : HTText.accentTextStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      currentPage = 1;
                      setState(() {});
                      pageController.jumpToPage(1);
                    },
                    child: Text(
                      'Comidas',
                      style: currentPage == 1
                          ? HTText.primaryTextStyle
                          : HTText.accentTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: PageView(
                  onPageChanged: (page) {
                    currentPage = page;
                    setState(() {});
                  },
                  controller: pageController,
                  children: [
                    Container(
                      child: ListView.builder(
                          itemCount: eventsStore.listConsumables.length,
                          itemBuilder: (context, index) {
                            var consumablesDrink =
                                eventsStore.listConsumables[index];
                            if (consumablesDrink.consumableType != 'drink') {
                              return SizedBox();
                            } else {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Container(
                                  height: tamanhoCard,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${consumablesDrink.description}",
                                                  style: HTText.accentTextStyle,
                                                ),
                                                Text(
                                                  "${consumablesDrink.price}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${consumablesDrink.img}"),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: eventsStore.listConsumables.length,
                          itemBuilder: (context, index) {
                            var consumablesFood =
                                eventsStore.listConsumables[index];
                            if (consumablesFood.consumableType == 'drink') {
                              return SizedBox();
                            } else {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Container(
                                  height: tamanhoCard,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${consumablesFood.description}",
                                                  style: HTText.accentTextStyle,
                                                ),
                                                Text(
                                                  "${consumablesFood.price}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${consumablesFood.img}"),
                                                fit: BoxFit.cover)),
                                        width: 150,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
