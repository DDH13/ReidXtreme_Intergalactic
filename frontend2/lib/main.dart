import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

        // app bar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontFamily: 'Space Grotesk',
              fontSize: 24,
              fontWeight: FontWeight.bold),
          toolbarHeight: 100,
        ),

        // typography
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Space Grotesk',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Space Grotesk',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Saira',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(fontFamily: 'Saira', fontSize: 16),
          bodySmall: TextStyle(
              fontFamily: 'Saira', fontSize: 14, color: Color(0xffCBCBCB)),
        ),

        // elevated button styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            // transparent background color
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.primary.withOpacity(0),
            ),
            // border colour white, stroke width 0.5
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(
                color: Colors.white,
                width: 0.7,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.onPrimary,
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        floatingActionButtonTheme: (FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: Colors.white,
              width: 0.7,
            ),
          ),
        )),

        // cards
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          margin: const EdgeInsets.all(10),
          color: const Color(0xff1F2933).withOpacity(0.6),
        ),

        //   bottom app bar
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const MyHomePage(title: 'Available Shuttles'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text(widget.title),
        //   add notification icon

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
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
                  Text(
                    'You have pushed the button this many times:',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Hi',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  //   button
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('MORE >'),
                  ),

                  //   card
                  const Card(
                    child: Column(
                      children: [
                        Text('Card Title'),
                        Text('Card Subtitle'),
                        //   card inside card
                        Card(
                          child: Column(
                            children: [
                              Text('Card Title'),
                              Text('Card Subtitle'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // horizontal scroll with cards
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
                            width: 250,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/travels/mars-olympus.jpg'),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top:16, left:20, bottom:0, right:0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                          'Card Title',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top:0, left:20, bottom:0, right:0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Subtitle',
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 10, bottom: 10, top:0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {},
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
                            width: 250,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/travels/mercury-north.jpg'),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top:16, left:20, bottom:0, right:0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Card Title',
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top:0, left:20, bottom:0, right:0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Subtitle',
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10, bottom: 10, top:0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {},
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
                            width: 250,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/travels/pluto-blue-glacier.jpg'),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top:16, left:20, bottom:0, right:0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Card Title',
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top:0, left:20, bottom:0, right:0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'Subtitle',
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10, bottom: 10, top:0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('BOOK >'),
                                    ),
                                  ),
                                )

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
                            width: 250,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/travels/mars-olympus.jpg'),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text('Card Title'))
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
                            width: 250,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/travels/mercury-north.jpg'),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text('Card Title'))
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
                            width: 250,
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/travels/pluto-blue-glacier.jpg'),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text('Card Title'))
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
      //   bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
