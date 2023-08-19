import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils/appbar_styles.dart';

class PaymentConfirmation extends StatefulWidget {
  PaymentConfirmation({Key? key}) : super(key: key);

  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'Payment Confirmation')); // Pass a String here
  }
}