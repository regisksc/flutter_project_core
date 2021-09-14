// Project imports:
import '../../../core.dart';

class SingleOutputMappingStrategy implements MappingStrategy {
  SingleOutputMappingStrategy(this.modelSerializer);

  final ModelSerializer modelSerializer;

  @override
  Either<Failure, Output> call<Output extends Model>(dynamic dataFromRemote) {
    if (dataFromRemote is Map<String, dynamic>) {
      return Right(modelSerializer(dataFromRemote) as Output);
    }
    return Left(InvalidMapFailure(dataFromRemote.runtimeType));
  }
}
