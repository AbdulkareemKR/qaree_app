class BookAPI {
  late String? id;
  late String? title;

  BookAPI(this.id, this.title);

  BookAPI.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }
}
