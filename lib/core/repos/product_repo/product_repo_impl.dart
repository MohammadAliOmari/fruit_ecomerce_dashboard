import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/core/services/data_base_services.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruit_dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct(AddProductEntity product) async {
    try {
      await dataBaseService.addData(
          data: AddProductModel.fromEntity(product).toMap(),
          collectionPath: BackendEndpoint.products);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure('Filed to add product ${e.toString()}'));
    }
  }
}
