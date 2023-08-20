import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/find_shuttle_view.dart';
import 'package:frontend2/views/booking_view/payment.dart';
import '../../utils/background_image.dart'; // Import the BackgroundImage component
import '../../utils/appbar_styles.dart';
import '../../utils/text_styles.dart';
import '../../utils/detailed_card_styles.dart';

class Billing extends StatefulWidget {
  final String destination;
  final String destDock;
  final String source;
  final String sourceDock;
  final DateTime departureDate;
  final DateTime arrivalDate;
  final String user = "64df64566e6cbb5db24c7842";
  final String shuttle;
  final int adults;
  final int children;
  final double total;

  Billing(
      {Key? key,
      required this.destination,
      required this.destDock,
      required this.source,
      required this.sourceDock,
      required this.departureDate,
      required this.arrivalDate,
      required this.shuttle,
      required this.adults,
      required this.children,
      required this.total})
      : super(key: key);

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
      appBar: const CustomAppBar(title: 'Billing Details'),
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0),
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
              const SizedBox(height: 20),
              // add trip details here
              DetailedCardTheme.createTripDetailsCard(
                  '12:30',
                  '10/12',
                  '00:30',
                  '12/12',
                  '12:30',
                  '21/12',
                  '00:30',
                  '19/12',
                  'ISI',
                  'MD1',
                  200,
                  50,
                  86,
                  100),
              DetailedCardTheme.createBillingDetailsCard(
                  'IS1', 'MD1', '25,000', '3', '8,500', '-500', '50,000')
            ],
          ),

          // proceed to payment button
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Payment(
                            destination: widget.destination,
                            destDock: widget.destDock,
                            source: widget.source,
                            sourceDock: widget.sourceDock,
                            departureDate: widget.departureDate,
                            shuttle: widget.shuttle,
                            adults: widget.adults,
                            children: widget.children,
                            total: widget.total, arrivalDate: widget.departureDate.add(const Duration(days: 1)),
                          ),
                        ),
                      );
                    },
                    child: const Text('PROCEED TO PAYMENT >'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FindShuttleView(),
                        ),
                      );
                    },
                    child: const Text('< CHANGE SHUTTLE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
