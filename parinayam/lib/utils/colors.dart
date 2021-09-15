import 'package:flutter/material.dart';


const primaryColor = Color.fromRGBO(255, 90, 96, 100);


// myThemeColor(myColor)
// {
//   var primaryColor = myColor;
//   return primaryColor;
// }

// Creating Class named Gfg
class MyColorClass {

  late String geekName;


  String get geek_name {
    return geekName;
  }

  set geek_name (String name) {
    this.geekName = name;
  }
}

void main()
{
  MyColorClass geek = new MyColorClass();

  geek.geek_name = "GeeksForGeeks";


  print("Welcome to ${geek.geek_name}");
}
