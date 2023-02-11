class Player {
  late String name;
  late int age;
  late String favoriteLang;

  Player(String name, int age, String favoriteLang) {
    this.name = name;
    this.age = age;
    this.favoriteLang = favoriteLang;
  }
  void introduceYourSelf() {
    print(
        "Hello, I'm $name, $age years old, my favorite language is $favoriteLang");
  }
}

class Monster {
  String name;
  bool canFly;
  int hp;
  Monster(this.name, this.canFly, this.hp);

  void introduceYourSelf() {
    print("Hi, I'm $name, I ${canFly ? 'can' : 'can\'t'} fly, my hp is $hp");
  }
}

void main() {
  var player1 = Player("leemyeongjae", 16, "JavaScript");
  var player2 = Player("crab", 11, "Rust");
  var player3 = Player("camel", 35, "Perl");

  player1.introduceYourSelf();
  player2.introduceYourSelf();
  player3.introduceYourSelf();

  var monster = Monster("dragon", true, 9999);
  monster.introduceYourSelf();
}
