import 'package:flutter/material.dart';

import '../models/exam_model.dart';
import '../services/event_service.dart';

class EventProvider with ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => [..._events];

  EventProvider() {
    final eventService = EventService();
    _events.addAll(eventService.getEvents());
    notifyListeners();
  }
  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }
}
