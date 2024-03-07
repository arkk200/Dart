### **[이 사이트](https://nomadcoders.co/) 학습하고 있습니다.**

# **0. 왜 다트인가**

### **다트는 2개의 컴파일러를 가지고 있다.**
다트 코드를 자바스크립트로 변환해주는 Dart Web이라는 컴파일러가 있고, <br>
다트 코드를 여러 CPU 아케텍쳐에 맞게 변환해주는 Dart Native라는 컴파일러가 있다.<br>
여러 CPU 아키텍쳐에 맞게 변환할 수 있기에 IOS, Android, Windows, Linux, Mac, 사물인터넷, 자동차 같은데서도 쓸 수 있다.

### **dart native에는 just-in-time(JIT)과 ahead-of-time(AOT)라는 컴파일러가 있다.**
- JIT 컴파일러는 dart VM에 있는 컴파일 방식으로 VM이 이해할 수 있는 중간언어로 컴파일해서 코드의 결과를 바로 보여준다.<br>
가상 머신에서 동작하기에 조금 느리다.
- AOT는 바이너리를 생성할 때 쓰는 컴파일러다. Android, iOS 각각의 네이티브 언어로 변환하기 때문에 개발 과정에서 AOT 방식의 컴파일은 효율적이지 못하다.

쉽게 생각해서 JIT로 코드를 컴파일하며 개발하고, 개발이 끝난 뒤 AOT로 컴파일 해 배포하는 방식이다.

### **또한 dart는 null safety로 모든 변수에 null이 들어오지 못하게 한다.**

다트와 플러터의 또다른 강점은 둘 다 구글에서 나왔기에 플러터 프레임워크가 원하는데로 다트를 수정할 수 있다는 점이다.<br>
즉, 하나의 프레임워크가 자기가 쓰는 언어를 원하는데로 수정하게 만들 수 있다는 것이다.<br>
(AOT 툴체인도 플러터를 위해 다트가 만들어준 것이다.)

### **다트는 아래 룰을 따랴야 한다.**
1. 다트는 main 함수가 꼭 있어야한다. 또한 모든 코드는 main 함수 내에 들어가있어야 한다.
2. 코드 끝에는 세미콜론을 필수로 붙여야한다.

# **1. 변수**
## **1-1. The Var Keyword**
다트는 타입추론을 한다.
```dart
void main() {
    var name = 'leemyeongjae';
    // name = 1; 에러 발생
}
```
위처럼 변수를 초기화했을 때 name은 자동으로 String타입이 된다.<br>
타입이 다른 값을 대입하려고 하면 에러가 발생한다.

아니면 아래처럼 명시해줄 수도 있다.
```dart
void main() {
    String name = 'leemyeongjae';
}
```

다트는 스타일가디의 권장방식은 함수나 메소드 내에 지역변수는 var 키워드로 선언하고,<br>
클래스에 변수, 프로퍼티는 타입을 명시하고 선언하는 것이다.

## **1-2. Dynamic Type**
dynamic 타입은 타입이 자유로운 변수를 선언할 때 사용하는 타입이다.<br>
var로 변수를 선언하고 값을 주지 않았을 때 dynamic 타입이 된다.

그러면 아래처럼 여러 타입의 값을 할당해줄 수 있다.
```dart
void main() {
    var age;
    age = 16;
    age = "sixteen";
    age = true;
}
```

아래처럼 명시해 줄 수도 있다.
```dart
void main() {
    dynamic age;
    age = 16;
    age = "sixteen";
    age = true;
}
```

아래처럼 타입 체크도 할 수 있다.
```dart
void main() {
    dynamic age;
    if(age is String) {
    }
}
```

외부에서 데이터를 받았는데 그 데이터의 타입을 모를 때 dynamic을 쓸 수 있다.

## **1-3. Nullable Variables**
dart는 null safety 언어로 null을 쓰려면 타입과 함께 ?를 써야한다.
```dart
void main() {
    String? phone = 'samsung';
    phone = null;
}
```
당연히 nullable은 변수에 해당 타입의 메소드나 속성에 접근 하려고 할 때 null일 경우를 막아줘야한다.

