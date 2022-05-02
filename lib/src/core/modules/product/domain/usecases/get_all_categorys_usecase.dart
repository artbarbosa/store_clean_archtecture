import '../repositories/product_repository.dart';
import '../value_objects/category.dart';

abstract class IGetAllCategorysUseCase {
  Future<List<Category>> call();
}

class GetAllCategorysUseCaseImp implements IGetAllCategorysUseCase {
  final IProductRepository _repository;

  GetAllCategorysUseCaseImp(this._repository);

  @override
  Future<List<Category>> call() {
    return _repository.getAllCategorys();
  }
}
