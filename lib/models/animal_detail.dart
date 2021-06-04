class AnimalDetail {
  final String name;
  final String chipNo;
  final String gender;
  final bool? neutered;
  final String dob;
  final String specie;
  final String breed;
  final String colour;
  final String conditions;
  final String chipImplantationDate;

  AnimalDetail({
    required this.name,
    required this.chipNo,
    required this.gender,
    this.neutered: false,
    required this.dob,
    required this.specie,
    required this.breed,
    required this.colour,
    required this.conditions,
    required this.chipImplantationDate,
  });

  factory AnimalDetail.fromMap(Map<String, dynamic> json) {
    return AnimalDetail(
      name: json['name'],
      chipNo: json['chipNo'],
      gender: json['gender'],
      dob: json['dob'],
      specie: json['specie'],
      breed: json['breed'],
      colour: json['colour'],
      conditions: json['conditions'] ?? '',
      chipImplantationDate: json['chipImplantationDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'chipNo': this.chipNo,
      'gender': this.gender,
      'neutered': this.neutered,
      'dob': this.dob,
      'specie': this.specie,
      'breed': this.breed,
      'colour': this.colour,
      'conditions': this.conditions,
      'chipImplantationDate': this.chipImplantationDate,
    };
  }

  static AnimalDetail animalDetail = AnimalDetail(
      name: 'Cattle',
      chipNo: '24294814',
      gender: 'Male',
      dob: '24/03/2021',
      specie: 'Sokoto Bororo',
      breed: 'Sokoto Bororo',
      colour: 'Black',
      conditions: 'Healthy',
      chipImplantationDate: '24/06/2021');
}
