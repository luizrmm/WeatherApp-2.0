class IconWeather {
  IconWeather({
    required this.code,
    required this.dayIcon,
    required this.nightIcon,
  });
  final int code;
  final String dayIcon;
  final String nightIcon;
}

List<IconWeather> iconsWeather = [
  IconWeather(code: 1000, dayIcon: 'sunny', nightIcon: 'night_clear'),
  IconWeather(
    code: 1003,
    dayIcon: 'partial_cloudy',
    nightIcon: 'night_partial_cloudy',
  ),
  IconWeather(
    code: 1006,
    dayIcon: 'mostly_cloudy',
    nightIcon: 'night_mostly_cloudy',
  ),
  IconWeather(code: 1009, dayIcon: 'cloudy', nightIcon: 'cloudy'),
  IconWeather(code: 1030, dayIcon: 'fog', nightIcon: 'fog'),
  IconWeather(code: 1063, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1066, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1069, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1072, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1087, dayIcon: 'storm', nightIcon: 'storm'),
  IconWeather(code: 1114, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1117, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1135, dayIcon: 'fog', nightIcon: 'fog'),
  IconWeather(code: 1147, dayIcon: 'fog', nightIcon: 'fog'),
  IconWeather(code: 1150, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1153, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1168, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1171, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1180, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1183, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1186, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1189, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1192, dayIcon: 'storm', nightIcon: 'storm'),
  IconWeather(code: 1195, dayIcon: 'storm', nightIcon: 'storm'),
  IconWeather(code: 1198, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1201, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1204, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1207, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1210, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1213, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1216, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1219, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1222, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1225, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1237, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1240, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1243, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1246, dayIcon: 'rain', nightIcon: 'rain'),
  IconWeather(code: 1249, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1252, dayIcon: 'sleet', nightIcon: 'sleet'),
  IconWeather(code: 1255, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1258, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1261, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1264, dayIcon: 'snow', nightIcon: 'snow'),
  IconWeather(code: 1273, dayIcon: 'storm', nightIcon: 'snow'),
  IconWeather(code: 1276, dayIcon: 'storm', nightIcon: 'snow'),
  IconWeather(code: 1279, dayIcon: 'storm', nightIcon: 'snow'),
  IconWeather(code: 1282, dayIcon: 'storm', nightIcon: 'snow'),
];

String getIcon(int code, String lastUpdate) {
  final date = DateTime.parse(lastUpdate);

  final icon = iconsWeather.firstWhere((element) => element.code == code);
  if (date.hour <= 4 || date.hour >= 18) {
    return icon.nightIcon;
  } else {
    return icon.dayIcon;
  }
}
