class Player {
  late String name;
  late int age;
  late String favoriteLang;

  void introduceYourSelf() {
    print(
        "Hello, I'm $name, $age years old, my favorite language is $favoriteLang");
  }
}

void main() {
  var player = Player()
    ..name = "leemyeongjae"
    ..age = 16
    ..favoriteLang = "JS"
    ..introduceYourSelf();
}
