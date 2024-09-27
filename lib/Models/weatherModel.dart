class WeatherModel {

  double Max;
  double min;
  double aver;
  String city;
  String condition;
  String image;
  String data;
  List hours;
  WeatherModel(
      {

        required this.hours,
        required this.image,
        required this.data,
        required this.aver,
        required this.city,
        required this.condition,
        required this.Max,
        required this.min});

  factory WeatherModel.fromJson(data) {
    return WeatherModel(
        image: data["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        data:  data["forecast"]["forecastday"][0]["date"],
        aver:  data["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        city: data["location"]['name'],
        condition: data["forecast"]["forecastday"][0]["day"]["condition"]["text"],
        Max:  data["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        min:  data["forecast"]["forecastday"][0]["day"][ "mintemp_c"],
        hours:data["forecast"]["forecastday"][0]["hour"],
    );
  }
  Map<String ,dynamic> ToMap(){
    return{

      "city": city,
      "min" :min.toString(),
      "Max": Max.toString(),
      "condition" :condition,
      "image" :image,
      'aver':aver.toString()

    };

  }
}
