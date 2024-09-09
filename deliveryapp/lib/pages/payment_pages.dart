import 'package:deliveryapp/components/my_button.dart';
import 'package:deliveryapp/pages/delivery_progess_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //nguoi dung muon thanh toan
  void userTappedPay(){
    if (formKey.currentState!.validate()){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Xác nhận thanh toán"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Số thẻ : $cardNumber"),
                Text("Ngày hết hạn : $expiryDate"),
                Text("Tên chủ thẻ : $cardHolderName"),
                Text("CVV : $cvvCode"),

              ],
            ),
            ),
            actions: [
              // nut tu choi
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text("Từ chối"),
                ),

              // nut dong y
              TextButton(
                onPressed: () {
                 Navigator.pop(context);
                  
                 Navigator.push(
                   context,
                    MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                  );
                },
                child: const Text("Đồng ý"),
                ),

            ],
        ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Thanh Toán"),
      ),
      body: Column(
        children: [
          // the credit
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: ((p0) {}),
          ),
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),

          const Spacer(),

          MyButton(
            text: "Thanh toán ngay", 
            onTap: userTappedPay,
            ),
            const SizedBox(height: 25),
        ],
      ),
    );
  }
}
