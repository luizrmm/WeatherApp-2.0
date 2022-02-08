import 'package:weather_app/core/errors/failures.dart';

class GetCurrentWeatherFailure extends Failure {
  @override
  List<Object?> get props => [
        super.message,
      ];
}
