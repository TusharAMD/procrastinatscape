import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: GestureDetector(
          onTap: () {},
          child: Image.network("https://i.imgur.com/yczPzHD.png",
          fit: BoxFit.fitHeight,
          height: 100,
          ),
        ),
      ),
    );
  }
}