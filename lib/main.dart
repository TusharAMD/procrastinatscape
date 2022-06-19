import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile.dart';
void main() {
  runApp(const Procrastinate());
}

class Procrastinate extends StatelessWidget {
  const Procrastinate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    HomePageH(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 60, 134, 135),
      body: pages[currentPage],
      appBar: AppBar(
        title: Text("Procrastinatscape",
        style: GoogleFonts.pacifico(
                fontSize: 32,
                color: Color.fromARGB(255, 12, 72, 108),
                shadows: [ 
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), 
                    ),
                ]
              ),),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentPage = index;
          });
          
        },
        selectedIndex: currentPage,
      ),
      
    );
  }
}