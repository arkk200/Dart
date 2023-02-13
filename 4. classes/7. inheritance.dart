class Human {
  final String name;
  Human(this.name);

  void sayHello() {
    print("Hi, my name is $name");
  }
}

enum Occupation { teacher, student }

class SchoolWorker extends Human {
  final Occupation occupation;
  SchoolWorker({
    required this.occupation,
    required String name,
  }) : super(name);

  @override
  void sayHello() {
    super.sayHello();
    print("and I'm $occupation");
  }
}

void main() {
  var teacher = SchoolWorker(occupation: Occupation.teacher, name: "John")
    ..sayHello();

  var student = SchoolWorker(occupation: Occupation.student, name: "Cena")
    ..sayHello();
}
