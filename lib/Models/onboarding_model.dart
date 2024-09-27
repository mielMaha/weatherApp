class OnBoardModel {
  String path;
  String Title;
  String supTitle;
  OnBoardModel(
      {required this.path, required this.supTitle, required this.Title});
  static List<OnBoardModel> OnBoardList = [
    OnBoardModel(
        path:
            'https://img.freepik.com/premium-vector/vector-set-weather-icons_1157889-1234.jpg',
        supTitle: 'Search for weather by city',
        Title: ' Knowing the weather'),
    OnBoardModel(
        path:
            'https://www.twistedmagazine.com/wp-content/uploads/2023/08/hourly-weather.png',
        supTitle: 'Know the weather at all hours of the day',
        Title: ' Hourly weather'),
    OnBoardModel(
        path:
            'https://xplorio.com/xplorio/content/73276/103128455_3423962830965309_2824122751962315170_n_1591685016.jpg',
        supTitle: 'Provides total temperature and weather information ',
        Title: ' detailed weather information')
  ];
}
