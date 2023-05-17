import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;
  final bool exists;

  const NumberTrivia(
      {required this.text, required this.number, this.exists = true});

  @override
  List<Object?> get props => [text, number];
}
