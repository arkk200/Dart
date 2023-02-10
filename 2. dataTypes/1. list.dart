void main() {
  var numbers = [1, 2, 3, 4, 5];
  List<double> rates = [1.2, 4.8, 3.3, 2.7, 3.8];
  numbers.add(1); // [1, 2, 3, 4, 5, 6]
  numbers.remove(3); // [1, 2, 4, 5, 6]

  var addFive = true;
  var numList = [
    1,
    2,
    3,
    4,
    if (addFive) 5, // addFive가 true라면 5가 들어감
  ];
  print(numList);
}
