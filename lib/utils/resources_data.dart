import 'package:homebrew_dripper/models/resource_info.dart';

ResourceInfo coffeeResource() {
  ResourceInfo resource = ResourceInfo(
      "https://www.homegrounds.co/best-coffee-beans-bucket-list/", "Coffee");
  return resource;
}

ResourceInfo grindersResource() {
  ResourceInfo resource = ResourceInfo(
      "https://www.homegrounds.co/best-hand-coffee-grinders/", "Grinders");
  return resource;
}

ResourceInfo kettlesResource() {
  ResourceInfo resource = ResourceInfo(
      "https://www.homegrounds.co/5-best-pour-coffee-kettles-gooseneck-kettles-reviewed/",
      "Kettles");
  return resource;
}

ResourceInfo homebrewDripperResource() {
  ResourceInfo resource = ResourceInfo(
      "https://www.homegrounds.co/best-drip-coffee-maker-reviews/",
      "Homebrew Dripper");
  return resource;
}

List<ResourceInfo> getAllResources() {
  return [
    coffeeResource(),
    grindersResource(),
    kettlesResource(),
    homebrewDripperResource()
  ];
}

class ResourceData {
  static List<ResourceInfo> loadResource() {
    return getAllResources();
  }
}
