class Profile {
  String sub;
  String nickname;
  String name;
  String picture;
  String updatedAt;

  Profile(
    this.sub,
    this.nickname,
    this.name,
    this.picture,
    this.updatedAt,
  );

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      map['sub'],
      map['nickname'],
      map['name'],
      map['picture'],
      map['updated_at'],
    );
  }
}
