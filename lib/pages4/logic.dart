import "package:flutter/material.dart";
import 'design.dart';
enum Gender { male1, female2 }
Color male = inactive_color;
  Color female = inactive_color;
  void change(Gender num) {
    if (num == Gender.male1) {
      if (male == inactive_color) {
        male = active_color;
        female = inactive_color;
      } else {
        male = inactive_color;
      }
    } else if (num == Gender.female2) {
      if (female == inactive_color) {
        female = active_color;
        male = inactive_color;
      } else {
        female = inactive_color;
      }
    }
  }
  int kheight = 180;
  int weight = 70;
  int age = 18;