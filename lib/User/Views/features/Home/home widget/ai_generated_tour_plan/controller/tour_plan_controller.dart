/*
// tour_plan_controller.dart
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/model/tour_plan_model.dart';

class TourPlanController extends GetxController {
  final Rx<TourPlan> tourPlan = TourPlan(
    title: '5 Day Luxury Jeddah Itinerary',
    destination: 'Middle East : Jeddah, Saudi Arabia',
    duration: '5 days',
    accommodation: 'The Ritz-Carlton, Jeddah',
    specialConsiderations: ['Wheelchair accessibility and vegetarian options'],
    dailySchedules: [
      DailySchedule(
        day: 'Day 1',
        theme: 'Arrival & Coastal Relaxation',
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),
      // Placeholder for dynamic days (Day 2 to Day 4)
      DailySchedule(
        day: 'Day 2',
        theme: 'Arrival & Coastal Relaxation',
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),
      DailySchedule(
        day: 'Day 3',
        theme: 'Arrival & Coastal Relaxation',
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),
      DailySchedule(
        day: 'Day 4',
        theme: 'Arrival & Coastal Relaxation',
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),
      // Day 5 (hardcoded as per your request)
      DailySchedule(
        day: 'Day 5',
        theme: 'Arrival & Coastal Relaxation',
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),
    ],
  ).obs;

  void updateDailySchedule(
    String day,
    String theme,
    List<ScheduleItem> scheduleItems,
  ) {
    final index = tourPlan.value.dailySchedules.indexWhere(
      (ds) => ds.day == day,
    );
    if (index != -1) {
      tourPlan.update((val) {
        val!.dailySchedules[index] = DailySchedule(
          day: day,
          theme: theme,
          scheduleItems: scheduleItems,
        );
      });
    }
  }

  void addDailySchedule(DailySchedule schedule) {
    tourPlan.update((val) {
      val!.dailySchedules.add(schedule);
    });
  }
}
*/

// tour_plan_controller.dart
import 'dart:developer';

import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Home/home%20widget/ai_generated_tour_plan/model/tour_plan_model.dart';

class TourPlanController extends GetxController {
  final Rx<TourPlan> tourPlan = TourPlan(
    title: '5 Day Luxury Default Itinerary',
    region: 'Middle East',
    destination: 'Default City, Unknown',
    duration: '5 days',
    accommodation: 'The Ritz-Carlton, Jeddah',
    specialConsiderations: ['Default considerations'],
    dailySchedules: [
      DailySchedule(
        day: 'Arrival & Coastal Relaxation',
        description: 'Arrival & Coastal Relaxation',
        theme: "Settling in and enjoying Jeddah's waterfront",
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Airport Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),

      DailySchedule(
        day: 'Arrival & Coastal Relaxation',
        description: 'Arrival & Coastal Relaxation',
        theme: "Settling in and enjoying Jeddah's waterfront",
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Airport Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),

      DailySchedule(
        day: 'Arrival & Coastal Relaxation',
        description: 'Arrival & Coastal Relaxation',
        theme: "Settling in and enjoying Jeddah's waterfront",
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Airport Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),

      DailySchedule(
        day: 'Arrival & Coastal Relaxation',
        description: 'Arrival & Coastal Relaxation',
        theme: "Settling in and enjoying Jeddah's waterfront",
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Airport Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),

      DailySchedule(
        day: 'Arrival & Coastal Relaxation',
        description: 'Arrival & Coastal Relaxation',
        theme: "Settling in and enjoying Jeddah's waterfront",
        scheduleItems: [
          ScheduleItem(
            time: '14:00',
            activity: 'Airport Arrival',
            details:
                'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)',
          ),
          ScheduleItem(
            time: '14:30-15:30',
            activity: 'Hotel Check-in',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '16:00-18:00',
            activity: 'Jeddah Corniche',
            details:
                'The Ritz-Carlton, Jeddah\nConfirm accessibility and meal options',
          ),
          ScheduleItem(
            time: '20:30-22:30',
            activity: 'Dinner at Byblos',
            details: 'Lebanese cuisine with vegetarian mezze options',
          ),
        ],
      ),
    ],
  ).obs;

  void generateDynamicPlan(Map<String, String>? tourPlanData) {
    if (tourPlanData == null) {
      // Log or handle the null case if needed
      return;
    }

    // Safely parse duration to determine number of days
    final String durationStr = tourPlanData['duration']?.trim() ?? '5 days';
    final int days = _parseDaysFromDuration(durationStr);
    if (days <= 0) {
      // Fallback to default 5 days if parsing fails
      log('Invalid duration format, defaulting to 5 days: $durationStr');
    }

    // Extract and handle other fields with fallbacks
    final String city = tourPlanData['city']?.trim() ?? 'Default City';
    final String country = tourPlanData['country']?.trim() ?? 'Unknown';
    // final String date = tourPlanData['date']?.trim() ?? '2025-06-15';
    final String specialReq = tourPlanData['specialRequirements']?.trim() ?? '';

    // Generate dynamic daily schedules
    final List<DailySchedule> schedules = [];
    for (int i = 1; i <= days; i++) {
      schedules.add(
        DailySchedule(
          day: 'Day $i',
          description: 'Arrival & Coastal Relaxation',
          theme: i == 1
              ? "Settling in and enjoying Jeddah's waterfront"
              : i == days
              ? 'Departure & Reflection'
              : 'Day $i Activities',
          scheduleItems: [
            ScheduleItem(
              time: i == 1
                  ? '14:00'
                  : i == days
                  ? 'Time: 16:00-18:00'
                  : 'Time: 14:00-14:30',
              activity: i == 1
                  ? 'Airport Arrival'
                  : i == days
                  ? 'Departure'
                  : 'Activity $i',
              details: i == 1
                  ? 'VIP Meet & Greet at King Abdulaziz International Airport\nPrivate car transfer to hotel (30 min)'
                  // $date
                  : i == days
                  ? 'Check-out and transfer to airport'
                  : 'Explore $city landmarks',
            ),
          ],
        ),
      );
    }

    // Update the tour plan reactively
    tourPlan.update((val) {
      if (val == null) return; // Safety check
      val.title = '$durationStr Luxury $city Itinerary';
      val.destination = '$city, $country';
      val.duration = durationStr;
      val.accommodation = 'The Ritz-Carlton, Jeddah';
      val.specialConsiderations = specialReq.isNotEmpty
          ? [specialReq]
          : ['Default considerations'];
      val.dailySchedules = schedules;
    });
  }

  // Helper method to parse days from duration string (e.g., "5 days", "3 days")
  int _parseDaysFromDuration(String duration) {
    final RegExp regExp = RegExp(r'(\d+)\s*days?');
    final Match? match = regExp.firstMatch(duration);
    if (match != null && match.groupCount >= 1) {
      return int.tryParse(match.group(1) ?? '5') ?? 5;
    }
    return 5; // Default to 5 days if parsing fails
  }
}
