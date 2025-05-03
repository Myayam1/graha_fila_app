class RiwayatPendapatanModel {
  int? id;
  int? reservationId;
  int? userId;
  String? status;
  String? amount;
  String? createdAt;
  String? updatedAt;
  
  // Data tambahan dari relasi dengan reservation
  String? name;
  String? phone;
  dynamic spotId; 
  String? reservationTime;

  RiwayatPendapatanModel({
    this.id,
    this.reservationId,
    this.userId,
    this.status,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.phone,
    this.spotId,
    this.reservationTime,
  });

  factory RiwayatPendapatanModel.fromJson(Map<String, dynamic> json) {
    // Pengecekan untuk lapangan yang mungkin null 
    dynamic spotId;
    if (json.containsKey('reservation') && json['reservation'] != null) {
      spotId = json['reservation']['spot_id'];
    } else if (json.containsKey('spot_id')) {
      spotId = json['spot_id'];
    }
    
    return RiwayatPendapatanModel(
      id: json['id'],
      reservationId: json['reservation_id'],
      userId: json['user_id'],
      status: json['status'],
      amount: json['amount'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],

      // Data dari relasi dengan pengecekan null
      name: json.containsKey('reservation') && json['reservation'] != null 
          ? json['reservation']['name'] 
          : json['name'],
      phone: json.containsKey('reservation') && json['reservation'] != null 
          ? json['reservation']['phone'] 
          : json['phone'],
      spotId: spotId,
      reservationTime: json.containsKey('reservation') && json['reservation'] != null 
          ? json['reservation']['reservation_time'] 
          : json['reservation_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reservation_id': reservationId,
      'user_id': userId,
      'status': status,
      'amount': amount,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'name': name,
      'phone': phone,
      'spot_id': spotId,
      'reservation_time': reservationTime,
    };
  }
  
  String? getSpotIdString() {
    if (spotId == null) return null;
    return spotId.toString();
  }
  
  int? getSpotIdInt() {
    if (spotId == null) return null;
    if (spotId is int) return spotId;
    return int.tryParse(spotId.toString());
  }
}