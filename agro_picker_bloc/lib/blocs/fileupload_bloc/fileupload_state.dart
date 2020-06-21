import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:equatable/equatable.dart';

abstract class FileuploadState extends Equatable {
  const FileuploadState();

  @override
  List<Object> get props => [];
}

class FileuploadInitial extends FileuploadState {}

class Fileuploading extends FileuploadState {}

class FileuploadCompleted extends FileuploadState {
  final String downloadableUrl;
  final FileUploadType fileUploadType;
  const FileuploadCompleted(this.downloadableUrl, this.fileUploadType);

  @override
  List<Object> get props => [downloadableUrl, fileUploadType];
}

class FileuploadFailed extends FileuploadState {}
