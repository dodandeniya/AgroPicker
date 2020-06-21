import 'dart:async';
import 'dart:io';

import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilePick extends StatefulWidget {
  final FilePickController filePickController;

  FilePick({this.filePickController});

  @override
  State<StatefulWidget> createState() {
    return _FilePick(filePickController: filePickController);
  }
}

class _FilePick extends State<FilePick> {
  bool _loadingPath = false;
  File _selectedFile;
  String _fileName;
  String _extension;
  final FilePickController filePickController;
  final StreamController<File> streamController =
      StreamController<File>.broadcast();

  _FilePick({this.filePickController}) {
    filePickController.openFileExplorer = _openFileExplorer;
    filePickController.clearFile = _clear;
  }

  @override
  void didUpdateWidget(FilePick oldWidget) {
    super.didUpdateWidget(oldWidget);
    filePickController.openFileExplorer = _openFileExplorer;
    filePickController.clearFile = _clear;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => _loadingPath
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _selectedFile != null
              ? Container(
                  child: ListTile(
                    leading: Icon(Icons.insert_drive_file),
                    trailing: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _selectedFile = null;
                          });
                          streamController.sink.add(_selectedFile);
                        }),
                    title: Text(_fileName),
                    subtitle: Text(_selectedFile.path),
                  ),
                )
              : Container(
                  child: Text('No File has been selected'),
                ),
    );
  }

  Future<File> _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _selectedFile = await FilePicker.getFile(
          type: FileType.any,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return null;
    setState(() {
      _loadingPath = false;
      _fileName =
          _selectedFile != null ? _selectedFile.path.split('/').last : '...';
    });
    return _selectedFile;
  }

  Stream<File> _clear() {
    return streamController.stream;
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
