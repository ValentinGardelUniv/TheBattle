enum SkillType { STRENGTH, CLEVERNESS, INTELLIGENCE, SPEED }

class Skill {
  SkillType kind;
  int value; //min: 0, max: 5

  Skill(SkillType kind, int value) {
    this.kind = kind;
    this.value = (value > 5)
        ? 5
        : (value < 0)
            ? 0
            : value;
  }
}
