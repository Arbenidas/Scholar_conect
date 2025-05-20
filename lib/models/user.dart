class User {
  final String id;
  final String email;
  String fullName;
  String? profileImageUrl;
  String? university;
  String? major;
  int? graduationYear;
  List<String> interests;
  String? bio;
  String? phoneNumber;
  String? location;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    this.profileImageUrl,
    this.university,
    this.major,
    this.graduationYear,
    this.interests = const [],
    this.bio,
    this.phoneNumber,
    this.location,
  });

  // Crear una copia del usuario con campos actualizados
  User copyWith({
    String? fullName,
    String? profileImageUrl,
    String? university,
    String? major,
    int? graduationYear,
    List<String>? interests,
    String? bio,
    String? phoneNumber,
    String? location,
  }) {
    return User(
      id: this.id,
      email: this.email,
      fullName: fullName ?? this.fullName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      university: university ?? this.university,
      major: major ?? this.major,
      graduationYear: graduationYear ?? this.graduationYear,
      interests: interests ?? this.interests,
      bio: bio ?? this.bio,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
    );
  }

  // Convertir a Map para almacenamiento
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'profileImageUrl': profileImageUrl,
      'university': university,
      'major': major,
      'graduationYear': graduationYear,
      'interests': interests,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'location': location,
    };
  }

  // Crear desde Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      fullName: map['fullName'],
      profileImageUrl: map['profileImageUrl'],
      university: map['university'],
      major: map['major'],
      graduationYear: map['graduationYear'],
      interests: List<String>.from(map['interests'] ?? []),
      bio: map['bio'],
      phoneNumber: map['phoneNumber'],
      location: map['location'],
    );
  }
}
