import 'package:flutter/material.dart';

class ContactOption {
  final String label;
  final String value;
  final String url;
  final IconData icon;

  const ContactOption({
    required this.label,
    required this.value,
    required this.url,
    required this.icon,
  });
}

class Recommendation {
  final String author;
  final String role;
  final String comment;

  const Recommendation({
    required this.author,
    required this.role,
    required this.comment,
  });
}