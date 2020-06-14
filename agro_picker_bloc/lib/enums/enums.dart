enum Gender { Male, Female }

enum ProfileType { HomeGardner, Small, Medium, Large }

extension EnumsExtenstion on Object {
  String asString() => toString().split('.').last;
}
