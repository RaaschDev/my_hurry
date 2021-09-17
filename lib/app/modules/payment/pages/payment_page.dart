import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/controllers/event/event_controller.dart';
import 'package:hurry/app/modules/payment/payment_store.dart';
import 'package:hurry/app/modules/src/appbar/ht_default_appbar.dart';
import 'package:hurry/app/modules/src/buttons/primary_button.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/inputs/register_input.dart';
import 'package:hurry/app/modules/src/texts.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  const PaymentPage({Key? key, this.title = 'PaymentPage'}) : super(key: key);
  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  final PaymentStore store = Modular.get();
  TextEditingController quantController = TextEditingController();
  PaymentStore paymentStore = Modular.get();
  EventController eventController = Modular.get();

  @override
  Widget build(BuildContext context) {
    paymentStore.getTiket(eventController.eventModel?.id);
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: PreferredSize(
          child: HTDefaultAppBar(),
          preferredSize: Size(double.maxFinite, 150),
        ),
        body: LayoutBuilder(builder: (_, constrains) {
          return Observer(
              builder: (context) => Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                ),
                                Text(
                                  "${eventController.eventModel?.description ?? 'Não existe'}",
                                  style: HTText.primaryTitleTextStyle,
                                ),
                                Text(
                                  'colocar compania aqui  Organizado por ${eventController.eventModel?.city}',
                                  style: HTText.accentTextStyle,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: AppColors.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${eventController.eventModel?.date} - ${eventController.eventModel?.start} ate ${eventController.eventModel?.end}',
                                      style: HTText.accentButtonTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Nome da casa de evendo",
                                      style: HTText.accentButtonTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Categoria de ingresso',
                                    style: HTText.primaryTitleTextStyle,
                                  ),
                                ),
                                Container(
                                  height: 160,
                                  child: ListView.builder(
                                      itemCount: paymentStore.listArtist.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        var tikets =
                                            paymentStore.listArtist[index];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          child: InkWell(
                                            onTap: () {
                                              paymentStore.setValorTiket(
                                                  double.parse(tikets.price));
                                              paymentStore.selecionado();
                                            },
                                            child: Container(
                                              width: 200,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.black38),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${tikets.description}",
                                                    style: HTText
                                                        .primaryTitleTextStyle,
                                                  ),
                                                  Text(
                                                    'R\$ ' + "${tikets.price}",
                                                    style: HTText
                                                        .primaryTitleTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Tipo de ingresso',
                                    style: HTText.primaryTitleTextStyle,
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    height: 100,
                                    width: constrains.maxWidth,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          child: Container(
                                            width: constrains.maxWidth * 0.37,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black38,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Meia',
                                                  style: HTText
                                                      .primaryTitleTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          child: Container(
                                            width: constrains.maxWidth * 0.37,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black38,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Inteira',
                                                  style: HTText
                                                      .primaryTitleTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Quantidade',
                                    style: HTText.primaryTitleTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                    height: 80,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: AppColors.backGroundColor,
                                            child: Center(
                                              child: MaterialButton(
                                                onPressed: () {
                                                  paymentStore.remTiket();
                                                },
                                                height: 56,
                                                minWidth: 56,
                                                color: Colors.orange,
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 35),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: AppColors.backGroundColor,
                                            child: Center(
                                              child: Text(
                                                paymentStore.quantidade
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: AppColors.backGroundColor,
                                            child: Center(
                                              child: MaterialButton(
                                                onPressed: () {
                                                  paymentStore.addTiket();
                                                },
                                                height: 56,
                                                minWidth: 56,
                                                color: Colors.orange,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Valor Total',
                              style: HTText.primaryTitleTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'R\$ ' + paymentStore.valorTotal.toString(),
                              style: HTText.accentTextStyleFont,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryButton(
                                  onPressed: () {
                                    Modular.to
                                        .pushNamed('/payment/card_payment');
                                  },
                                  text: 'Cartao de Credito',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                PrimaryButton(
                                  onPressed: () {
                                    Modular.to
                                        .pushNamed('/payment/pix_payment');
                                  },
                                  text: 'Pix',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
        }));
  }
}
