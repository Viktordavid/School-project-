class AnimalDetail {
  final String id;
  final String userId;
  final String name;
  final String chipNo;
  final String gender;
  final String dob;
  final String type;
  final String colour;
  final String conditions;
  final String chipImplantationDate;

  const AnimalDetail({
    this.id = '',
    required this.userId,
    required this.name,
    required this.chipNo,
    required this.gender,
    required this.dob,
    required this.type,
    required this.colour,
    required this.conditions,
    required this.chipImplantationDate,
  });

  factory AnimalDetail.fromMap(Map<String, dynamic> json, String id) {
    return AnimalDetail(
      id: id,
      userId: json['userId'],
      name: json['name'],
      chipNo: json['chipId'],
      gender: json['gender'],
      dob: json['dob'],
      type: json['type'],
      colour: json['colour'],
      conditions: json['conditions'],
      chipImplantationDate: json['implantationDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'name': this.name,
      'chipId': this.chipNo,
      'gender': this.gender,
      'dob': this.dob,
      'type': this.type,
      'colour': this.colour,
      'conditions': this.conditions,
      'implantationDate': this.chipImplantationDate,
    };
  }
}
