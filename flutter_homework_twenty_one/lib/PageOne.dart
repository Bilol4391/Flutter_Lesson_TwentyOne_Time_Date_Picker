import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int _page = 0;
  String startTime = "Start Time";
  String endTime = "End Time";
  String dateEven = "Even Date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Public Event"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Create Public Event",
                    style: GoogleFonts.zenDots(fontSize: 25, color: Colors.red),
                  ))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Event Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: TextFormField(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2022, 12, 30))
                      .then((value) {
                    dateEven =
                        "${value?.year ?? "Even Date"} ${value?.month ?? ''} ${value?.day ?? ''}";
                    setState(() {});
                  });
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: dateEven,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: TextFormField(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    startTime = "${value?.hour ?? ""} ${value?.minute ?? ""}";
                    setState(() {});
                  });
                },
                decoration: InputDecoration(
                  hintText: startTime,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: TextFormField(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    endTime = "${value?.hour ?? "End Time"} ${value?.minute ?? ""}";
                    setState(() {});
                  });
                },
                decoration: InputDecoration(
                  hintText: endTime,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Venue",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),



          Container(
            margin: EdgeInsets.only(left: 130, top: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red
              ),
                onPressed: (){
                  showDialog(context: context, builder: (context){
                    return Dialog(
                      child: Container(
                        height: 300,
                        width: 300,
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset("assets/check 16.33.38 16.33.47.png"),
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(top: 70),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text("Well Done 😎", style: GoogleFonts.dancingScript(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),),
                            )
                          ],
                        )
                      ),
                    );
                  });
            }, child: Padding(padding: EdgeInsets.all(15),child: Text("Submit Event", style: TextStyle(fontSize: 18),))),
          )
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        // key: _bottomNavigationKey,
        items: [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
