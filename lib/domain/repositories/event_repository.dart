import '../entities/event_entity.dart';

abstract class EventRepository {
  /// Obtiene los próximos eventos
  Future<List<EventEntity>> getUpcomingEvents();

  /// Obtiene un evento específico por su ID
  Future<EventEntity?> getEventById(String eventId);

  /// Registra al usuario en un evento
  Future<void> registerUserForEvent(String eventId);

  /// Obtiene los eventos a los que el usuario está registrado
  Future<List<EventEntity>> getUserRegisteredEvents();
}
