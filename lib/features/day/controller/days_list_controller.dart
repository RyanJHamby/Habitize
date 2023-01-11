import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_habitize/features/day/data/days_repository.dart';
import 'package:amplify_habitize/models/ModelProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final daysListControllerProvider = Provider<DaysListController>((ref) {
  return DaysListController(ref);
});

class DaysListController {
  DaysListController(this.ref);
  final Ref ref;

  Future<void> add({
    required String date,
    required double rating,
    required double sleep,
    required double consumedCalories,
    required double workoutCalories,
  }) async {
    Day day = Day(
      date: TemporalDate(DateTime.parse(date)),
      rating: rating,
      sleep: sleep,
      consumedCalories: consumedCalories,
      workoutCalories: workoutCalories,
    );

    final daysRepository = ref.read(daysRepositoryProvider);

    await daysRepository.add(day);
  }
}
