import 'package:amplify_habitize/features/day/controller/days_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AddDayBottomSheet extends HookConsumerWidget {
  AddDayBottomSheet({
    super.key,
  });

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();
    final ratingController = useTextEditingController();
    final sleepController = useTextEditingController();
    final consumedCaloriesController = useTextEditingController();
    final workoutCaloriesController = useTextEditingController();

    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.datetime,
              controller: dateController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Start Date"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid date';
                }
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  dateController.text = formattedDate;
                } else {}
              },
            ),
            TextFormField(
              controller: ratingController,
              keyboardType: TextInputType.name,
              validator: (value) {
                const validationError = 'Enter a valid rating';
                if (value == null || value.isEmpty) {
                  return validationError;
                }

                return null;
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText:
                      "On a scale of 1-10, how healthy did you feel today?"),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: sleepController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Hours of Sleep"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid number';
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: consumedCaloriesController,
              autofocus: true,
              autocorrect: false,
              decoration:
                  const InputDecoration(hintText: "Total Calories Consumed"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid number';
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: workoutCaloriesController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: "Total Workout Calories Burned"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid number';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    ref.read(daysListControllerProvider).add(
                          date: dateController.text,
                          rating: double.parse(ratingController.text),
                          sleep: double.parse(sleepController.text),
                          consumedCalories:
                              double.parse(consumedCaloriesController.text),
                          workoutCalories:
                              double.parse(workoutCaloriesController.text),
                        );
                    Navigator.of(context).pop();
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
