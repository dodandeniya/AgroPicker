import 'package:equatable/equatable.dart';

abstract class FileuploadState extends Equatable {
  const FileuploadState();

  @override
  List<Object> get props => [];
}

class FileuploadInitial extends FileuploadState {}

class Fileuploading extends FileuploadState {}

class FileuploadCompleted extends FileuploadState {
  final String dounloadableUrl;
  const FileuploadCompleted(this.dounloadableUrl);

  @override
  List<Object> get props => [dounloadableUrl];
}

class FileuploadFaild extends FileuploadState {}