if 문으로 막아줄 수도 있지만<br>
?.로 메소드나 속성에 접근하면 변수가 null일 경우 접근을 막아준다.
```dart
void main() {
    String? phone = 'Galaxy Quantum 3';
    print(phone?.startsWith('Galaxy')); // true
    phone = null;
    print(phone?.startsWith('iPhone')); // null
}
```

## **1-4. Final Variables**
final은 상수 타입으로 한번 값이 할당된 변수를 다른 값으로 할당되는 것을 막아준다.
```dart
void main() {
    final PI = 3.14159;
    // PI = 2.71828; 에러 발생
}
```
한번 값이 할당된 후부터 다른 값으로 할당되는 것을 막기 때문에,<br>
선언만 하고 밑에서 값을 할당해줘도 된다.
```dart
void main() {
    final PI;
    PI = 3.14159;
    // PI = 2.71828; 에러 발생
}
```
타입을 지정해 줄 수도 있다.
```dart
void main() {
    final double PI = 3.14159;
}
```

## **1-5. Late Variables**
late는 클래스에서 쓸모있는 키워드이다.

dart에 클래스를 잠깐 살펴보면
```dart
class 클래스명 {
    멤버 변수
}
```

처럼 쓰는데 dynamic 타입이 아닌 멤버 변수를 선언하면 무조건 초기화해줘야한다.
```dart
class GoodClass {
    final PI; // 에러 발생
    String name; // 에러 발생
}
```

근데 late를 쓰면 인스턴스를 만들고 나중에 초기화 해줄 수 있다.
```dart
class GoodClass {
    late final PI; // 나중에 인스턴스를 만든 후 값을 할당할 수 있음
    late String name;
}
```

## **1-6. Constant Variables**
const는 final과 비슷한데 변수를 선언할 때 초기화해줘야 한다는 점이 다른다.<br>
(final은 변수를 선언한 후 나중에 값을 할당해줘도 된다.)
```dart
void main() {
    const PI = 3.14159;
    const E; // 에러 발생
    E = 2.71828; // 에러 발생
}
```

# **2. 데이터 타입**
다트는 모든 것들이 오브젝트이다.<br>
String, int, double, bool 또한 오브젝트로 이루어져있고 함수도 오브젝트이다.

## **2-1. Lists**
파이썬이나 JS처럼 대괄호 안에 요소를 적는 식으로 만든다.

타입은 List<자료형> 형태이다.
```dart
void main() {
    var numbers = [1, 2, 3, 4, 5];
    List<double> rates = [1.2, 4.8, 3.3, 2.7, 3.8];
}
```
요소를 추가할 때는 .add() 메소드를 사용하면 되고, 지울 땐 .remove() 메소드를 사용하면 된다.
```dart
void main() {
    var numbers = [1, 2, 3, 4, 5];
    numbers.add(6); // [1, 2, 3, 4, 5, 6]
    numbers.remove(3); // [1, 2, 4, 5, 6]
}
```
다트에는 collection if라는게 있다.<br>
리스트에 if 문이 있는 형태인데, 만약 if 문에 조건식이 맞으면 조건식 옆에 값이 들어가는 기능이다.
```dart
void main() {
    var addFive = true;
    var numList = [
        1,
        2,
        3,
        4,
        if (addFive) 5, // addFive가 true라면 5가 들어감
    ];
    print(numList); // [1, 2, 3, 4, 5]
}
```
아래 코드와 같다.
```dart
void main() {
    var addFive = true;
    var numList = [1, 2, 3, 4];
    if(addFive) numList.add(5);
    print(numList); // [1, 2, 3, 4, 5]
}
```

## **2-2. String Interpolation**
String Interpolation, 문자열 보간은 다트에서 $변수명 형태로 사용한다.
```dart
void main() {
    var name = 'leemyeongjae';
    var greeting = 'Hello, My name is $name';
    print(greeting);
}
```
만약 변수를 계산한 값을 사용하고 싶다면 중괄호로 묶어주면 된다.
```dart
void main() {
    var time = 23;
    print("Current time is ${time % 12} o'clock");
}
```

