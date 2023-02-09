void main() {
  var age; // 선언할 때 값이 없어야함
  age = 16;
  age = "sixteen";
  age = true;

  dynamic time = 10;
  time = "ten";
  time = false;

  if (time is int) {
    time.abs();
  }
  if (time is String) {
    time.length;
  }
}
