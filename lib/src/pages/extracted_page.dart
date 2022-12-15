import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';

class ExtractedPage extends StatefulWidget {
  const ExtractedPage({super.key});

  @override
  State<ExtractedPage> createState() => _ExtractedPageState();
}

class _ExtractedPageState extends State<ExtractedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extracted'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => context.push('/preferences'),
            icon: LineIcon.cog(),
            splashRadius: 24,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Flexible(
              child: Center(
                child: Text('Extracted text'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  splashRadius: 24,
                  icon: LineIcon.copyAlt(),
                ),
                IconButton(
                  onPressed: () {},
                  splashRadius: 24,
                  icon: LineIcon.trash(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
