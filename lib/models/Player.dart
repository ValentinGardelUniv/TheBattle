import 'package:projet/models/Team.dart';

class Player {
  String uuid, firstname, lastname, email;
  int gender;
  Team team;

  Player(String uuid, String firstname, String lastname, String email,
      int gender) {
    this.uuid = uuid;
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    this.gender = gender;
    this.team = new Team("uuid", this);
  }
}
