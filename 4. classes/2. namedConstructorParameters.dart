class Player {
  late String name;
  late int age;
  late String favoriteLang;

  Player({required this.name, required this.age, this.favoriteLang = "None"});

  void introduceYourSelf() {
    print(
        "Hello, I'm $name, $age years old, my favorite language is $favoriteLang");
  }
}

void main() {
  var player1 = Player(name: "leemyeongjae", age: 16);
  var player2 = Player(name: "crab", age: 11, favoriteLang: "Rust");
  var player3 = Player(name: "camel", age: 35, favoriteLang: "Perl");

  player1.introduceYourSelf();
  player2.introduceYourSelf();
  player3.introduceYourSelf();
}
