///
/// [T] Type method return
///
/// [P] Type param of method
///
abstract class UseCase<T, P> {
  Future<T> call({required P params});
}

class NoParam {}
