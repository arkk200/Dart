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
