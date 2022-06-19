import 'package:flutter/material.dart';

class addtask extends StatefulWidget {
  addtask({Key? key}) : super(key: key);

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {
  
  String taskname="";
  String emailid="";
  String ngoname="";
  DateTime startDate = DateTime(2000);
  DateTime endDate = DateTime(2000);  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTaskNameField(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Name of Task'),
        onChanged: (value){
          setState(() {
            taskname = value.toString();
          });
        },
      ),
    );
  }

  Widget _buildEmailField(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Email Id'),
        onChanged: (value){
          setState(() {
            emailid = value.toString();
          });
        },
      ),
    );
  }

  Widget _buildngoField(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Enter NGO Name'),
        onChanged: (value){
          setState(() {
            ngoname = value.toString();
          });
        },
      ),
    );
  }


  Widget _buildDateField(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(157, 81, 156, 255)

              ),
        onPressed: () async{
        DateTime? newDatetime= await showDatePicker(
          context: context, 
          initialDate: DateTime(2022,6,19), 
          firstDate: DateTime(2022), 
          lastDate: DateTime(2030));

          if (newDatetime==null){
            return;
          }
          setState(() => startDate=newDatetime,);

      }, child: Text("Start Date")),
    );
  }

  Widget _buildEndDateField(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(157, 81, 156, 255)

              ),
        onPressed: () async{
        DateTime? newDatetime= await showDatePicker(
          context: context, 
          initialDate: DateTime(2022,6,19), 
          firstDate: DateTime(2022), 
          lastDate: DateTime(2030));

          if (newDatetime==null){
            return;
          }
          setState(() => endDate=newDatetime,);

      }, child: Text("End Date")),
    );
  }

  Future submitmessage()=>showDialog(
    context: context, 
    builder: (context)=>AlertDialog(
      title: Column(
        children: [
          Text("Submitted"),
          Icon(Icons.check)
        ],
      ),
    ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child:Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
              _buildTaskNameField(),
              _buildEmailField(),
              _buildngoField(),
              _buildDateField(),
              _buildEndDateField(),
              
              SizedBox(height: 100,),
              ElevatedButton(
                onPressed: (){
                  //print(taskname);
                  //print(emailid);
                  //print(endDate);
                  //print(startDate);
                  submitmessage();

                  
                }, 
                child: Text("Submit"))
            ],),
          )
        ),
      ),
      appBar: AppBar(
        title: Text("Add Task")
      ),
    );
  }
}