library more.ordering.explicit;

import 'package:more/iterable.dart';
import 'package:more/ordering.dart';

class ExplicitOrdering<T> extends Ordering<T> {
  final Map<T, int> ranking;

  factory ExplicitOrdering(Iterable<T> iterable) {
    final ranking = <T, int>{};
    for (var element in indexed(iterable)) {
      ranking[element.value] = element.index;
    }
    return ExplicitOrdering<T>._(ranking);
  }

  const ExplicitOrdering._(this.ranking);

  @override
  int compare(T a, T b) => rank(a) - rank(b);

  int rank(T element) {
    final rank = ranking[element];
    if (rank == null) {
      throw StateError('Unable to compare $element with $this');
    }
    return rank;
  }
}
