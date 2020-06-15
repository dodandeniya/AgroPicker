import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class FileuploadEvent extends Equatable {
  const FileuploadEvent();
  @override
  List<Object> get props => [];
}

class StartFileUploading extends FileuploadEvent {
  final String directory;
  final File file;

  const StartFileUploading(this.file, {this.directory});

  @override
  List<Object> get props => [directory];
}
