import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addtask.dart';
import 'restapi.dart';

class HomePageH extends StatefulWidget {
  HomePageH({Key? key}) : super(key: key);

  @override
  State<HomePageH> createState() => _HomePageHState();
}

class _HomePageHState extends State<HomePageH> {
  List<Card>? cards;
  var isloaded = false;

  @override
  void initState(){
    super.initState();
    //getData();
  }
  
  getData() async {
    cards = (await RestAPI().getPosts())?.cast<Card>();
    print(cards);
  }

  List<String> data_api = ["Go to Gym", "Complete Assignment", "Solve on Codechef"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50,top:10),
          child: Container(
            alignment: Alignment.topRight,
            child: Text("Balance amount: \$ 20",
            style: GoogleFonts.comfortaa(
              fontSize: 15,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Center(
              child: Container(
              width: width*0.85,  
              height: 200, 
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),  
                ),
                color: const Color.fromARGB(255, 244, 235, 231),
                child: Stack(
                  children: <Widget>[
                    Center(child: Image.network(
                    'https://i.ibb.co/8x5gS80/image.png',
                    fit: BoxFit.fitHeight ,
                  ),),
                  Center(
                    child: Text("So What Are You Doing Today?",
                    style: GoogleFonts.macondo(
                      fontSize: 32,
                      color: Color.fromARGB(255, 160, 255, 137),
                      shadows: [ 
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 2.0,
                            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.8), 
                          ),
                      ]
                    ),
                    textAlign: TextAlign.center,
                    ),
                  )
                  ],
                ),
              ),
            ),
          ),
        ),
      Expanded(
        child: SizedBox(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                margin: EdgeInsets.all(10),
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      side:  BorderSide(color: Colors.green,width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  shadowColor: Colors.green[100],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon (
                            Icons.album,
                            color: Color.fromARGB(255, 255, 147, 58),
                            size: 45
                        ),
                        title: Text(
                          '${data_api[index]}',
                          style: TextStyle(fontSize: 20),
                        ),

                        subtitle: Text('Completed'),
                      ),
                    ],
                  ),

                ),
              );
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right:20),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context){
                  return addtask();
                },)
              );
            },
            child: Icon(Icons.add_card)
            )
          ),
      )
      ],
    );
  }
}