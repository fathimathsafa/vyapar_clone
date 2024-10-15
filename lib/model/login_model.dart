// login_response.dart
class LoginResponse {
  final int status;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final String token;
  final User user;

  LoginData({
    required this.token,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'] ?? "",
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String id;
  final Details details;

  User({
    required this.id,
    required this.details,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      details: Details.fromJson(json['details']),
    );
  }
}

class Details {
  final String id;
  final BusinessDetails businessDetails;
  final String? gstIn;
  final String countryCode;
  final String phoneNo;
  final String? otpCode;
  final String? otpExpiration;
  final bool isPhoneNoVerified;
  final String createdAt;
  final String updatedAt;
  final int v;

  Details({
    required this.id,
    required this.businessDetails,
    this.gstIn,
    required this.countryCode,
    required this.phoneNo,
    this.otpCode,
    this.otpExpiration,
    required this.isPhoneNoVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      id: json['_id'],
      businessDetails: BusinessDetails.fromJson(json['businessDetails']),
      gstIn: json['gstIn'] ?? "",
      countryCode: json['countryCode'] ?? "",
      phoneNo: json['phoneNo'] ?? "",
      otpCode: json['otpCode'] ?? "",
      otpExpiration: json['otpExpiration'] ?? "",
      isPhoneNoVerified: json['isPhoneNoVerified'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      v: json['__v'] ?? "",
    );
  }
}

class BusinessDetails {
  final String businessType;
  final String state;

  BusinessDetails({
    required this.businessType,
    required this.state,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return BusinessDetails(
      businessType: json['businessType'] ?? "",
      state: json['state'] ?? "",
    );
  }
}
