abstract class Human {
  void introduce();
}

class Student extends Human {
  late String name;
  late int age;

  void introduce() {
    print("Hello, I'm student, $name");
  }
}

class Developer extends Human {
  late String favoriteLanguage;

  void introduce() {
    print("Hello, I'm developer. my favorite language is $favoriteLanguage");
  }
}

void main() {
  var student = Student()
    ..name = "leemyeongjae"
    ..introduce();

  var developer = Developer()
    ..favoriteLanguage = "Dart"
    ..introduce();
}
