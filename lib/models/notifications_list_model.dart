
class NotificationListModel {
  final int status;
  final Notifications notifications;

  NotificationListModel({
    required this.status,
    required this.notifications,
  });

  factory NotificationListModel.fromJson(Map<String, dynamic> json) => NotificationListModel(
    status: json["status"],
    notifications: Notifications.fromJson(json["notifications"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "notifications": notifications.toJson(),
  };
}

class Notifications {
  final N1 n1;
  final N1 n2;

  Notifications({
    required this.n1,
    required this.n2,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    n1: N1.fromJson(json["n_1"]),
    n2: N1.fromJson(json["n_2"]),
  );

  Map<String, dynamic> toJson() => {
    "n_1": n1.toJson(),
    "n_2": n2.toJson(),
  };
}

class N1 {
  final String message;
  final int triggeredAt;
  final String link;
  final bool newTab;

  N1({
    required this.message,
    required this.triggeredAt,
    required this.link,
    required this.newTab,
  });

  factory N1.fromJson(Map<String, dynamic> json) => N1(
    message: json["message"],
    triggeredAt: json["triggered_at"],
    link: json["link"],
    newTab: json["new_tab"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "triggered_at": triggeredAt,
    "link": link,
    "new_tab": newTab,
  };
}
