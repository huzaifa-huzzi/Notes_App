import 'package:flutter/material.dart';


class VoiceButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback ontap;
  const VoiceButton({super.key,required this.title,required this.ontap,this.loading = false,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:ontap ,
      child: Container(
        height: 50,
        width: 300,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Colors.black),
        ),
        child: Padding(
          padding:const  EdgeInsets.only(left: 100),
          child: Row(
            children: [
              Center(child: Text(title),),
             const SizedBox(
               width: 10,
             ),
             const  Icon(Icons.keyboard_voice)
            ],
          ),
        )
      ),
    );
  }
}



