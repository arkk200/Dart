typedef ListOfInts = List<int>;
ListOfInts getFilteredEvenNumberList(ListOfInts numberList) {
  return numberList.where((number) => number % 2 == 0).toList();
}

void main() {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var evenNumbers = getFilteredEvenNumberList(numbers);
  print(evenNumbers); // [2, 4, 6, 8, 10]
}
