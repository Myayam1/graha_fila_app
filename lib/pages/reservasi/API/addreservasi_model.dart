class ReservationModel {
  int? id;
  int? userId;
  int spotId;
  int amount;
  String reservationTime;
  String? bookedBy;
  String name;
  String phone;
  String? createdAt;
  String? updatedAt;

  ReservationModel({
    this.id,
    this.userId,
    required this.spotId,
    required this.reservationTime,
    this.bookedBy,
    required this.name,
    required this.phone,
    this.createdAt,
    this.updatedAt,
    required this.amount,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      userId: json['user_id'],
      spotId: json['spot_id'],
      reservationTime: json['reservation_time'],
      bookedBy: json['booked_by'],
      name: json['name'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      amount: json['amount'] ?? 10000
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'spot_id': spotId,
      'reservation_time': reservationTime,
      'amount': amount,
    };
  }
}


class TimeSlot {
  final String time;
  final String status; 

  TimeSlot({
    required this.time,
    required this.status,
  });

  TimeSlot copyWith({
    String? time,
    String? status,
  }) {
    return TimeSlot(
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }
}