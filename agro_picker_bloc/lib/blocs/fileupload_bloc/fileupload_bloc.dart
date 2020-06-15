import 'dart:io';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:path/path.dart' as Path;

class FileuploadBloc extends Bloc<FileuploadEvent, FileuploadState> {
  final FirebaseAppSingleton firebaseAppSingleton =
      FirebaseAppSingleton.getInstance();

  @override
  FileuploadState get initialState => FileuploadInitial();

  @override
  Stream<FileuploadState> mapEventToState(
    FileuploadEvent event,
  ) async* {
    if (event is StartFileUploading) {
      yield* _mapStartFileUploadingToState(event);
    }
  }

  Stream<FileuploadState> _mapStartFileUploadingToState(
      StartFileUploading event) async* {
    StorageReference storageReference;
    final String userId =
        (await firebaseAppSingleton.firebaseAuth.currentUser()).uid;

    if (event.file != null) {
      final File pickedFile = event.file;

      String newPath = Path.join(Path.dirname(pickedFile.path),
          DateTime.now().millisecondsSinceEpoch.toString());

      pickedFile.renameSync(newPath);

      storageReference = (event.directory != null || event.directory == '')
          ? storageReference = firebaseAppSingleton.fireStorage.ref().child(
              '${event.directory}/$userId/${Path.basename(pickedFile.path)}}')
          : firebaseAppSingleton.fireStorage
              .ref()
              .child('$userId/${Path.basename(pickedFile.path)}}');

      try {
        StorageUploadTask uploadTask = storageReference.putFile(pickedFile);
        await uploadTask.onComplete;
        print('File Uploaded');
        String url = (await storageReference.getDownloadURL());
        yield FileuploadCompleted(url);
      } catch (e) {
        yield FileuploadFaild();
      }
    } else {
      yield FileuploadFaild();
    }
  }
}
