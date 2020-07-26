class NotificationManager {
  List<String> manager = [];
  String message;

  void addMessage(String msg) {
    manager.add(msg);
  }

  List<String> get getMessage {
    return manager;
  }

  void delMessage(int id) {
    manager.removeAt(id);
  }
}

final NotificationManager notify = NotificationManager();
