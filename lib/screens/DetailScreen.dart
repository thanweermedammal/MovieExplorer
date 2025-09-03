import 'package:flutter/material.dart';
import 'package:movie_explorer/models/movie_detail_model.dart';
import 'package:movie_explorer/utils/api/DataFEtch.dart';

class MovieDetailsPage extends StatefulWidget {
  final String value;

  const MovieDetailsPage({super.key,required this.value});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Future<MovieDetail?>? fetchDetails;
  int selcted=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetails = DataFetch().movieDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Poster
            Stack(
              children: [
                Image.asset(
                  "assets/41b673d2601efacb3e36355595d399394ac2da6f.png",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Watch Trailer",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),

            // 🔹 Title & Tags
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Avengers: End Game",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: const [
                      Chip(label: Text("Action")),
                      Chip(label: Text("Sci-Fi")),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "UA 16+  |  English  |  2 hr 18 min",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            // 🔹 Description
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "After the devastating events of Avengers: Infinity War (2018), "
                    "the universe is in ruins. With the help of remaining allies, "
                    "the Avengers assemble once more in order to reverse Thanos' "
                    "actions and restore balance.",
                style: TextStyle(color: Colors.white70),
              ),
            ),

            // 🔹 Cast Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  SizedBox(width: 10),
                  Text("Robert Downey Jr.\nIron Man",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(width: 20),
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       "https://upload.wikimedia.org/wikipedia/commons/8/8d/Scarlett_Johansson_in_Kuwait_01b-tweaked.jpg"),
                  // ),
                  // SizedBox(width: 10),
                  Text("Scarlett Johansson\nBlack Widow",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // 🔹 Date Picker (Horizontal Scroll)
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7, // next 7 days
                itemBuilder: (context, index) {
                  final today = DateTime.now();
                  final date = today.add(Duration(days: index)); // add days
                  final dayName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
                  final formatted =
                      "${date.day} ${dayName[date.weekday % 7]}"; // e.g., 3 Tue

                  return InkWell(
                    onTap: (){
                      selcted=index;
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.red : Colors.grey[900], // highlight today
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          formatted,
                          style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


            // 🔹 Time Slots
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(
                  4,
                      (index) => OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: const Text("09:40 AM"),
                  ),
                ),
              ),
            ),

            // 🔹 Book Now Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "BOOK NOW",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
