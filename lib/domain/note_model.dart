import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteModel {
  String? id;
  final String? title;
  final List<String>? titleSearch;

  final String? description;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NoteModel({
    this.id,
    required this.title,
    required this.titleSearch,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'titleSearch': titleSearch,
      'description': description,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      titleSearch: json['titleSearch'] != null
          ? List<String>.from(json['titleSearch'])
          : null,
      description: json['description'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'].toDate(),
      updatedAt: json['updatedAt'].toDate(),
    );
  }

  /// Map note from firestore to NoteModel
  factory NoteModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return NoteModel(
      id: data['id'],
      title: data['title'],
      titleSearch: data['titleSearch'] != null
          ? List<String>.from(data['titleSearch'])
          : null,
      description: data['description'],
      createdBy: data['createdBy'],
      createdAt: data['createdAt'].toDate(),
      updatedAt: data['updatedAt'].toDate(),
    );
  }
}
