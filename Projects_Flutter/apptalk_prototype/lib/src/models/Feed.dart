import 'package:apptalk_prototype/src/models/Content.dart';

class Feed {
  String imageRedactor;
  String nameRedactor;
  String datePost;
  String desc;
  List<Content> content;

  Feed(this.imageRedactor, this.nameRedactor, this.datePost, this.desc,
      this.content);

}
