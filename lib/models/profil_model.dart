class ProfileModel {
  final String id;
  final String email;
  final String name;
  final String status;

  ProfileModel({
    required this.id,
    required this.email,
    required this.name,
    required this.status,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      status: json['status_anggota'] ?? '',
    );
  }
}
