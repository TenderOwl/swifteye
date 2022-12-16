import 'package:go_router/go_router.dart';
import 'package:swifteye/src/pages/extracted_page.dart';
import 'package:swifteye/src/pages/home_page.dart';
import 'package:swifteye/src/pages/preferences_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const HomePage(title: 'Swifteye'),
  ),
  GoRoute(
    path: '/extract',
    name: 'extract',
    builder: (context, state) => ExtractedPage(path: state.queryParams['path']),
  ),
  GoRoute(
    path: '/preferences',
    name: 'preferences',
    builder: (context, state) => const PreferencesPage(),
  ),
]);
