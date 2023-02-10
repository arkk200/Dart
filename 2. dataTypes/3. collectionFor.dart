void main() {
  var favoriteAnimals = ['cat', 'dog', 'eagle'];
  var animals = [
    'duck',
    'lion',
    for (var animal in favoriteAnimals) "♥︎$animal"
  ];
  print(animals); // [duck, lion, ♥︎cat, ♥︎dog, ♥︎eagle]
}
