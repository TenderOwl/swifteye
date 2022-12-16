import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:tenderowl_ocr/tenderowl_ocr.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:path/path.dart' show basenameWithoutExtension;

class ExtractedPage extends StatefulWidget {
  const ExtractedPage({super.key, this.path});

  final String? path;

  @override
  State<ExtractedPage> createState() => _ExtractedPageState();
}

class _ExtractedPageState extends State<ExtractedPage> {
  List<String> extractedLines = [];
  String title = "Extract";

  @override
  void initState() {
    super.initState();

    if (widget.path == null) return;

    title = basenameWithoutExtension(widget.path!);
    extractTextFromImage(widget.path!);
  }

  Future extractTextFromImage(String path) async {
    final lines = await TenderowlOcr().extractTextFromImage(path);

    if (lines != null) {
      setState(() {
        extractedLines = lines;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
            onPressed: () => context.push('/preferences'),
            icon: LineIcon.cog(),
            splashRadius: 24,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          extractedLines.isNotEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          extractedLines.join('\n'),
                          style: GoogleFonts.ibmPlexMono(),
                        ),
                      ),
                    ),
                  ),
                )
              : const Flexible(
                  child: Center(
                    child: Text('Extracted text'),
                  ),
                ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onCopy,
                  splashRadius: 24,
                  icon: LineIcon.copyAlt(),
                ),
                IconButton(
                  onPressed: () {},
                  splashRadius: 24,
                  icon: LineIcon.trash(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future onCopy() async {
    if (await FlutterClipboard.controlC(extractedLines.join('\n'))) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied!'),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }
}
