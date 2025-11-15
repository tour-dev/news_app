abstract class Usecase<Type_, Params> {
  Future<Type_> call({Params params});
}
