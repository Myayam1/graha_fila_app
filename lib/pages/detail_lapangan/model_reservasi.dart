class ReservationModel {
  final int id;
  final String nama;
  final String telp;
  final String tanggal; // Format YYYY-MM-DD untuk internal API
  final String tanggalFormatted; // Format DD MMM YYYY untuk UI
  final String waktu;
  final String lapangan;
  final String bookedBy;
  final UserModel? user;

  ReservationModel({
    required this.id,
    required this.nama,
    required this.telp,
    required this.tanggal,
    required this.tanggalFormatted,
    required this.waktu,
    required this.lapangan,
    required this.bookedBy,
    this.user,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    final reservationTime = DateTime.parse(json['reservation_time']);
    
    // Format untuk komunikasi API (YYYY-MM-DD)
    final tanggal =
        '${reservationTime.year.toString().padLeft(4, '0')}-${reservationTime.month.toString().padLeft(2, '0')}-${reservationTime.day.toString().padLeft(2, '0')}';
    
    // Format untuk UI (DD MMM YYYY)
    final int day = reservationTime.day;
    final String monthAbbr = _getMonthAbbreviation(reservationTime.month);
    final int year = reservationTime.year;
    final tanggalFormatted = '$day $monthAbbr $year';
    
    final waktu =
        '${reservationTime.hour.toString().padLeft(2, '0')}:${reservationTime.minute.toString().padLeft(2, '0')}';
    final nama = json['user']?['name'] ?? json['name'] ?? 'Unknown';
    final telp = json['user']?['phone_number'] ?? json['phone'] ?? 'Unknown';

    return ReservationModel(
      id: json['id'],
      nama: nama,
      telp: telp,
      tanggal: tanggal,
      tanggalFormatted: tanggalFormatted,
      waktu: waktu,
      lapangan: json['spot_id'].toString(),
      bookedBy: json['booked_by'] ?? 'Unknown',
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
  
  // Helper method untuk mendapatkan singkatan bulan
  static String _getMonthAbbreviation(int month) {
    final monthNames = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return monthNames[month - 1];
  }
}

class UserModel {
  final int id;
  final String name;
  final String phoneNumber;

  UserModel({required this.id, required this.name, required this.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      phoneNumber: json['phone_number'] ?? '-',
    );
  }
}