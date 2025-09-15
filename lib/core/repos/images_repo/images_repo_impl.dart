import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failure.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/services/storage_services.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl({required this.storageServices});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageServices.uploadImage(image, BackendEndpoint.images);
      return Right(url);
    } on Exception catch (e) {
      return Left(ServerFailure('Filed to upload image ${e.toString()}'));
    }
  }
}
