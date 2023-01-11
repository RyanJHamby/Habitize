import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:amplify_habitize/common/services/storage_service.dart';

import 'package:amplify_habitize/models/Day.dart';
import 'package:amplify_habitize/features/day/data/days_repository.dart';

final dayControllerProvider = Provider<DayController>((ref) {
  return DayController(ref);
});

class DayController {
  DayController(this.ref);
  final Ref ref;

  // Future<void> uploadFile(File file, Trip trip) async {
  //   final fileKey = await ref.read(storageServiceProvider).uploadFile(file);
  //   if (fileKey != null) {
  //     final imageUrl =
  //         await ref.read(storageServiceProvider).getImageUrl(fileKey);
  //     final updatedTrip =
  //         trip.copyWith(tripImageKey: fileKey, tripImageUrl: imageUrl);
  //     await ref.read(tripsRepositoryProvider).update(updatedTrip);
  //     ref.read(storageServiceProvider).resetUploadProgress();
  //   }
  // }

  // ValueNotifier<double> uploadProgress() {
  //   return ref.read(storageServiceProvider).getUploadProgress();
  // }

  Future<void> edit(Day updatedDay) async {
    final daysRepository = ref.read(daysRepositoryProvider);
    await daysRepository.update(updatedDay);
  }

  Future<void> delete(Day deletedDay) async {
    final daysRepository = ref.read(daysRepositoryProvider);
    await daysRepository.delete(deletedDay);
  }
}
