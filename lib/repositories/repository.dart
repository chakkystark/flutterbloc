import 'package:flutterbloc/api_repo/covid_api_repo.dart';
import 'package:flutterbloc/models/covid_model.dart';

class Repository {
  CovidApiRepo covidApiRepo = CovidApiRepo();

  Future<List<CovidModel>> getLatestCovidData() =>
      covidApiRepo.getLatestCovidData();
}
