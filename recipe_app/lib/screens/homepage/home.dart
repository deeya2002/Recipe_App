import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  Widget _searchBar() {
    return Container(
      height: 50,
      width: 350,
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search Something",
            prefixIcon: Icon(
              Icons.search,
              size: 26,
            ),
            fillColor: Color(0xffe4e4e4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _hotel({
    required String image,
    required String tittle,
    // required String subtittle,
    required String time,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 310,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
          ),
          Container(
            height: 80,
            width: 310,
            decoration: BoxDecoration(
                color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Color(0xffdf842b),
                        size: 20,
                      ),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' $time',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _category({
    required String image,
    required String catename,
  }){
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          Text(
            catename,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 47,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffdf842b),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Icon(
                    Icons.set_meal_sharp,
                    color: Colors.white,
                  ),
                ),
                _searchBar(),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Today's best recepies",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _hotel(
                    image: "assets/home1.png",
                    time: "20 ~ 40 min",
                    tittle: "Buff Momo",
                  ),
                  _hotel(
                    image: "assets/home2.png",
                    time: "20 ~ 40 min",
                    tittle: "Chicken Momo",
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Choose by Category",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                     _category(
                    image: "assets/home3.png",
                    catename: "breakfast",
                  ),
                  _category(
                    image: "assets/home4.png",
                    catename: "lunch",
                  ),
                  _category(
                    image: "assets/home3.png",
                    catename: "dinner",
                  ),
                  _category(
                    image: "assets/home4.png",
                    catename: "snacks",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  _category(
                    image: "assets/home3.png",
                    catename: "pizza",
                  ),
                  _category(
                    image: "assets/home4.png",
                    catename: "burger",
                  ),
                  _category(
                    image: "assets/home3.png",
                    catename: "sandwich",
                  ),
                  _category(
                    image: "assets/home4.png",
                    catename: "snacks",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}