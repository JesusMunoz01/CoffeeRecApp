import 'package:homebrew_dripper/models/resource_info.dart';

ResourceInfo coffeeResource() {
  ResourceInfo resource = ResourceInfo("Link A", "Coffee");
  return resource;
}

ResourceInfo grindersResource() {
  ResourceInfo resource = ResourceInfo("Link B", "Grinders");
  return resource;
}

ResourceInfo kettlesResource() {
  ResourceInfo resource = ResourceInfo("Link C", "Kettles");
  return resource;
}

ResourceInfo homebrewDripperResource() {
  ResourceInfo resource = ResourceInfo("Link D", "Homebrew Dripper");
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
