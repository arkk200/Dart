void logIn({String? name}) {
  print("${name ?? "Anonymous"} was logged in.");
}

void logOut({String? name}) {
  name ??= "Anonymous";
  print("$name was logged out.");
}

void main() {
  logIn(name: "leemyeongjae"); // leemyeongjae was logged in.
  logIn(); // Anonymous was logged in.
  logOut(name: "leemyeongjae"); // leemyeongjae was logged out.
  logOut(); // Anonymous was logged out.
}
