
class MyDuration {

  //h = hours
  //ms = milisecond
  //Mn = minute
  //S = seconds

  final int _ms; 


// construction converter: hour, minute, second

  MyDuration.fromH(int H) : _ms = H * 60 * 60 * 1000;
  MyDuration.fromMn(int Mn) : _ms = Mn * 60 * 1000;
  MyDuration.fromS(int S) : _ms = S * 1000;

//OVERIDE CODE provided from Internet
//converts ms ->S.
//extracts H and minute by divisions 
//modulo operator % to get the remaining Mn and S.

  @override
  String toString() {
    int S = (_ms / 1000).round();
    int Mn = (S / 60).floor();
    S = S % 60;
    int H = (Mn / 60).floor();
    Mn = Mn % 60;
    return '$H H, $Mn Mn, $S S';

  }

//comparison operator

  bool operator >(MyDuration other) {

    return _ms > other._ms;

  }

//operation code is Help provided

  MyDuration operator +(MyDuration other) {

    return MyDuration.fromms(_ms + other._ms);

  }

  MyDuration operator -(MyDuration other) {

    if (_ms < other._ms) {

      throw Exception('Cant subtract greater duration');
    }
    return MyDuration.fromms(_ms - other._ms);

  }

  static MyDuration fromms(int ms) {

    return MyDuration._(ms);

  }

  MyDuration._(this._ms);


}

//main function
void main() {

  MyDuration duration1 = MyDuration.fromH(3); // 3 H
  MyDuration duration2 = MyDuration.fromMn(45); // 45 Mn
  print(duration1 + duration2); // 3 H, 45 Mn, 0 S
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // an exception

  } catch (e) {

    print(e); 

  }

}
