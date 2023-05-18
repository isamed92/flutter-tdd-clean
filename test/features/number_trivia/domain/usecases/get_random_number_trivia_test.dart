import 'package:clean_tdd_app/core/usecases/usecase.dart';
import 'package:clean_tdd_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_tdd_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_tdd_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumberTrivia = NumberTrivia(
    number: 1,
    text: 'test',
  );

  test('should get trivia from the repository', () async {
    when(mockNumberTriviaRepository.getRandomTrivia())
        .thenAnswer((_) async => const Right(tNumberTrivia));
    final result = await usecase(const NoParams());
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
