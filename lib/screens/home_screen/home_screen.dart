import 'package:flutter/material.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  // static navigate() {
  //   navigatorKey.currentState.pushReplacement(pageBuilder(HomeScreen()));
  // }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45.0, top: 0.0),
                  child: Row(
                    children: [
                      Text(
                        "PET",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "CARE",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue[200],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    Stack(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.notifications_none),
                            onPressed: () {}),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.white10,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProfileScreen()),
                    //   );
                    // },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/avatar.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color.fromRGBO(121, 181, 206, 1.0))),
                      onPressed: () {},
                      padding: EdgeInsets.all(5.0),
                      color: Colors.white,
                      textColor: Color.fromRGBO(91, 106, 220, 1.0),
                      child: CustomText(
                        text: "Lets share some thing...",
                        size: 18,
                        color: grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
