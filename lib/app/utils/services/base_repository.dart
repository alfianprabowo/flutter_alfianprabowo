import 'index.dart';

class BaseRepository<Prov extends BaseProvider> {
  final Prov provider;

  BaseRepository({
    required this.provider,
  });
}
