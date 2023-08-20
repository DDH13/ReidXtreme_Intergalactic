import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/payment_confirmation.dart';
import 'package:frontend2/views/booking_view/payment.dart';
import '../../utils/background_image.dart'; // Import the BackgroundImage component
import '../../utils/appbar_styles.dart';
import '../../utils/text_styles.dart';

class Billing extends StatefulWidget {
  Billing({Key? key}) : super(key: key);

  @override
  _BillingState createState() => _BillingState();
}

class _BillingState extends State<Billing> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Billing Details'),
      body: Stack(
        children: [
          BackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, left:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SpaceX MK1',
                          style: ThemeText.bodyLarge,
                        ),
                        Text(
                          '23R12',
                          style: ThemeText.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 120),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentConfirmation(),
                      ),
                    );
                  },
                  child: const Text('< CHANGE SHUTTLE'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Payment(),
                      ),
                    );
                  },
                  child: const Text('PROCEED TO PAYMENT >'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
