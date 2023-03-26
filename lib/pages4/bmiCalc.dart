import "dart:math" ;
class BMI{
  BMI({required this.height,required this.weight});
   final int height;
   final int weight;
   late double _bmi;
  String calc_bmi(){
     _bmi = weight/pow(height/100, 2);
     return _bmi.toStringAsFixed(1);

  }
  String get_result(){
    if(_bmi >= 25){
      return "Overweight";
    }
    else if(_bmi > 17.5){
      return "normal";
    }
    else{
      return "Underweight";
    }
  }
  String get_feedback(){
    if(_bmi >= 25){
      return "Balance your diet as soon as possible ";
    }
    else if(_bmi > 17.5){
      return "Your diet is normal dont worry";
    }
    else{
      return "Increase your diet for more bmi";
    }
  }
}