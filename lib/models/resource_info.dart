class ResourceInfo {
  String link;
  String name;

  ResourceInfo(link, name) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    this.link = link;
    this.name = name;
  }
}
