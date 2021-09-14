import 'failures.dart';

class NoConnectionFailure extends Failure {
  const NoConnectionFailure()
      : super(
          title: 'Falha de conexão',
          message: 'Ops, algo deu errado. Tente novamente daqui uns minutos',
        );
}
