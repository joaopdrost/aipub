import 'dart:convert';

class Tokenization {
  final String accessToken;
  final String refreshToken;

  Tokenization({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access': accessToken,
      'refresh': refreshToken,
    };
  }

  factory Tokenization.fromMap(Map<String, dynamic> map) {
    return Tokenization(
      accessToken: map['access'] as String,
      refreshToken: map['refresh'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tokenization.fromJson(String source) => Tokenization.fromMap(json.decode(source) as Map<String, dynamic>);
}
