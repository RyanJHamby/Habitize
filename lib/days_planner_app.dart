import 'package:amplify_habitize/features/day/ui/days_list/days_list_page.dart';
import 'package:amplify_habitize/features/day/ui/edit_day_page/edit_day_page.dart';
import 'package:amplify_habitize/features/day/ui/day_page/day_page.dart';
import 'package:amplify_habitize/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_habitize/common/navigation/router/routes.dart';
import 'package:amplify_habitize/common/utils/colors.dart' as constants;

class DaysPlannerApp extends StatelessWidget {
  const DaysPlannerApp({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => isAmplifySuccessfullyConfigured
              ? const DaysListPage()
              : const Scaffold(
                  body: Center(
                    child: Text(
                      'Tried to reconfigure Amplify; '
                      'this can occur when your app restarts on Android.',
                    ),
                  ),
                ),
        ),
        GoRoute(
          path: '/day/:id',
          name: AppRoute.day.name,
          builder: (context, state) {
            final dayId = state.params['id']!;
            return DayPage(dayId: dayId);
          },
        ),
        GoRoute(
          path: '/editday/:id',
          name: AppRoute.editday.name,
          builder: (context, state) {
            return EditDayPage(
              day: state.extra! as Day,
            );
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );

    return Authenticator(
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        builder: Authenticator.builder(),
        theme: ThemeData(
          primarySwatch: constants.primaryColor,
          backgroundColor: const Color(0xff82CFEA),
        ),
      ),
    );
  }
}
