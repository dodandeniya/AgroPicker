enum Gender { Male, Female }

enum ProfileType { HomeGardner, Small, Medium, Large }

enum FileUploadType { ProfilePicture, BusinessDocument }

extension EnumsExtenstion on Object {
  String asString() => toString().split('.').last;
}
