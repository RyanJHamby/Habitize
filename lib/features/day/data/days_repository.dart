import 'package:amplify_habitize/features/day/services/days_datastore_service.dart';
import 'package:amplify_habitize/models/Day.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final daysRepositoryProvider = Provider<DaysRepository>((ref) {
  DaysDataStoreService daysDataStoreService =
      ref.read(daysDataStoreServiceProvider);
  return DaysRepository(daysDataStoreService);
});

final daysListStreamProvider = StreamProvider.autoDispose<List<Day?>>((ref) {
  final daysRepository = ref.watch(daysRepositoryProvider);
  return daysRepository.getDays();
});

final pastDaysListStreamProvider =
    StreamProvider.autoDispose<List<Day?>>((ref) {
  final daysRepository = ref.watch(daysRepositoryProvider);
  return daysRepository.getPastDays();
});

final dayProvider = StreamProvider.autoDispose.family<Day?, String>((ref, id) {
  final daysRepository = ref.watch(daysRepositoryProvider);
  return daysRepository.get(id);
});

class DaysRepository {
  DaysRepository(this.daysDataStoreService);

  final DaysDataStoreService daysDataStoreService;

  Stream<List<Day>> getDays() {
    return daysDataStoreService.listenToDays();
  }

  Stream<List<Day>> getPastDays() {
    return daysDataStoreService.listenToPastDays();
  }

  Future<void> add(Day day) async {
    await daysDataStoreService.addDay(day);
  }

  Future<void> update(Day updatedDay) async {
    await daysDataStoreService.updateDay(updatedDay);
  }

  Future<void> delete(Day deletedDay) async {
    await daysDataStoreService.deleteDay(deletedDay);
  }

  Stream<Day> get(String id) {
    return daysDataStoreService.getDayStream(id);
  }
}
