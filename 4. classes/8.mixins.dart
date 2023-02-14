class Birds {
  int flyingSpeed = 1;
}

class TerrestrialAnimal {
  void run() {
    print("running...");
  }
}

class Dog with TerrestrialAnimal {}

class Tiger with TerrestrialAnimal {}

class Parrot with Birds {}

class Eagle with Birds {}

void main() {
  var dog = Dog()..run();
  var tiger = Tiger()..run();

  var parrot = Parrot();
  print(parrot.flyingSpeed);
  var eagle = Eagle();
  print(eagle.flyingSpeed);
}
