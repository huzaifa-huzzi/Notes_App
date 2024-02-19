import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  final dataBaseref = FirebaseDatabase.instance.ref('Notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.orange,
         title:const  Text('Your notes'),
         centerTitle: true,
       ),
      body: Column(
        children: [
           Expanded(
             child: FirebaseAnimatedList(query: dataBaseref, itemBuilder: (context,snapshot,animation,index){
             
               return ListTile(
                 title: Text(snapshot.child('title').value.toString()),
                 subtitle: Text(snapshot.child('Details').value.toString()),
                 trailing: PopupMenuButton(itemBuilder: (context) => [

                   PopupMenuItem(child: ListTile(
                     onTap: (){
                       Navigator.pop(context);
                       dataBaseref.child(snapshot.child('id').value.toString()).remove();
                     },
                     leading:const  Text('Delete'),
                     title:const  Icon(Icons.delete),
                   ))

                 ]),
      );
      }
           ),
    ),
  ]
      ),
    );
  }
}
