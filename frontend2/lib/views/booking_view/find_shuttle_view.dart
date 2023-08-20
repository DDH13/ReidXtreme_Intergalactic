import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils/appbar_styles.dart';
import '../../utils/datepicker_styles.dart';
import '../../utils/dropdown_button_styles.dart';
import '../../utils/textbox_increment_styles.dart';

class FindShuttleView extends StatefulWidget {
  FindShuttleView({Key? key}) : super(key: key);

  @override
  _FindShuttleViewState createState() => _FindShuttleViewState();
}

class _FindShuttleViewState extends State<FindShuttleView>
    with SingleTickerProviderStateMixin {
  bool value = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Find Shuttle'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('From',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    CustomDropdownButtonFormField(dropdownValue: 'Dog'),
                    CustomDropdownButtonFormField(dropdownValue: 'Dog')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text('To',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    CustomDropdownButtonFormField(dropdownValue: 'Dog'),
                    CustomDropdownButtonFormField(dropdownValue: 'Dog')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Return Trip',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Checkbox(
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Departure',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        CustomTextFormField()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Return',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        CustomTextFormField()
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adults',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: TextFieldTapRegionExample(),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Children',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: TextFieldTapRegionExample(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )); // Pass a String here
  }
}


// class Month1 extends StatelessWidget {
//   Month1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Column(
//       children: [Text("hi")],
//     ));
//   }
// }

// class _NewbornState extends State<Newborn> {
//   //FirstPage({Key? key}) : super(key: key);

//   final List<bool> expanded = [false, false, false, false, false, false, false];

//   // final service = ChecklistService('http://localhost:5154/');
//   late Future<List<dynamic>>
//       dataFuture; // Declare dataFuture as Future<List<dynamic>>

//   late Future<List<dynamic>> _newborns;

//   Future<void> initializeData() async {
//     final newbornData = await dataFuture;
//     setState(() {
//       _newborns = Future.value(newbornData);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // checklist1 = ChecklistService.getChecklist('64cbb52cf2083327515c7058');
//     dataFuture = fetchSomeData();
//     initializeData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List>(
//       future: _newborns,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const SizedBox(
//             height: 10.0,
//             width: 10.0,
//             child: Center(
//                 child: CircularProgressIndicator(
//               //   color
//               color: Color.fromARGB(255, 220, 104, 145),
//             )),
//           );
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (snapshot.hasData) {
//           final newborns = snapshot.data!;
//           return Scaffold(
//             body: SingleChildScrollView(
//               child: Column(children: [
//                 ExpansionPanelList(
//                   expansionCallback: (panelIndex, isExpanded) {
//                     setState(() {
//                       expanded[int.parse(newborns[panelIndex].id ?? "0")] =
//                           !isExpanded;
//                     });
//                   },
//                   animationDuration: const Duration(seconds: 2),
//                   //animation duration while expanding/collapsing
//                   children: newborns.map((newborn) {
//                     return ExpansionPanel(
//                         headerBuilder: (context, isOpen) {
//                           return Padding(
//                               padding: const EdgeInsets.all(15),
//                               child: Text(
//                                   newborn.category ?? 'Default Category',
//                                   style: const TextStyle(fontSize: 16)));
//                         },
//                         body: Container(
//                             padding: const EdgeInsets.all(20),
//                             color: const Color.fromARGB(255, 250, 219, 219),
//                             width: double.infinity,
//                             child: Column(
//                               children: newborn.instructions.map((instruction) {
//                                 return Column(
//                                   children: [
//                                     Text(
//                                       instruction.instruction ??
//                                           'Default Instruction',
//                                       style: const TextStyle(fontSize: 14),
//                                     ),
//                                     const Divider(
//                                       color: Colors.black,
//                                     ),
//                                   ],
//                                 );
//                               }).toList(),
//                             )),
//                         isExpanded: expanded[int.parse(newborn.id ?? "0")]);
//                   }).toList(),
//                 )
//               ]),
//             ),
//           );
//         } else {
//           return const Text('No data available.');
//         }
//       },
//     );
//   }
// }
