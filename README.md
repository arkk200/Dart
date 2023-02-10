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
다트에 거의 모든 것들이 오브젝트이다.<br>
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