enum Gender { Male, Female }

enum ProfileType { HomeGardner, Small, Medium, Large }

enum AgroProfileState { Pending, Approved, Rejected }

extension EnumsExtenstion on Object {
  String asString() => toString().split('.').last;
}
