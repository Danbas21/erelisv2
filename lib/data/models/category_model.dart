import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: _getIconFromString(json['icon'] ?? 'graduation-cap'),
      color: _getColorFromString(json['color'] ?? '#F59E0B'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': _getStringFromIcon(icon),
      'color': _getStringFromColor(color),
    };
  }

  static IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'graduation-cap':
        return FontAwesomeIcons.graduationCap;
      case 'landmark':
        return FontAwesomeIcons.landmark;
      case 'book':
        return FontAwesomeIcons.book;
      case 'university':
        return FontAwesomeIcons.university;
      case 'flask':
        return FontAwesomeIcons.flask;
      case 'calculator':
        return FontAwesomeIcons.calculator;
      default:
        return FontAwesomeIcons.graduationCap;
    }
  }

  static String _getStringFromIcon(IconData icon) {
    if (icon == FontAwesomeIcons.graduationCap) return 'graduation-cap';
    if (icon == FontAwesomeIcons.landmark) return 'landmark';
    if (icon == FontAwesomeIcons.book) return 'book';
    if (icon == FontAwesomeIcons.university) return 'university';
    if (icon == FontAwesomeIcons.flask) return 'flask';
    if (icon == FontAwesomeIcons.calculator) return 'calculator';
    return 'graduation-cap';
  }

  static Color _getColorFromString(String colorStr) {
    if (colorStr.startsWith('#')) {
      return Color(int.parse('0xFF${colorStr.substring(1)}'));
    }
    return Color(0xFFF59E0B); // Default orange color
  }

  static String _getStringFromColor(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  // Proporcionar datos estáticos para desarrollo mientras no haya conexión con Firebase
  static List<CategoryModel> getMockCategories() {
    return [
      CategoryModel(
        id: 'ipn',
        name: 'IPN',
        icon: FontAwesomeIcons.graduationCap,
        color: Color(0xFFFCD34D), // Golden yellow for IPN
      ),
      CategoryModel(
        id: 'unam',
        name: 'UNAM',
        icon: FontAwesomeIcons.university,
        color: Color(0xFF3B82F6), // Blue for UNAM
      ),
      CategoryModel(
        id: 'comipems',
        name: 'COMIPEMS',
        icon: FontAwesomeIcons.book,
        color: Color(0xFF10B981), // Green for COMIPEMS
      ),
      CategoryModel(
        id: 'uam',
        name: 'UAM',
        icon: FontAwesomeIcons.landmark,
        color: Color(0xFFEC4899), // Pink for UAM
      ),
      CategoryModel(
        id: 'tecnm',
        name: 'TECNM',
        icon: FontAwesomeIcons.flask,
        color: Color(0xFFF43F5E), // Red for TECNM
      ),
      CategoryModel(
        id: 'conamat',
        name: 'CONAMAT',
        icon: FontAwesomeIcons.calculator,
        color: Color(0xFF6366F1), // Indigo for CONAMAT
      ),
    ];
  }
}
