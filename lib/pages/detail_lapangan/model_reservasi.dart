class ReservationModel {
  final int id;
  final String nama;
  final String telp;
  final String tanggal;
  final String waktu;
  final String lapangan;
  final String bookedBy; // Menambahkan properti bookedBy
  final UserModel? user; // Menambahkan user (optional)

  ReservationModel({
    required this.id,
    required this.nama,
    required this.telp,
    required this.tanggal,
    required this.waktu,
    required this.lapangan,
    required this.bookedBy, 
    this.user, 
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    final reservationTime = DateTime.parse(json['reservation_time']);
    final tanggal = '${reservationTime.year.toString().padLeft(4, '0')}-${reservationTime.month.toString().padLeft(2, '0')}-${reservationTime.day.toString().padLeft(2, '0')}';
    final waktu = '${reservationTime.hour.toString().padLeft(2, '0')}:${reservationTime.minute.toString().padLeft(2, '0')}';

    // Get name and phone either from the 'user' or fallback to reservation fields
    final nama = json['user']?['name'] ?? json['name'] ?? 'Unknown'; 
    final telp = json['user']?['phone_number'] ?? json['phone'] ?? 'Unknown'; 

    return ReservationModel(
      id: json['id'],
      nama: nama,
      telp: telp,
      tanggal: tanggal,
      waktu: waktu,
      lapangan: json['spot_id'].toString(), 
      bookedBy: json['booked_by'] ?? 'Unknown', 
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null, 
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? 'Unknown', 
      phoneNumber: json['phone_number'] ?? '-', 
    );
  }
}
