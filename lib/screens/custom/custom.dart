import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static double padding = 16.0;
  static double avatarRadius = 66.0;
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;

  final String path;
  

  CustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.path
  });

  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
  padding: EdgeInsets.only(
    top: Consts.avatarRadius + Consts.padding,
    bottom: MediaQuery.of(context).padding.bottom,
    left: Consts.padding,
    right: Consts.padding,
  ),
  margin: EdgeInsets.only(top: Consts.avatarRadius),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(Consts.padding),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),

    child: 
      Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: Colors.black
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () { 
            Navigator.of(context).pop(); // To close the dialog
          },
          child: Text(buttonText,
          style: TextStyle(color: Colors.black)),
        ),
      ),
      
    ],
  ),
),

Positioned(
  left: Consts.padding,
  right: Consts.padding,
  child: CircleAvatar(
    backgroundColor: Colors.blue,
    radius: Consts.avatarRadius,
    child: Image(image: NetworkImage(path),
      fit: BoxFit.cover,)

  ),
),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class BadgeTap extends StatelessWidget {

  final String title, description, buttonText,path;
  final bool lock;
  BadgeTap({
    required this.lock,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.path
  });
  @override
  Widget build(BuildContext context) {
    if(lock == true){
      return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: title,
            description: description,
            buttonText: buttonText,
            path: path
          ),
        );
      },
      child: Image(image: NetworkImage('$path'),
         width: 110.0, height: 110.0));        
  }
  else{
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: title,
            description: description,
            buttonText: buttonText,
            path: path
          ),
        );
      },
      child: Image(image: NetworkImage('https://i.ibb.co/BtzTdHq/locked.png'),
         width: 110.0, height: 110.0));
 
  }       
  }
}