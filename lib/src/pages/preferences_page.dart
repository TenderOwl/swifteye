import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        shadowColor: Colors.transparent,
        leading: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: LineIcon.arrowLeft(),
                splashRadius: 24,
              )
            : const SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: LineIcon.cog(),
            splashRadius: 24,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Text('Available Languages & etc.'),
        ),
      ),
    );
  }
}
