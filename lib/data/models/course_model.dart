class CourseModel {
  final String id;
  final String title;
  final String categoryId;
  final String instructorName;
  final String instructorAvatar;
  final String description;
  final bool isLive;
  final bool isRecurrent;
  final bool isPopular;
  final String thumbnailUrl;
  final double rating;
  final int studentsCount;
  final double price;
  final String duration;

  CourseModel({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.instructorName,
    required this.instructorAvatar,
    required this.description,
    this.isLive = false,
    this.isRecurrent = false,
    this.isPopular = false,
    this.thumbnailUrl = '',
    this.rating = 0.0,
    this.studentsCount = 0,
    this.price = 0.0,
    this.duration = '',
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      categoryId: json['categoryId'] ?? '',
      instructorName: json['instructorName'] ?? '',
      instructorAvatar: json['instructorAvatar'] ?? '',
      description: json['description'] ?? '',
      isLive: json['isLive'] ?? false,
      isRecurrent: json['isRecurrent'] ?? false,
      isPopular: json['isPopular'] ?? false,
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      studentsCount: json['studentsCount'] ?? 0,
      price: (json['price'] ?? 0.0).toDouble(),
      duration: json['duration'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'categoryId': categoryId,
      'instructorName': instructorName,
      'instructorAvatar': instructorAvatar,
      'description': description,
      'isLive': isLive,
      'isRecurrent': isRecurrent,
      'isPopular': isPopular,
      'thumbnailUrl': thumbnailUrl,
      'rating': rating,
      'studentsCount': studentsCount,
      'price': price,
      'duration': duration,
    };
  }

  // Proporcionar datos estáticos para desarrollo mientras no haya conexión con Firebase
  static List<CourseModel> getMockCourses() {
    return [
      CourseModel(
        id: '1',
        title: 'Curso de admisión IPN',
        categoryId: 'ipn',
        instructorName: 'Carlos Ramírez',
        instructorAvatar: 'assets/images/instructors/carlos.png',
        description: 'Preparación completa para el examen de admisión al IPN',
        isRecurrent: true,
        isPopular: true,
        rating: 4.8,
        studentsCount: 1250,
      ),
      CourseModel(
        id: '2',
        title: 'Curso de admisión UNAM',
        categoryId: 'unam',
        instructorName: 'Laura Sánchez',
        instructorAvatar: 'assets/images/instructors/laura.png',
        description: 'Preparación integral para el examen de ingreso a la UNAM',
        isLive: true,
        isPopular: true,
        rating: 4.9,
        studentsCount: 1840,
      ),
      CourseModel(
        id: '3',
        title: 'Curso de admisión UAM',
        categoryId: 'uam',
        instructorName: 'Roberto Méndez',
        instructorAvatar: 'assets/images/instructors/roberto.png',
        description: 'Todo lo necesario para aprobar el examen de la UAM',
        isLive: true,
        isPopular: true,
        rating: 4.7,
        studentsCount: 950,
      ),
      CourseModel(
        id: '4',
        title: 'Curso de admisión COMIPEMS',
        categoryId: 'comipems',
        instructorName: 'Ana López',
        instructorAvatar: 'assets/images/instructors/ana.png',
        description: 'Preparación completa para el examen COMIPEMS',
        isRecurrent: true,
        isPopular: true,
        rating: 4.8,
        studentsCount: 2100,
      ),
      CourseModel(
        id: '5',
        title: 'Curso de admisión TECNM',
        categoryId: 'tecnm',
        instructorName: 'Miguel Torres',
        instructorAvatar: 'assets/images/instructors/miguel.png',
        description: 'Estrategias y contenido para ingresar al TECNM',
        isLive: true,
        isPopular: true,
        rating: 4.6,
        studentsCount: 780,
      ),
      CourseModel(
        id: '6',
        title: 'Curso de admisión CONAMAT',
        categoryId: 'conamat',
        instructorName: 'Diana Flores',
        instructorAvatar: 'assets/images/instructors/diana.png',
        description: 'Preparación especializada para el examen CONAMAT',
        isRecurrent: true,
        isPopular: true,
        rating: 4.7,
        studentsCount: 680,
      ),
    ];
  }
}
