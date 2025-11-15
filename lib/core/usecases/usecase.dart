abstract class UseCase<Type_, Params> {
  Future<Type_> call({Params params});
}