## **2-3. Collection For**
collection if와 비슷하게 collection for는 리스트 내에 for문을 쓴느 방식이다.
```dart
void main() {
    var favoriteAnimals = ['cat', 'dog', 'eagle'];
    var animals = [
        'duck',
        'lion',
        for (var animal in favoriteAnimals) "♥︎$animal"
    ];
    print(animals); // [duck, lion, ♥︎cat, ♥︎dog, ♥︎eagle]
}
```
다트에 for in문은 파이썬에 for in과 비슷하다.<br>
collection if 처럼 소괄호 옆에 있는 값이 리스트 내에 들어간다.

아래 코드와 같다.
```dart
void main() {
    var favoriteAnimals = ['cat', 'dog', 'eagle'];
    var animals = ['duck', 'lion'];
    for (var animal in favoriteAnimals) {
        animals.add("♥︎$animal");
    }
    print(animals); // [duck, lion, ♥︎cat, ♥︎dog, ♥︎eagle]
}
```

## **2-4. Maps**
Maps는 JS, TS의 오브젝트, 파이썬에 딕셔너리와 비슷하다.
```dart
void main() {
    var language = {
        'name': 'Dart',
        'Developer': 'Google',
        'DesignedBy': ['Lars Bak', 'Kasper Lund'],
        'FirstAppeared': 2013,
    };
}
```
`var 변수명 = { 키: 값 }` 형태로 쓰고 Map<키타입, 값타입> 형태의 타입을 갖는다.<br>
위의 경우엔 키는 String, 값은 Object가 된다.

