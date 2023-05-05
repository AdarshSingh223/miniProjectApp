import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sexylogin/constraints.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  
  final _database = FirebaseDatabase.instance.ref();

  bool isExpanded1 = false;
  bool isExpandedIndicator1 = false;
  String carCount1 = '';
  int count1 = 0;
  double percentage1 = 0.0;
  int maxCarCount1 = 10;    //can be updated
  Color color1 = Colors.green;
  String trafficText1 = 'Road is good to go!';

  bool isExpanded2 = false;
  String carCount2 = '';
  int count2 = 0;
  double percentage2 = 0.0;
  int maxCarCount2 = 10;    //can be updated
  Color color2 = Colors.green;
  String trafficText2 = 'Road is good to go!';

  @override
  void initState() {
    super.initState();
    _activateListners();
  }

  void _activateListners() {
    _database.child('Car_Count_Simulation/').onValue.listen((event) {
      final String description = event.snapshot.value.toString();
      count1 = int.parse(description);
      percentage1 = (count1/maxCarCount1) * 100;

      if(percentage1 <= 30.0) {
        color1 = Colors.green;
        trafficText1 = 'Road is good to go!';
      } else if(percentage1 > 30.0 && percentage1 <= 70.0) {
        color1 = Colors.yellow.shade800;
        trafficText1 = 'Road is a little busy...';
      } else if(percentage1 > 70.0 && percentage1 <= 100.0){
        color1 = Colors.red;
        trafficText1 = 'Heavy traffic area';
      } else {
        color1= const Color(0xFF800000);
        trafficText1 = 'Road is inordinately full!!';
      }

      setState(() {
        carCount1 = description;
        if (kDebugMode) {
          print(description);
        }
      });
    });

     _database.child('Car_Count_Hardware/').onValue.listen((event) {
      final String description = event.snapshot.value.toString();
      count2 = int.parse(description);
      percentage2 = (count2/maxCarCount2) * 100;

      if(percentage2 <= 30.0) {
        color2 = Colors.green;
        trafficText2 = 'Road is good to go!';
      } else if(percentage2 > 30.0 && percentage2 <= 70.0) {
        color2 = Colors.yellow.shade800;
        trafficText2 = 'Road is a little busy...';
      } else if(percentage2 > 70.0 && percentage2 <= 100.0){
        color2 = Colors.red;
        trafficText2 = 'Heavy traffic area';
      } else {
        color2 = const Color(0xFF800000);
        trafficText2 = 'Road is inordinately full!!';
      }

      setState(() {
        carCount2 = description;
        if (kDebugMode) {
          print(description);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryLightColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: size.width * 0.95,
                height: isExpanded1 ? size.height * 0.4 : size.height * 0.15,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 20.0,
                  margin: EdgeInsets.only(left: size.width * 0.05, top: size.height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8, left: 15),
                            alignment: Alignment.topLeft,
                            child: const Text('Street 1:', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),)
                          ),
                          SizedBox(
                            width: size.width * 0.51,
                          ),
                          Container(
                            margin : const EdgeInsets.only(top: 5),
                            alignment: Alignment.topRight,
                            child: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpanded1 = !isExpanded1;
                              });
                            }, 
                            icon: isExpanded1 ? 
                                  const Icon(Icons.remove, size: 27) 
                                  : const Icon(Icons.add, size: 27,),              
                            ) 
                          )
                        ],
                      ),
                      Container(
                        height: 5,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: isExpanded1 ? 
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '   Vehicles on road : ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 21
                                      )
                                    ),
                                    Text(
                                      carCount1,
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 21
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "\nCurrently, this road is running at ", 
                                      style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19
                                      )
                                    ),
                                    Text(
                                      '\n${count1 * 10}%',
                                      style: TextStyle(
                                        color: color1,
                                        fontSize: 21,
                                      )
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '  of it\'s capacity',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 19,
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\n\n'+trafficText1,
                                      style: TextStyle(
                                        color: color1,
                                        fontSize: 24,
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ) 
                          : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                    Text(
                                      "   Tap  '+'  to see more", 
                                      style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19,
                                      )
                                    )
                                ],
                              ),
                            ]
                          ),
                      )
                    ]
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: size.width * 0.95,
                height: isExpanded2 ? size.height * 0.4 : size.height * 0.15,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 20.0,
                  margin: EdgeInsets.only(left: size.width * 0.05, top: size.height * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8, left: 15),
                            alignment: Alignment.topLeft,
                            child: const Text('Street 2:', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),)
                          ),
                          SizedBox(
                            width: size.width * 0.51,
                          ),
                          Container(
                            margin : const EdgeInsets.only(top: 5),
                            alignment: Alignment.topRight,
                            child: IconButton(
                            onPressed: () {
                              setState(() {
                                isExpanded2 = !isExpanded2;
                              });
                            }, 
                            icon: isExpanded2 ? 
                                  const Icon(Icons.remove, size: 27) 
                                  : const Icon(Icons.add, size: 27,),              
                            ) 
                          )
                        ],
                      ),
                      Container(
                        height: 5,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: isExpanded2 ? 
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '   Vehicles on road : ',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 21
                                      )
                                    ),
                                    Text(
                                      carCount2,
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize: 21
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "\nCurrently, this road is running at ", 
                                      style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19
                                      )
                                    ),
                                    Text(
                                      '\n${count2 * 10}%',
                                      style: TextStyle(
                                        color: color2,
                                        fontSize: 21,
                                      )
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '  of it\'s capacity',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 19,
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\n\n'+trafficText2,
                                      style: TextStyle(
                                        color: color2,
                                        fontSize: 24,
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ) 
                          : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                    Text(
                                      "   Tap  '+'  to see more", 
                                      style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 19,
                                      )
                                    )
                                ],
                              ),
                            ]
                          ),
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}