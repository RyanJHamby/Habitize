import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_habitize/models/Day.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final daysDataStoreServiceProvider = Provider<DaysDataStoreService>((ref) {
  final service = DaysDataStoreService();
  return service;
});

class DaysDataStoreService {
  DaysDataStoreService();

  Stream<List<Day>> listenToDays() {
    print(Amplify.DataStore.observeQuery(
      Day.classType,
      sortBy: [Day.DATE.ascending()],
    ).map((event) => event.items.toList()));
    return Amplify.DataStore.observeQuery(
      Day.classType,
      sortBy: [Day.DATE.ascending()],
    )
        .map((event) => event.items
            // .where(
            //     (element) => element.date.getDateTime().isAfter(DateTime.now()))
            .toList())
        .handleError(
      (error) {
        debugPrint('listenToDays: A Stream error happened');
      },
    );
  }

  Stream<List<Day>> listenToPastDays() {
    return Amplify.DataStore.observeQuery(
      Day.classType,
      sortBy: [Day.DATE.ascending()],
    )
        .map((event) => event.items
            .where((element) =>
                element.date.getDateTime().isBefore(DateTime.now()))
            .toList())
        .handleError(
      (error) {
        debugPrint('listenToDays: A Stream error happened');
      },
    );
  }

  Stream<Day> getDayStream(String id) {
    final dayStream =
        Amplify.DataStore.observeQuery(Day.classType, where: Day.ID.eq(id))
            .map((event) => event.items.toList().single);

    return dayStream;
  }

  Future<void> addDay(Day day) async {
    try {
      await Amplify.DataStore.save(day);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> deleteDay(Day day) async {
    try {
      await Amplify.DataStore.delete(day);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> updateDay(Day updatedDay) async {
    try {
      final daysWithId = await Amplify.DataStore.query(
        Day.classType,
        where: Day.ID.eq(updatedDay.id),
      );

      final oldDay = daysWithId.first;
      final newDay = oldDay.copyWith(
        id: oldDay.id,
        date: updatedDay.date,
        dayImageUrl: updatedDay.dayImageUrl,
        dayImageKey: updatedDay.dayImageKey,
        sleep: updatedDay.sleep,
        rating: updatedDay.rating,
        consumedCalories: updatedDay.consumedCalories,
        workoutCalories: updatedDay.workoutCalories,
      );

      await Amplify.DataStore.save(newDay);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
