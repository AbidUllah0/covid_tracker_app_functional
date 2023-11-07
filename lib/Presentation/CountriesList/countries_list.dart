import 'package:covid_tracker_app_with_provider/Data/models/CountryListModel.dart';
import 'package:covid_tracker_app_with_provider/Presentation/Detail_Screen/detail_screen.dart';
import 'package:covid_tracker_app_with_provider/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (val) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Search with country name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              FutureBuilder(
                future: statesServices.getCountryList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                /// loading shimmer effect
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String searchName = snapshot.data![index]['country'];

                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                            ["countryInfo"]['flag'],
                                        totalCases: snapshot.data![index]
                                            ['cases'],
                                        totalDeath: snapshot.data![index]
                                            ['deaths'],
                                        totalRecovered: snapshot.data![index]
                                            ['recovered'],
                                        active: snapshot.data![index]['active'],
                                        todayRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        test: snapshot.data![index]['tests'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  ///fetch Data directly from API without using model
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ["countryInfo"]['flag']),
                                  ),
                                  title: Text(
                                    snapshot.data![index]['country'],
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index]['cases'].toString(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (searchName
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]
                                            ["countryInfo"]['flag'],
                                        totalCases: snapshot.data![index]
                                            ['cases'],
                                        totalDeath: snapshot.data![index]
                                            ['deaths'],
                                        totalRecovered: snapshot.data![index]
                                            ['recovered'],
                                        active: snapshot.data![index]['active'],
                                        todayRecovered: snapshot.data![index]
                                            ['todayRecovered'],
                                        test: snapshot.data![index]['tests'],
                                        critical: snapshot.data![index]
                                            ['critical'],
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  ///fetch Data directly from API without using model
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ["countryInfo"]['flag']),
                                  ),
                                  title: Text(
                                    snapshot.data![index]['country'],
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index]['cases'].toString(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
