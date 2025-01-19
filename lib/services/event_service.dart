import '../events.dart';
import '../models/exam_model.dart';

class EventService {
  List<Event> getEvents() {
    return eventsRaw.map((json) => Event.fromJson(json)).toList();
  }
}
