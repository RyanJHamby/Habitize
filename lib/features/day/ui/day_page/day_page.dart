import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:amplify_habitize/common/navigation/router/routes.dart';
import 'package:amplify_habitize/features/day/data/days_repository.dart';
import 'package:amplify_habitize/common/utils/colors.dart' as constants;
import 'package:amplify_habitize/features/day/ui/day_page/selected_day_card.dart';

class DayPage extends StatelessWidget {
  const DayPage({
    required this.dayId,
    super.key,
  });
  final String dayId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Days Planner',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final dayValue = ref.watch(dayProvider(dayId));
          return dayValue.when(
            data: (day) => day == null
                ? const Center(
                    child: Text('Day Not Found'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      SelectedDayCard(day: day),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        height: 20,
                        thickness: 5,
                        indent: 20,
                        endIndent: 20,
                      ),
                      const Text(
                        "Your Activites",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
            error: (e, st) => const Center(
              child: Text('Error'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
