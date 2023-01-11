import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:amplify_habitize/features/day/data/days_repository.dart';
import 'package:amplify_habitize/features/day/ui/days_list/add_day_bottomsheet.dart';
import 'package:amplify_habitize/features/day/ui/days_list/day_card.dart';
import 'package:amplify_habitize/common/utils/colors.dart' as constants;

class DaysListPage extends HookConsumerWidget {
  const DaysListPage({
    super.key,
  });

  void showAddDayDialog(BuildContext context) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (BuildContext context) {
        return AddDayBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final daysListValue = ref.watch(daysListStreamProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Amplify Days Planner',
          ),
          backgroundColor: const Color(constants.primaryColorDark),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddDayDialog(context);
          },
          backgroundColor: const Color(constants.primaryColorDark),
          child: const Icon(Icons.add),
        ),
        body: daysListValue.when(
            data: (days) => days.isEmpty
                ? const Center(
                    child: Text('No Days'),
                  )
                : Column(
                    children: [
                      Flexible(
                        child: GridView.count(
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          padding: const EdgeInsets.all(4),
                          childAspectRatio:
                              (orientation == Orientation.portrait) ? 0.9 : 1.4,
                          children: days.map((dayData) {
                            return DayCard(day: dayData!);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
            error: (e, st) => const Center(
                  child: Text('Error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
