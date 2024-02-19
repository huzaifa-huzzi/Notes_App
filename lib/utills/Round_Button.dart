import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
 final  String title;
 final  bool loading ;
  final VoidCallback ontap;
  const RoundButton({super.key,required this.title,required this.ontap,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap ,
      child: Container(
        height: 50,
        width: 300,
        decoration:  BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child:Center(child: Text(title),),
      ),
    );
  }
}

