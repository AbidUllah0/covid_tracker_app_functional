import 'package:covid_tracker_app_with_provider/Data/models/WorldStatedModel.dart';
import 'package:covid_tracker_app_with_provider/Presentation/CountriesList/countries_list.dart';
import 'package:covid_tracker_app_with_provider/Presentation/Widgets/custom_text.dart';
import 'package:covid_tracker_app_with_provider/Presentation/World_States_Screen/components/reUsable_row.dart';
import 'package:covid_tracker_app_with_provider/Services/states_services.dart';
import 'package:covid_tracker_app_with_provider/Utils/AppColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FutureBuilder(
                future: statesServices.fetchWorldStatedModel(),
                builder: (BuildContext context,
                    AsyncSnapshot<WorldStateModel> snapchot) {
                  if (!snapchot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        controller: _animationController,
                        size: 50,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'Total':
                                double.parse(snapchot.data!.cases!.toString()),
                            'Recovered': double.parse(
                                snapchot.data!.recovered.toString()),
                            'Death':
                                double.parse(snapchot.data!.deaths.toString()),
                          },

                          ///for animation changing
                          animationDuration: Duration(milliseconds: 1200),

                          //chartType: ChartType.disc,
                          chartType: ChartType.ring,
                          colorList: [
                            AppColors.blueColor,
                            AppColors.greenColor,
                            AppColors.redColor,
                          ],
                          //for percentage values
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                        ),
                        SizedBox(height: 20),
                        Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'Total',
                                  value: snapchot.data!.cases.toString()),
                              ReusableRow(
                                  title: 'Deaths',
                                  value: snapchot.data!.deaths.toString()),
                              ReusableRow(
                                  title: 'Recovered',
                                  value: snapchot.data!.recovered.toString()),
                              ReusableRow(
                                  title: 'Active',
                                  value: snapchot.data!.active.toString()),
                              ReusableRow(
                                  title: 'Critical',
                                  value: snapchot.data!.critical.toString()),
                              ReusableRow(
                                  title: 'Today Cases',
                                  value: snapchot.data!.todayCases.toString()),
                              ReusableRow(
                                  title: 'Today Deaths',
                                  value: snapchot.data!.todayDeaths.toString()),
                              ReusableRow(
                                  title: 'Today Recovered',
                                  value:
                                      snapchot.data!.todayRecovered.toString()),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountriesList(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Track Countries',
                              ),
                            ),
                          ),
                        ),
                      ],
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
