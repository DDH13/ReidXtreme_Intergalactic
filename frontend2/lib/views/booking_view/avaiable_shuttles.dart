import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/payment_confirmation.dart';
import 'package:frontend2/views/booking_view/payment.dart';
import 'package:frontend2/views/booking_view/billing.dart';
import '../../utils/background_image.dart'; // Import the BackgroundImage component
import '../../utils/appbar_styles.dart';
import '../../utils/text_styles.dart';

class AvailableShuttles extends StatefulWidget {
  AvailableShuttles({Key? key}) : super(key: key);

  @override
  _AvailableShuttlesState createState() => _AvailableShuttlesState();
}

class _AvailableShuttlesState extends State<AvailableShuttles> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Available Shuttles'),
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
                  //content, cards
                ),
                SizedBox(height: 120),

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
                  child: const Text('< EDIT DETAILS'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
