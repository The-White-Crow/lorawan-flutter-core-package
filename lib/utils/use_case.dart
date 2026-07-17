abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Type call(Params params);
}
