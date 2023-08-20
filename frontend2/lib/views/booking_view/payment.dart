import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/billing.dart';
import 'package:frontend2/views/booking_view/payment_confirmation.dart';
import '../../utils/background_image.dart'; // Import the BackgroundImage component
import '../../utils/appbar_styles.dart';

class Payment extends StatefulWidget {
  final String sourceDock;
  final String destination;
  final String destDock;
  final String source;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final int adults;
  final int children;
  final String shuttle;
  final double total;

  Payment(
      {Key? key,
      required this.destination,
      required this.destDock,
      required this.source,
      required this.sourceDock,
      required this.departureDate,
      required this.arrivalDate,
      required this.adults,
      required this.children,
      required this.shuttle,
      required this.total})
      : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with SingleTickerProviderStateMixin {
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
                    padding: const EdgeInsets.only(right: 40.0),
                    // Adjust this value
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
                        builder: (context) => Billing(
                          destination: widget.destination,
                          destDock: widget.destDock,
                          source: widget.source,
                          sourceDock: widget.sourceDock,
                          departureDate: widget.departureDate,
                          arrivalDate: widget.arrivalDate,
                          adults: widget.adults,
                          children: widget.children,
                          shuttle: widget.shuttle,
                          total: widget.total,
                        ),
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
