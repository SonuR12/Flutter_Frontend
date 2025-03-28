import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> exercises = [
  {
    "title": "Speaking Skills",
    "count": 16,
    "icon": Icons.mic,
    "color": Colors.red,
  },
  {
    "title": "Listening Skills",
    "count": 12,
    "icon": Icons.headset,
    "color": Colors.blue,
  },
  {
    "title": "Reading Comprehension",
    "count": 10,
    "icon": Icons.book,
    "color": Colors.green,
  },
  {
    "title": "Writing Practice",
    "count": 8,
    "icon": Icons.edit,
    "color": Colors.orange,
  },
];

List<Map<String, String>> emotions = [
  {"emoji": "😔", "label": "Badly"},
  {"emoji": "😊", "label": "Fine"},
  {"emoji": "😁", "label": "Well"},
  {"emoji": "😃", "label": "Excellent"},
];


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Change navigation bar color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.deepPurpleAccent.shade200, // Background color
        systemNavigationBarIconBrightness: Brightness.light, // Light icons
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade200,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi, Sonu!", style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Text("28 Mar, 2025", style: TextStyle(
                            fontSize: 12,
                            color: Colors.purple.shade50,
                          ),
                          ),
                        ],
                      ),
                      Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade700,
                        borderRadius: BorderRadius.circular(10)
                      ),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.notifications,
                          color: Colors.white,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                SizedBox(height: 20,),
                // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded( // Allows TextField to take available space
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none, // Removes default underline
                            ),
                            style: TextStyle(color: Colors.white), // Text color
                            cursorColor: Colors.white, // Cursor color
                          ),
                        ),
                      ],
                    ),
                  ),

                //   How do you feel
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("How do you feel?", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Row(
                                children: [
                                  Icon(Icons.circle, size: 6, color: Colors.white,), // Small dot
                                  SizedBox(width: 4), // Space between dots
                                  Icon(Icons.circle, size: 6, color: Colors.white,), // Second dot
                                ],
                              ),
                            ],
                          ),
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: emotions.map((emotion) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple.shade500,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                                      child: Text(
                                        emotion["emoji"]!,
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                    SizedBox(height: 6), // Space between icon and text
                                    Text(
                                      emotion["label"]!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(0, -10),
                        child: Text(
                          "—",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.deepPurpleAccent.shade100,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Exercises",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Row(
                              children: [
                                Icon(Icons.circle, size: 6),
                                SizedBox(width: 4),
                                Icon(Icons.circle, size: 6),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = exercises[index];
                            return Container(
                              margin: EdgeInsets.only(top: 10, bottom: 5),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: exercise["color"],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Icon(
                                            exercise["icon"],
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            exercise["title"],
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${exercise["count"]} Exercises",
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, size: 6),
                                      SizedBox(width: 4),
                                      Icon(Icons.circle, size: 6),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
