import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/rendering/box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.username});

  final username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.holiday_village))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello !' + '  ' + widget.username,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 350,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none),
                    labelText: 'Enter name of movie',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.white),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 100, right: 110),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    ClipRRect(
                      child: Image.network(
                        "https://fr.web.img3.acsta.net/c_310_420/o_club-allocine-310x420.png_0_se/pictures/15/01/09/16/14/573252.jpg",
                      ),
                    ),
                    //Icon(Icons.favorite),
                    ClipRRect(
                      child: Image.network(
                          "https://fr.web.img2.acsta.net/c_310_420/pictures/21/11/16/10/01/4860598.jpg",
                          height: 150,
                          width: 200,
                          fit: BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
