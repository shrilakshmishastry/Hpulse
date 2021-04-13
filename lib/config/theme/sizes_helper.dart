import 'package:flutter/material.dart';

Size getSize(BuildContext context){
  return MediaQuery.of(context).size;
}

double getHeight(BuildContext context){
  return getSize(context).height;
}

double getWidth(BuildContext context){
  return getSize(context).width;
}
