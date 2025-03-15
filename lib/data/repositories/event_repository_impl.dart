import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<EventEntity>> getUpcomingEvents() async {
    try {
      final now = DateTime.now();

      final eventsSnapshot = await _firestore
          .collection('events')
          .where('date', isGreaterThanOrEqualTo: now.toIso8601String())
          .orderBy('date')
          .limit(5)
          .get();

      return eventsSnapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return EventEntity.fromJson(data);
      }).toList();
    } catch (e) {
      print('Error al obtener eventos próximos: $e');
      return [];
    }
  }

  @override
  Future<EventEntity?> getEventById(String eventId) async {
    try {
      final eventDoc = await _firestore.collection('events').doc(eventId).get();

      if (!eventDoc.exists) return null;

      final data = eventDoc.data() as Map<String, dynamic>;
      data['id'] = eventDoc.id;

      return EventEntity.fromJson(data);
    } catch (e) {
      print('Error al obtener evento por ID: $e');
      return null;
    }
  }

  @override
  Future<void> registerUserForEvent(String eventId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return;

      // Registrar al usuario en el evento
      await _firestore
          .collection('events')
          .doc(eventId)
          .collection('attendees')
          .doc(currentUser.uid)
          .set({
        'userId': currentUser.uid,
        'registerDate': DateTime.now().toIso8601String(),
      });

      // Añadir el evento a la lista de eventos del usuario
      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('events')
          .doc(eventId)
          .set({
        'eventId': eventId,
        'registerDate': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error al registrar usuario en evento: $e');
      rethrow;
    }
  }

  @override
  Future<List<EventEntity>> getUserRegisteredEvents() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return [];

      // Obtener los IDs de los eventos registrados por el usuario
      final userEventsSnapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('events')
          .get();

      final eventIds = userEventsSnapshot.docs.map((doc) => doc.id).toList();

      if (eventIds.isEmpty) return [];

      // Obtener los detalles de cada evento
      final events = await Future.wait(
        eventIds.map((eventId) async {
          final eventDoc =
              await _firestore.collection('events').doc(eventId).get();

          if (!eventDoc.exists) return null;

          final data = eventDoc.data() as Map<String, dynamic>;
          data['id'] = eventDoc.id;

          return EventEntity.fromJson(data);
        }),
      );

      // Filtrar nulls y devolver la lista
      return events.whereType<EventEntity>().toList();
    } catch (e) {
      print('Error al obtener eventos del usuario: $e');
      return [];
    }
  }
}
