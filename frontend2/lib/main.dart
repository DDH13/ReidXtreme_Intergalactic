import 'package:flutter/material.dart';
import 'package:frontend2/views/booking_view/find_shuttle_view.dart';
import '../../utils/appbar_styles.dart';
import '../../utils/card_styles.dart';
import '../../utils/detailed_card_styles.dart';
import '../../utils/elevated_button_styles.dart';
import '../../utils/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intergalactic',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.white,
          secondary: const Color(0xffCBCBCB),
          background: Colors.black,
          surface: Colors.black,
          onSurface: const Color(0xffCBCBCB),
          error: const Color(0xffFF5A5A),
          onError: Colors.white,
          brightness: Brightness.dark,
        ),

        // text theme
        textTheme: const TextTheme(
          headlineLarge: ThemeText.headlineLarge,
          headlineMedium: ThemeText.headlineMedium,
          bodyLarge: ThemeText.bodyLarge,
          bodyMedium: ThemeText.bodyMedium,
          bodySmall: ThemeText.bodySmall,
        ),

        // elevated button theme
        elevatedButtonTheme: CustomElevatedButtonTheme.customButtonTheme,

        // floating action button theme
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),

        // card theme
        cardTheme: CustomCardTheme.customCardTheme,

      ),
      home: const MyHomePage(title: 'Intergalactic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// background image
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgrounds/star.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'Dog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'For You'),
      body: SingleChildScrollView(
        child: Column(children: [
          //   body
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgrounds/star.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'Current Location: EARTH',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  // left aligned heading
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, bottom: 0, right: 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Trending Activities',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  DetailedCardTheme.createTripDetailsCard('12:30', '10/12', '00:30', '12/12', '12:30', '21/12', '00:30', '19/12', 'ISI', 'MD1', 200, 50, 86, 200),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          // width
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/travels/mars-olympus.jpg'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 20, bottom: 0, right: 0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Card Title',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, left: 20, bottom: 0, right: 0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Subtitle',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10, top: 0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FindShuttleView()),
                                        );
                                      },
                                      child: const Text('BOOK >'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          // width
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/travels/mercury-north.jpg'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 20, bottom: 0, right: 0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Card Title',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, left: 20, bottom: 0, right: 0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Subtitle',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10, top: 0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FindShuttleView()),
                                        );
                                      },
                                      child: const Text('BOOK >'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          // width
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/travels/pluto-blue-glacier.jpg'),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16, left: 20, bottom: 0, right: 0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Card Title',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, left: 20, bottom: 0, right: 0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Subtitle',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10, top: 0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FindShuttleView()),
                                        );
                                      },
                                      child: const Text('BOOK >'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // horizontal scroll with cards
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          // width
                          child: SizedBox(
                            width: 200,
                            child: Stack(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/events/eclipse-viewing.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          // width
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/events/party-venus.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
