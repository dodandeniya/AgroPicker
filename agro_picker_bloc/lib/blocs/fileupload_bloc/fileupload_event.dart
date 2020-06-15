import 'dart:io';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:equatable/equatable.dart';

abstract class FileuploadEvent extends Equatable {
  const FileuploadEvent();
  @override
  List<Object> get props => [];
}

class StartFileUploading extends FileuploadEvent {
  final String directory;
  final File file;
  final FileUploadType fileUploadType;

  const StartFileUploading(this.file, this.fileUploadType, {this.directory});

  @override
  List<Object> get props => [directory];
}
