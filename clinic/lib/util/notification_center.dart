typedef BroadcastCallback = Function(dynamic obj);

class NotificationCenter {
  static final NotificationCenter instance = NotificationCenter._init();

  late Map<String, List<BroadcastCallback>> _map;

  NotificationCenter._init() {
    _map = Map();
  }

  addObserver({
    required String name,
    required BroadcastCallback listener,
  }) {
    var list = _map[name];
    if (list == null) {
      list = [];
      _map[name] = list;
    }
    if (!list.contains(listener)) {
      list.add(listener);
    }
  }

  removeObserver({
    required String name,
    required BroadcastCallback listener,
  }) {
    final list = _map[name];
    if (list != null) {
      if (list.contains(listener)) {
        list.remove(listener);
      }
    }
  }

  pushNotification({
    dynamic object,
    required String name,
  }) {
    final list = _map[name];
    if (list != null) {
      list.forEach(
        (element) {
          element(object);
        },
      );
    }
  }

  broadcastIntent({
    dynamic object,
    required String name,
  }) {
    pushNotification(
      object: object,
      name: name,
    );
  }
}
