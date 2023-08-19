import 'package:flutter/material.dart';
import '../../utils/background_image.dart'; // Import the BackgroundImage component
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
    return Scaffold(
      appBar: CustomAppBar(title: 'Confirmed'),
      body: Stack(
        children: [
          BackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/payment/rocket.png'),
                SizedBox(height: 50), // Add spacing here
                Text(
                  'Your Trip is confirmed',
                  style: Theme.of(context).textTheme.bodySmall,
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
                  child: const Text('GO BACK TO EXPLORING  >'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}








