import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/billing.dart';
import 'package:frontend2/views/booking_view/payment_confirmation.dart';
import '../../utils/background_image.dart'; // Import the BackgroundImage component
import '../../utils/appbar_styles.dart';



class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Payment Methods',
      ),
      body: Stack(
        children: [
          BackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/payment/card.png'),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0), // Adjust this value
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('+ ADD METHOD'),
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
                        builder: (context) => Billing(),
                      ),
                    );
                  },
                  child: const Text('< BACK TO BILLING'),
                ),
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
                  child: const Text('CONFIRM MY TRIP >'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




}


