import 'package:equatable/equatable.dart';

class Article  extends Equatable {
  final String title;
  final String text;
  final String image;

  const Article({
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  List<Object?> get props => [title, text, image];
}
