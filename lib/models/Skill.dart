class Skill {
  String kind;
  int value; //min: 0, max: 5

  Skill(String kind, int value) {
    this.kind = kind;
    this.value = (value > 5)
        ? 5
        : (value < 0)
            ? 0
            : value;
  }

  String toString() {
    return this.kind + ": " + this.value.toString();
  }
}

class SkillType {
  static final SPEED = "SPEED";
  static final CLEVERNESS = "CLEVERNESS";
  static final INTELLIGENCE = "INTELLIGENCE";
  static final STRENGTH = "STRENGTH";
}
