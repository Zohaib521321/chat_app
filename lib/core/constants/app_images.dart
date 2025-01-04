class AppImages {
  //main image function
  static String mainImage(String path, {String extension = "svg"}) {
    return "assets/images/$path.$extension";
  }
  // Static variables

  static String splashScreen = mainImage("splashScreen", extension: "json");

  static String person = mainImage("person");
}
