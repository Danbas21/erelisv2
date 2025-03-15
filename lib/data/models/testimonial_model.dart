class TestimonialModel {
  final String id;
  final String name;
  final String avatarUrl;
  final String content;
  final double rating;
  final String course;
  final DateTime date;

  TestimonialModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.content,
    required this.rating,
    required this.course,
    required this.date,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      content: json['content'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      course: json['course'] ?? '',
      date:
          json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'content': content,
      'rating': rating,
      'course': course,
      'date': date.toIso8601String(),
    };
  }

  // Proporcionar datos estáticos para desarrollo mientras no haya conexión con Firebase
  static List<TestimonialModel> getMockTestimonials() {
    return [
      TestimonialModel(
        id: '1',
        name: 'Adriana Lopez',
        avatarUrl: 'assets/images/testimonials/adriana.png',
        content:
            'Gracias a los cursos de Erelis logré aprobar mi examen de admisión a la UNAM con un puntaje excelente. Los profesores son increíbles y el material de estudio muy completo.',
        rating: 5.0,
        course: 'Curso de admisión UNAM',
        date: DateTime.now().subtract(Duration(days: 15)),
      ),
      TestimonialModel(
        id: '2',
        name: 'Javier Ramírez',
        avatarUrl: 'assets/images/testimonials/javier.png',
        content:
            'La plataforma es muy intuitiva y los maestros explican de manera clara y concisa. Recomiendo ampliamente los cursos de preparación para el IPN.',
        rating: 4.5,
        course: 'Curso de admisión IPN',
        date: DateTime.now().subtract(Duration(days: 20)),
      ),
      TestimonialModel(
        id: '3',
        name: 'Mariana Suárez',
        avatarUrl: 'assets/images/testimonials/mariana.png',
        content:
            'El curso para COMIPEMS me ayudó a obtener mi primera opción. Los ejercicios prácticos y simulacros son muy similares al examen real.',
        rating: 5.0,
        course: 'Curso de admisión COMIPEMS',
        date: DateTime.now().subtract(Duration(days: 10)),
      ),
      TestimonialModel(
        id: '4',
        name: 'Daniel Vega',
        avatarUrl: 'assets/images/testimonials/daniel.png',
        content:
            'Excelente experiencia. Los profesores están siempre disponibles para resolver dudas y el contenido está muy bien estructurado.',
        rating: 4.8,
        course: 'Curso de admisión UAM',
        date: DateTime.now().subtract(Duration(days: 30)),
      ),
      TestimonialModel(
        id: '5',
        name: 'Sofía Mendoza',
        avatarUrl: 'assets/images/testimonials/sofia.png',
        content:
            'La flexibilidad de poder estudiar desde casa sin perder la calidad educativa hace que Erelis sea la mejor opción para prepararse.',
        rating: 4.7,
        course: 'Curso de admisión TECNM',
        date: DateTime.now().subtract(Duration(days: 25)),
      ),
    ];
  }
}