**[챕터 2](#2-데이터-타입)** 시작부분에도 나와있듯이 dart에선 모든게 객체이다. 그리고 모든 객체는 Object 클래스에서 상속된다.

Map도 마찬가지로 타입을 지정해줄 수 있다.
```dart
void main() {
    Map<int, bool> a = {
        1: false,
        2: true,
        3: true,
        4: false,
        5: true,
    };
}
```
이런 형태도 올 수 있다.
```dart
void main() {
    Map<List<int>, bool> isEven = {
        [2, 4, 6, 8, 10]: true,
        [1, 3, 5, 7, 9]: false
    };
}
```

## **2-5. Sets**
리스트랑 비슷하게 중괄호라 요소들을 감싸주면 된다.

```dart
void main() {
    var numbers = {1, 2, 3, 4, 5};
}
```

타입도 직접 지정해줄 수 있다.
```dart
void main() {
    Set<int> evens = {2, 4, 6, 8, 10};
}
```

Sets라는 이름처럼 집합을 나타내는 타입인데, 집합 내에서 모든 오소들이 중복되지 않는 것처럼 Sets 타입도 마찬가지다.<br>
add로 같은 요소를 여러번 추가해도 한번만 들어간다.
```dart
void main() {
    var odds = {1, 3, 5, 7};
    odds.add(9);
    odds.add(9);
    odds.add(9);
    print(odds); // {1, 3, 5, 7, 9}
}
```

## **3. 함수**
dart에서 함수는 `반환형 함수명(파라미터) {}` 형태로 적는다.

반환형에 main함수에 void는 아무것도 반환하지 않겠다는 의미이다.
만약 문자열을 반환한다면 void자리에 String, 정수라면 int를 적으면 된다.
```dart
String getHello() {
    return 'Hello!';
}

void main() {
    print(getHello());
}
```

파라미터를 넘길 때 인자는 일반 변수 선언하듯이 하면 된다.
```dart
void sayHello(String name) {
    print("Hello! $name.");
}

void main() {
    sayHello("leemyeongjae");
}
```

만약 함수 내에 반환하는 return 문 한 줄밖에 없다면 => 기호로 간단히 만들 수 있다.
```dart
String getHello(String name) => 'Hello! $name.';

void main() {
    print(getHello("leemyeongjae"));
}
```

## **3-1. Named Parameters**
`함수(인자명: 값)` 형태로 함수에 인수를 전달하는 방식으로 가독성을 높일 수 있다.<br>
이때 함수의 인자들을 중괄호로 감싸줘야한다.
```dart
void printIntroduce({String name, int age, String country}) {
    print("Hello, I'm $name. I'm $age years old. I'm from $country");
}

void main() {
    printIntroduce(name: "leemyeongjae", age: 16, country: "Korea");
}
```

그럼 인자의 값이 null일 수 있다는 에러가 하나 뜬다.

해결법은 2가지가 있는데 첫번째는 기본값을 주는 것이다.

그럼 인수를 다 주지 않아도 에러가 나지 않는다.
```dart
void printIntroduce({
    String name = "anonymous",
    int age = 18,
    String country = "earth",
}) {
    print("Hello, I'm $name. I'm $age years old. I'm from $country");
}

void main() {
    printIntroduce(name: "leemyeongjae");
}
```

두번째 방법으론 인자 옆에 required 키워드를 붙이는 것이다.<br>
required를 쓰면 무조건 인수를 넘겨줘야한다.<br>
단, required는 기본값과 같이 쓸 수 없다.
```dart
void printIntroduce({
    required String name,
    required int age,
    required String country,
    required int lev = 10, // 에러 발생
}) {
    print("Hello, I'm $name. I'm $age years old. I'm from $country");
}

void main() {
    printIntroduce(name: "leemyeongjae", age: 16, country: "Korea");
}
```

기존 방식이었던 positional parameters의 경우, 인자의 위치를 기억해야한다는 단점이 있다.<br>
named parameters의 경우 위치를 기억할 필요도 없기에 함수를 일일이 볼 필요가 없다.

## **3-2. Optional Positional Parameters**
named parameters가 아닌데 기본값을 주고 싶을 땐 대괄호를 사용하면 된다.
```dart
void printIntroduce([
  String name = "anonymous",
  int age = 18,
  String country = "earth",
]) {
  print("Hello, I'm $name. I'm $age years old. I'm from $country");
}

void main() {
  printIntroduce();
}
```
대괄호를 썼는데 기본값을 설정하지 않으면 named parameters처럼 에러가 난다.<br>
named parameters와의 차이점이라면 required를 쓸 수 없다.

## **3-3. QQ Operator**
QQ Operator, ??는 2개의 피연산자를 갖는데, 만약 왼쪽 값이 null이면 오른쪽에 있는 값을 반환하고, 그렇지 않다면 왼쪽에 있는 값을 반환하는 연산자이다.
```dart
void logIn({String? name}) {
  print("${name ?? "Anonymous"} was logged in.");
}

void main() {
  logIn(name: "leemyeongjae"); // leemyeongjae was logged in.
  logIn(); // Anonymous was logged in.
}
```

QQ assignment operator, ??= 는 할당 연산자인데 왼쪽에 변수에 값이 null이라면 오른쪽에 값을 할당해주고 그렇지 않다면 할당해주지 않는 연산자이다.
```dart
void logOut({String? name}) {
  name ??= "Anonymous";
  print("$name was logged out.");
}

void main() {
  logOut(name: "leemyeongjae"); // leemyeongjae was logged out.
  logOut(); // Anonymous was logged out.
}
```

## **3-4. Typedef**
typedef는 타입에 별명을 붙일 수 있게 해주는 기능이다.
`typedef ListOfInts = List<int>` 형태로 쓰면 `List<int>` 대신에 `ListOfInts`를 사용할 수 있다.
```dart
typedef ListOfInts = List<int>;
ListOfInts getFilteredEvenNumberList(ListOfInts numberList) {
    return numberList.where((number) => number % 2 == 0).toList();
}

void main() {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    var evenNumbers = getFilteredEvenNumberList(numbers);
    print(evenNumbers); // [2, 4, 6, 8, 10]
}
```

# **4. 클래스**
클래스는 `class 클래스명 {}` 형태로 쓴다.<br>
클래스 내 프로퍼티는 타입으로 정의한다.
```dart
class Player {
    String name = "asf";
    int age; // 에러 발생
}
```

dart 스타일가이드에서 class의 프로퍼티는 타입으로 정의하는 걸 권장한다.<br>
타입으로 정의할 경우 변수를 무조건 초기화해줘야한다.

객체를 생성할 땐 var로 지정할 경우 초기화해줄 필요가 없는데 dynamic 타입이 되기 때문이다.

일반적인 변수와 마찬가지로 final, late를 달 수 있고, [여기서](#1-5-late-variables) 봤듯이 late를 쓰면 타입을 직접적으로 쓰더라도 초기화를 해줄 필요가 없어진다.

메소드는 클래스에 그냥 함수 쓰듯이 정의하면 된다.
```dart
class Player {
    String name = "Anonymous";
    void jump() {
        print("$name is Jumping!");
    }
}

void main() {
    var player = Player();
    player.name = "leemyeongjae";
    player.jump();
}
```

만약 메소드 내에 프로퍼티와 같은 이름의 변수가 있고, 그 프로퍼티에 접근을 하고 싶다면 this 키워드를 사용하면 된다.

이때 this는 Player를 가르킨다.
```dart
class Player {
    String name = "Anonymous";
    void jump() {
        var name = "Someone";
        print("${this.name} is Jumping!");
    }
}

void main() {
    var player = Player();
    player.name = "leemyeongjae";
    player.jump();
}
```

## **4-1. Constructors**
constructor는 객체를 생성할 때 객체 내 프로퍼티도 함께 선언하게 해준다.

또한 constructor로 프로퍼티에 값을 준다고 해도 프로퍼티에 값이 없다면 late를 달아줘야한다.
```dart
class Player {
    late String name;
    late int age;
    late String favoriteLang;

    Player(String name, int age, String favoriteLang) {
        this.name = name;
        this.age = age;
        this.favoriteLang = favoriteLang;
    }
}

void main() {
    var player1 = Player("leemyeongjae", 16, "JavaScript");
    var player2 = Player("crab", 11, "Rust");
    var player3 = Player("camel", 35, "Perl");
}
```

위 예처럼 constructor를 쓸 경우, 특징이 다른 객체들을 보다 쉽게 생성해낼 수 있다.

프로퍼티에 값을 할당해줄 때 this.프로퍼티를 인자로 대체해서 간추릴 수 있다.
```dart
class Monster {
    String name;
    bool canFly;
    int hp;
    Monster(this.name, this.canFly, this.hp);
}

void main() {
    var monster = Monster("dragon", true, 9999);
}
```
이러면 late 키워드도 없앨 수 있다.

## **4-2. Named Constructor Parameters**
named constructor parameters는 함수에 named parameters와 비슷하게 인자를 중괄호로 묶으면된다.
```dart
class Player {
    late String name;
    late int age;
    late String favoriteLang;

    Player({required this.name, required this.age, this.favoriteLang = "None"});
}

void main() {
    var player1 = Player(name: "leemyeongjae", age: 16);
    var player2 = Player(name: "crab", age: 11, favoriteLang: "Rust");
    var player3 = Player(name: "camel", age: 35, favoriteLang: "Perl");
}
```

named parameters와 비슷하게 required를 쓰거나 기본값을 주어야 오류를 없앨 수 있다.

## **4-3. Named Constructors**
클래스명.constructor명 형태로 쓰인다.
```dart
class Player {
    late String name;
    late int age;
    late String teamColor;
    late String teamName;

    Player(this.name, this.age, this.teamColor);
    Player.blueTeam(this.name, this.age)
        : this.teamColor = 'blue',
          this.teamName = "dart";

    Player.redTeam({
      required this.name,
      required this.age,
    })  : this.teamColor = 'red',
          this.teamName = "ruby";
}

void main() {
    var blueTeamPlayer = Player.blueTeam("dart", 10);
    var redTeamPlayer = Player.redTeam(name: "ruby", age: 27);
}
```
객체를 선언할 때도 클래스명.constructor명 형태로 선언하고, 이 named constructor에서 프로퍼티에 값을 할당할 땐 콜론(:)을 써서 프로퍼티에 값을 할당한다.<br>
프로퍼티가 여러개일 땐 쉼표(,)로 구분한다.

## **4-4. Cascade Notation**
cascade notation은 객체를 생성한 뒤, 프로퍼티를 줄 때 간단하게 줄 수 있게 해주는 기능이다.
```dart
class Player {
    late String name;
    late int age;
    late String favoriteLang;

    void introduceYourSelf() {
        print("Hello, I'm $name, $age years old, my favorite language is $favoriteLang");
    }
}

void main() {
    var player = Player()
        ..name = "leemyeongjae"
        ..age = 16
        ..favoriteLang = "JS"
        ..introduceYourSelf();
}
```
..에서 앞에 .이 player를 가르킨다고 생각하면 되고, 세미콜론으로 끊으면 된다.

## **4-5 Enums**
enum은 많이 쓰이는 문자열, 값들을 하나의 묶음으로 만들어주는 기능이다.

```dart
class Player {
    late String teamName;
    late int age;

    Player({
        required this.teamName,
        required this.age,
    });
    
    void introduceYourTeam() {
        if (this.teamName == "dart") {
            print("I'm blue team");
        } else if (this.teamName == "ruby") {
            print("I'm red team");
        }
    }
}

void main() {
    var blueTeamPlayer = Player(age: 10, teamName: 'dart');
    var redTeamPlayer = Player(age: 27, teamName: 'ruby');

    blueTeamPlayer.introduceYourTeam();
    redTeamPlayer.introduceYourTeam();
}
```

위에 Player 클래스가 있고 팀명이 "dart", "ruby"로 구분된다고 한다면 enum을 써서 아래처럼 바꿀 수 있다.

```dart
enum TeamName { dart, ruby }

class Player {
    late TeamName teamName;
    late int age;

    Player({
        required this.teamName,
        required this.age,
    });

    void introduceYourTeam() {
        if (this.teamName == TeamName.dart) {
            print("I'm blue team");
        } else if (this.teamName == TeamName.ruby) {
            print("I'm red team");
        }
    }
}

void main() {
    var blueTeamPlayer = Player(age: 10, teamName: TeamName.dart);
    var redTeamPlayer = Player(age: 27, teamName: TeamName.ruby);

    blueTeamPlayer.introduceYourTeam();
    redTeamPlayer.introduceYourTeam();
}
```

문자열 실수가 일어날 수 있는 객체 생성부분과 if문 조건식에 문자열을 enum을 사용하여 묶어주었다.<br>
이런 방식으로 경우 오타가 발생했을 때 에러 하이라이팅이 될 뿐만 아니라 에러의 발생 위치도 쓸데 없는 곳에서 일어나지 않는다.

값을 할당할 땐
```dart
enum Thing { dart("dart"), ruby("ruby") }
```
처럼 소괄호 안에 값을 쓰면 된다.

## **4-6. Abstract Classes**
추상 클래스는 객체를 생성할 수 없고 상속만 가능한 클래스이다.

```dart
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
```

상속은 `자식 extends 부모` 형식으로 하고 추상클래스를 상속받은 클래스는 추상클래스에 정의된 메소드를 항상 구현해줘야 한다.

## **4-7. Inheritance**
상속은 추상클래스를 상속하듯이 extends를 이용하여 클래스를 상속하는 것을 의미한다.
```dart
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
```
Human 클래스가 있고 그 클래스를 상속받는 SchoolWorker가 있다.

자식 클래스에서 constructor가 동작할 때, 부모 클래스의 constructor도 동작해야 하는데,<br>
부모 클래스의 constructor에 인자를 보낼 땐 `super()`를 호출하면 된다.

부모 클래스의 메소드를 호출할 땐 `super.메서드명()` 형식으로 호출하면 된다.

자식이 부모의 메소드를 오버라이딩할 때 반환값과 시그니쳐가 같지 않다면 에러가 난다.

```dart
class Human {
  final String name;
  Human(this.name);

  void sayHello() { // 반환값: void, 시그니쳐 없음
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
  int sayHello(String name) { // 에러 발생
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
```
그리고 오버라이딩하는 메소드 위에 @override 데코레이션은 생략해줘도 된다.

## **4-8. Mixins**
mixin은 생성자가 없는 클래스를 의미한다.<br>
다른 클래스에서 쓰는 중복되는 메서드나 프로퍼티를 하나로 묶고, 연결할 때 사용한다.

연결할 땐 with를 쓴다.
```dart
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
```
또한 mixin은 with를 써서 한번 더 연결시킬 수 없다.
