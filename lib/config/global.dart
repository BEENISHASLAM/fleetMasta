class Global {
  // Private constructor
  Global._internal();

  // The one and only instance of this class
  static final Global _instance = Global._internal();

  // Factory constructor to return the same instance every time
  factory Global() {
    return _instance;
  }

  // Your global variables
  var isUpload;
  var checkMedicalHistory;
  var  mandatory1 = false;
  var  mandatory2 = false;
  var  mandatory3 = false;
  List<String> fileUploadValue = [];
}
