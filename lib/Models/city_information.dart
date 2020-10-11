class CityInformation {
  final String cityLocationKey;
  final String cityName;
  final String countryId;

  CityInformation({this.countryId, this.cityLocationKey, this.cityName});

  factory CityInformation.fromJson(Map<String, dynamic> json) {
    return CityInformation(
      cityLocationKey: json['Key'],
      cityName: json['LocalizedName'],
      countryId: json['Country']['ID'],
    );
  }
}
