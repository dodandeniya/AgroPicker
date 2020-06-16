enum Gender {
  Male,
  Female,
}

enum ProfileType {
  HomeGardner,
  Small,
  Medium,
  Large,
}

enum AgroProfileState {
  Pending,
  Approved,
  Rejected,
}

enum FileUploadType {
  ProfilePicture,
  BusinessDocument,
}

enum OrderStatuses {
  New_Order,
  Confirmed,
  Preparing,
  Packaging,
  Collection,
  On_Route,
  Payment,
  Completed,
}

enum StockAvailabilty {
  Available,
  Sold_Out,
  Not_Available,
}

extension EnumsExtenstion on Object {
  String asString() => toString().split('.').last;

  String splitString() {
    var val = this.asString().split('_');
    String fullString = '';
    val.forEach((element) {
      fullString += '$element ';
    });
    return fullString;
  }
}
