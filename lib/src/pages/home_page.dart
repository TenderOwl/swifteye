import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<XFile> files = [];
  bool dragging = false;

  @override
  Widget build(BuildContext context) {
    final boxColor = dragging
        ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
        : Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        shadowColor: Colors.transparent,
        actions: [
          files.isNotEmpty
              ? IconButton(
                  onPressed: () => setState(() => files.clear()),
                  icon: LineIcon.trash(),
                  splashRadius: 24,
                )
              : const SizedBox.shrink(),
          IconButton(
            onPressed: () => context.push('/preferences'),
            icon: LineIcon.cog(),
            splashRadius: 24,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: DropTarget(
        onDragEntered: (details) => setState(() {
          dragging = true;
        }),
        onDragExited: (details) => setState(() {
          dragging = false;
        }),
        onDragDone: (details) {
          setState(() {
            files.clear();
            files.add(details.files.single);
            dragging = false;
          });
        },
        child: Container(
          color: boxColor,
          child: Center(
            child: files.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LineIcon.imageAlt(),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Drop an image to extract the text',
                          // style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(files[index].name),
                        onTap: () => context.push('/extracted'),
                      );
                    },
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onOpenFile,
        tooltip: 'Open images',
        child: LineIcon.imageFile(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future onOpenFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (result != null) {
      final filesToImport = result.files.map((e) => XFile(e.path!)).toList();

      setState(() {
        files.addAll(filesToImport);
      });
    }
  }
}
