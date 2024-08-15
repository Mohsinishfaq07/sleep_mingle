import 'package:flutter/material.dart';
 // Ensure these imports are correctly set to match your file structure
import '../../common_widgets/star_background.dart';
import '../../utils/colors.dart'; // You need to define the skyColor List<Color> gradient here

class MyData extends StatefulWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: skyColor,
              ),
            ),
          ),
          const StarBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10,
                        bottom: 10,
                        right: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const Text(
                    "My Data",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38),
                    child: ListTile(
                        leading: const Icon(
                          Icons.account_box,
                          color: Colors.white,
                          size: 40,
                        ),
                        title: const Text(
                          "Health Connect",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white60),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 3),
                            child: Text("set",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        )),
                  ),
                  const SizedBox(height: 4),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38),
                    child: ListTile(
                      leading: const Icon(
                        Icons.bed,
                        color: Colors.white,
                        size: 40,
                      ),
                      title: const Text(
                        "Sleep Data",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            // TODO: Implement toggle functionality
                          });
                        },
                        activeTrackColor: Colors.lightBlueAccent,
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Tap the toggle to enable automatic sleep tracking.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),fontSize: 11
                      ),
                    ),
                  ),
                  // Other buttons go here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
