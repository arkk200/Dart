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

  void introduceYourTeam() {
    print("My team color is $teamColor");
  }
}

void main() {
  var blueTeamPlayer = Player.blueTeam("dart", 10);
  var redTeamPlayer = Player.redTeam(name: "ruby", age: 27);

  blueTeamPlayer.introduceYourTeam();
  redTeamPlayer.introduceYourTeam();
}
