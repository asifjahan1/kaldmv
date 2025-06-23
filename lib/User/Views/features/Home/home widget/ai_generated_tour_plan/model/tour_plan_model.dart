// tour_plan_model.dart
class TourPlan {
  String title;
  String region;
  String destination;
  String duration;
  String accommodation;
  List<String> specialConsiderations;
  List<DailySchedule> dailySchedules;

  TourPlan({
    required this.title,
    required this.region,
    required this.destination,
    required this.duration,
    required this.accommodation,
    required this.specialConsiderations,
    required this.dailySchedules,
  });

  factory TourPlan.fromJson(Map<String, dynamic> json) {
    return TourPlan(
      title: json['title'] ?? 'Default Itinerary',
      region: json['region'] ?? '',
      destination: json['destination'] ?? '',
      duration: json['duration'] ?? '',
      accommodation: json['accommodation'] ?? '',
      specialConsiderations: List<String>.from(
        json['specialConsiderations'] ?? [],
      ),
      dailySchedules: (json['dailySchedules'] as List<dynamic>? ?? [])
          .map((item) => DailySchedule.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'region': region,
      'destination': destination,
      'duration': duration,
      'accommodation': accommodation,
      'specialConsiderations': specialConsiderations,
      'dailySchedules': dailySchedules
          .map((schedule) => schedule.toJson())
          .toList(),
    };
  }
}

class DailySchedule {
  String day;
  String description;
  String theme;
  List<ScheduleItem> scheduleItems;

  DailySchedule({
    required this.day,
    required this.description,
    required this.theme,
    required this.scheduleItems,
  });

  factory DailySchedule.fromJson(Map<String, dynamic> json) {
    return DailySchedule(
      day: 'Day ${json['day'] ?? 1}',
      description: json['description'] ?? 'Default Exploration',
      theme: json['theme'] ?? 'Default Theme',
      scheduleItems: (json['scheduleItems'] as List<dynamic>? ?? [])
          .map((item) => ScheduleItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'description': description,
      'theme': theme,
      'scheduleItems': scheduleItems.map((item) => item.toJson()).toList(),
    };
  }
}

class ScheduleItem {
  String time;
  String activity;
  String details;

  ScheduleItem({
    required this.time,
    required this.activity,
    required this.details,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      time: json['time'] ?? '',
      activity: json['title'] ?? json['activity'] ?? '',
      details: json['description'] ?? json['details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'time': time, 'activity': activity, 'details': details};
  }
}
