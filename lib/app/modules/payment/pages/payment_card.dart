import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/src/appbar/ht_default_appbar.dart';
import 'package:hurry/app/modules/src/buttons/primary_button.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/credit_card/ht_creditcard.dart';
import 'package:hurry/app/modules/src/inputs/register_input.dart';
import 'package:hurry/app/modules/src/texts.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        child: HTDefaultAppBar(),
        preferredSize: Size(double.maxFinite, 150),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: HTCreditCard(height: 200, width: double.maxFinite),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      child: HTRegisterInput(
                          hint: "CVV",
                          obscure: false,
                          controller: cvvController),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                    ),
                    Text(
                      'Detalhes',
                      style: HTText.primaryTitleTextStyle,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Categoria do ingresso',
                      style: HTText.primaryTitleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Camarote',
                      style: HTText.accentTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Tipo de ingresso',
                      style: HTText.primaryTitleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Inteiro',
                      style: HTText.accentTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Quantidade',
                      style: HTText.primaryTitleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '2',
                      style: HTText.accentTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Valor Total',
                      style: HTText.primaryTitleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'R\$100,90',
                      style: HTText.accentTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PrimaryButton(
                        text: 'Finalizar Compra',
                        onPressed: () {
                          Modular.to.pushNamed('/payment/payment_success');
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
