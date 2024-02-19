import 'package:dart_notes_app/Routing/routes_name.dart';
import 'package:dart_notes_app/utills/General_utills.dart';
import 'package:dart_notes_app/utills/Round_Button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    bool loading = false;
  final storeDataContoller = TextEditingController();
  final titleDataController  = TextEditingController();
  final databaseref = FirebaseDatabase.instance.ref('Notes');
  final recorder = FlutterSoundRecorder();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(' Add Notes'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const  Padding(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Text('Title',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            Padding(
              padding:const  EdgeInsets.only(),
              child: Padding(
                padding:const  EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: titleDataController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const  Padding(
               padding: EdgeInsets.only(left: 12),
               child: Row(
                children: [
                  Text('Details',style: TextStyle(fontSize: 20),),
                ],
                           ),
             ),
            Padding(
              padding:const  EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: storeDataContoller,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Write your thought',
                  hintStyle:const  TextStyle(fontSize: 15,color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundButton(title: 'Add Note', loading:loading,ontap: (){
                   setState(() {
                     loading = true;
                   });
               String id = DateTime.now().millisecondsSinceEpoch.toString();
              databaseref.child(id).set({
                'title' : titleDataController.text.toString(),
                'Details' : storeDataContoller.text.toString(),
                'id':id,
              }).then((value){
                GeneralUtils.toastMessage('Note Added Successfully');
                setState(() {
                  loading = false;
                });
              }).onError((error, stackTrace){
                  GeneralUtils.toastMessage(error.toString());
                  setState(() {
                    loading = false;
                  });

              });

            }),
            const SizedBox(
              height: 10,
            ),
           RoundButton(title: 'See Notes', ontap: (){
              Navigator.pushNamed(context, RoutesName.Notes);
           }),
            const SizedBox(
              height: 10,
            ),







          ],
    ),
    );
  }

}
