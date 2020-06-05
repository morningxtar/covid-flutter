class Alert {
  final String date;
  final String title;
  final String content;

  Alert({
      this.date,
      this.title,
      this.content,
      });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      date: json['date'],
      title: json['title'],
      content: json['content'],
    );
  }
}