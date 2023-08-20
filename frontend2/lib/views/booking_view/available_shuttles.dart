import 'package:flutter/material.dart';
import 'package:frontend2/utils/detailed_card_styles.dart';
import 'package:frontend2/views/booking_view/find_shuttle_view.dart';
import 'package:frontend2/views/booking_view/billing.dart';
import '../../utils/background_image.dart';
import '../../utils/appbar_styles.dart';
import '../../utils/elevated_button_styles.dart';

class AvailableShuttles extends StatefulWidget {
  const AvailableShuttles({Key? key}) : super(key: key);

  @override
  _AvailableShuttlesState createState() => _AvailableShuttlesState();
}

class _AvailableShuttlesState extends State<AvailableShuttles>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Available Shuttles'),
      body: Stack(
          children: [
          const BackgroundImage(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerRight,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Billing(),
                      ),
                    );
                  },
                  child: DetailedCardTheme.createAvailableShuttleCard(
                      'SPACEX MK1',
                      'FIRST CLASS',
                      '12:30',
                      '10/12',
                      '00:30',
                      '12/12',
                      '12:30',
                      '00:30',
                      '12/12',
                      '12:30',
                      '2 DAYS 12 HOURS',
                      'IS1',
                      'MD1',
                      '1',
                      '2',
                      '50,000'
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Billing(),
                      ),
                    );
                  },
                  child: DetailedCardTheme.createAvailableShuttleCard(
                      'SPACEX MK1',
                      'FIRST CLASS',
                      '12:30',
                      '10/12',
                      '00:30',
                      '12/12',
                      '12:30',
                      '00:30',
                      '12/12',
                      '12:30',
                      '2 DAYS 12 HOURS',
                      'IS1',
                      'MD1',
                      '1',
                      '2',
                      '50,000'
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Billing(),
                      ),
                    );
                  },
                  child: DetailedCardTheme.createAvailableShuttleCard(
                      'SPACEX MK1',
                      'FIRST CLASS',
                      '12:30',
                      '10/12',
                      '00:30',
                      '12/12',
                      '12:30',
                      '00:30',
                      '12/12',
                      '12:30',
                      '2 DAYS 12 HOURS',
                      'IS1',
                      'MD1',
                      '1',
                      '2',
                      '50,000'
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Billing(),
                      ),
                    );
                  },
                  child: DetailedCardTheme.createAvailableShuttleCard(
                      'SPACEX MK1',
                      'FIRST CLASS',
                      '12:30',
                      '10/12',
                      '00:30',
                      '12/12',
                      '12:30',
                      '00:30',
                      '12/12',
                      '12:30',
                      '2 DAYS 12 HOURS',
                      'IS1',
                      'MD1',
                      '1',
                      '2',
                      '50,000'
                  ),
                ),
              ],
            ),
          ),

        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: CustomElevatedButtonTheme.customButtonTheme.style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FindShuttleView(),
                  ),
                );
              },
              child: const Text('< EDIT DETAILS'),
            ),
        ),
        ],
        ),
        );
  }
}
