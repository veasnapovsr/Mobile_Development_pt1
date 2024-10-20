class MyDuration {
  final int _milliseconds;

  MyDuration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000;
  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60 * 1000;
  MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }

  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration.fromMilliseconds(_milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    if (_milliseconds < other._milliseconds) {
      throw Exception('Cannot subtract greater duration');
    }
    return MyDuration.fromMilliseconds(_milliseconds - other._milliseconds);
  }

  static MyDuration fromMilliseconds(int milliseconds) {
    return MyDuration._(milliseconds);
  }

  MyDuration._(this._milliseconds);
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
