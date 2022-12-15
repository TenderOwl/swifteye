import 'package:go_router/go_router.dart';
import 'package:swifteye/src/pages/extracted_page.dart';
import 'package:swifteye/src/pages/home_page.dart';
import 'package:swifteye/src/pages/preferences_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(title: 'Swifteye'),
  ),
  GoRoute(
    path: '/extracted',
    builder: (context, state) => const ExtractedPage(),
  ),
  GoRoute(
    path: '/preferences',
    builder: (context, state) => const PreferencesPage(),
  ),
]);
