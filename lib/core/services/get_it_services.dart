import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit_dashboard/core/services/data_base_services.dart';
import 'package:fruit_dashboard/core/services/fire_storage.dart';
import 'package:fruit_dashboard/core/services/firebase_auth_service.dart';
import 'package:fruit_dashboard/core/services/firestore_services.dart';
import 'package:fruit_dashboard/core/services/storage_services.dart';
import 'package:fruit_dashboard/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fruit_dashboard/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<DataBaseService>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(
    dataBaseService: getIt<DataBaseService>(),
    firebaseAuthService: getIt<FirebaseAuthService>(),
  ));
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(
    storageServices: getIt.get<StorageServices>(),
  ));
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
    dataBaseService: getIt.get<DataBaseService>(),
  ));
}
