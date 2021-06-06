class AnimalDetail {
  final String name;
  final String chipNo;
  final String gender;
  final String dob;
  final String type;
  final String colour;
  final String conditions;
  final String chipImplantationDate;

  AnimalDetail({
    required this.name,
    required this.chipNo,
    required this.gender,
    required this.dob,
    required this.type,
    required this.colour,
    required this.conditions,
    required this.chipImplantationDate,
  });

  factory AnimalDetail.fromMap(Map<String, dynamic> json) {
    return AnimalDetail(
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

  static AnimalDetail animalDetail = AnimalDetail(
      name: 'Cattle',
      chipNo: '24294814',
      gender: 'Male',
      dob: '24/03/2021',
      type: 'Sokoto Bororo',
      colour: 'Black',
      conditions: 'Healthy',
      chipImplantationDate: '24/06/2021');

  static List<AnimalDetail> animalDetails = [
    animalDetail,
    animalDetail,
    animalDetail,
    animalDetail,
    animalDetail,
  ];
}
