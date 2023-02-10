void main() {
  var numbers = {1, 2, 3, 4, 5};
  Set<int> evens = {2, 4, 6, 8, 10};

  var odds = {1, 3, 5, 7};
  odds.add(9);
  odds.add(9);
  odds.add(9);
  print(odds); // {1, 3, 5, 7, 9}
}
