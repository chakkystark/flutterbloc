class CovidModel {
  String countryName, code;
  int totalConfirmedCases, deaths, recoveries;

  CovidModel({
    required this.countryName,
    required this.totalConfirmedCases,
    required this.deaths,
    required this.recoveries,
    required this.code,
  });

  factory CovidModel.fromJSON(Map map) {
    return CovidModel(
      countryName: map['Country'],
      totalConfirmedCases: map['TotalConfirmed'],
      deaths: map['TotalDeaths'],
      recoveries: map['TotalRecovered'],
      code: map['CountryCode'],
    );
  }
}
