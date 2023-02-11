### **[이 사이트](https://nomadcoders.co/) 학습하고 있습니다.**

# **0. 왜 다트인가**

### **다트는 2개의 컴파일러를 가지고 있다.**
다트 코드를 자바스크립트로 변환해주는 Dart Web이라는 컴파일러가 있고, <br>
다트 코드를 여러 CPU 아케텍쳐에 맞게 변환해주는 Dart Native라는 컴파일러가 있다.<br>
여러 CPU 아키텍쳐에 맞게 변환할 수 있기에 IOS, Android, Windows, Linux, Mac, 사물인터넷, 자동차 같은데서도 쓸 수 있다.

### **dart native에는 just-in-time(JIT)과 ahead-of-time(AOT)라는 컴파일러가 있다.**
- JIT 컴파일러는 dart VM에 있는 컴파일 방식으로 코드의 결과를 바로 보여준다.<br>
가상 머신에서 동작하기에 조금 느리다.
- AOT는 바이너리를 생성할 때 쓰는 컴파일러다. 때문에 개발 과정에서 AOT 방식의 컴파일은 효율적이지 못하다.

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

## **3. Functions**
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

기존 방식이었던 positional parameter의 경우, 인자의 위치를 기억해야한다는 단점이 있다.<br>
named parameter의 경우 위치를 기억할 필요도 없기에 함수를 일일이 볼 필요가 없다.

## **3-2. Optional Positional Parameters**
named parameter가 아닌데 기본값을 주고 싶을 땐 대괄호를 사용하면 된다.
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
대괄호를 썼는데 기본값을 설정하지 않으면 named Parameter처럼 에러가 난다.<br>
named Parameter와의 차이점이라면 required를 쓸 수 없다.