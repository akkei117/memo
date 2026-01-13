class Model {
  String title;
  String body;

  Model({required this.body , required this.title});

  void changeContent(String title , String body){
    this.title = title;
    this.body = body;
  }
}