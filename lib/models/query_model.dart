import 'dart:convert';

import 'package:flutter/foundation.dart';

class QueryModel {
  final List<ActiveLender> activeLenders;
  QueryModel({
    required this.activeLenders,
  });

  QueryModel copyWith({
    List<ActiveLender>? activeLenders,
  }) {
    return QueryModel(
      activeLenders: activeLenders ?? this.activeLenders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activeLenders': activeLenders.map((x) => x.toMap()).toList(),
    };
  }

  factory QueryModel.fromMap(Map<String, dynamic> map) {
    return QueryModel(
      activeLenders: List<ActiveLender>.from(
          map['activeLenders']?.map((x) => ActiveLender.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryModel.fromJson(String source) =>
      QueryModel.fromMap(json.decode(source));

  @override
  String toString() => 'Data(activeLenders: $activeLenders)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QueryModel &&
        listEquals(other.activeLenders, activeLenders);
  }

  @override
  int get hashCode => activeLenders.hashCode;
}

class ActiveLender {
  final bool btl;
  final String name;
  final String reference;
  final bool resi;
  final String type;
  ActiveLender({
    required this.btl,
    required this.name,
    required this.reference,
    required this.resi,
    required this.type,
  });

  ActiveLender copyWith({
    bool? btl,
    String? name,
    String? reference,
    bool? resi,
    String? type,
  }) {
    return ActiveLender(
      btl: btl ?? this.btl,
      name: name ?? this.name,
      reference: reference ?? this.reference,
      resi: resi ?? this.resi,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'btl': btl,
      'name': name,
      'reference': reference,
      'resi': resi,
      'type': type,
    };
  }

  factory ActiveLender.fromMap(Map<String, dynamic> map) {
    return ActiveLender(
      btl: map['btl'] ?? false,
      name: map['name'] ?? '',
      reference: map['reference'] ?? '',
      resi: map['resi'] ?? false,
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ActiveLender.fromJson(String source) =>
      ActiveLender.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActiveLender(btl: $btl, name: $name, reference: $reference, resi: $resi, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActiveLender &&
        other.btl == btl &&
        other.name == name &&
        other.reference == reference &&
        other.resi == resi &&
        other.type == type;
  }

  @override
  int get hashCode {
    return btl.hashCode ^
        name.hashCode ^
        reference.hashCode ^
        resi.hashCode ^
        type.hashCode;
  }
}
