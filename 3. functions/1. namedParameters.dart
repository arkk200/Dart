void printIntroduce({
  String name = "anonymous",
  int age = 18,
  String country = "earth",
}) {
  print("Hello, I'm $name. I'm $age years old. I'm from $country");
}

void printIntroduceWithRequired({
  required String name,
  required int age,
  required String country,
  // required int lev = 10, 에러 발생
}) {
  print("Hello, I'm $name. I'm $age years old. I'm from $country");
}

void main() {
  printIntroduce(name: "leemyeongjae", age: 16, country: "Korea");
  printIntroduceWithRequired(name: "leemyeongjae", age: 16, country: "Korea");
}
