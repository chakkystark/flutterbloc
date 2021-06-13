import 'package:flutter/material.dart';
import 'package:flutterbloc/blocs/covid_data_bloc.dart';

import 'models/covid_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   covidDataBloc.fetchCovidData();

  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    covidDataBloc.fetchCovidData();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    covidDataBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid List Countrywide'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: covidDataBloc.covidDataStream,
          builder: (context, AsyncSnapshot<List<CovidModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ExpansionTile(
                        leading: Text(
                          '${snapshot.data![index].code}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: Colors.deepOrange),
                        ),
                        backgroundColor: Colors.blue[100],
                        title: Text('${snapshot.data![index].countryName}'),
                        children: [
                          Text(
                            'Name of the Country : ${snapshot.data![index].countryName}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          SizedBox(height: 10),
                          Text(
                              'Total Confirmed Cases :${snapshot.data![index].totalConfirmedCases.toString()}'),
                          SizedBox(height: 10),
                          Text(
                            'No of recoveries :${snapshot.data![index].recoveries.toString()}',
                            style: TextStyle(color: Colors.green),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'No of deaths : ${snapshot.data![index].deaths.toString()}',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          },
        ));
  }
}
