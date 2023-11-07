import 'package:covid_tracker_app_with_provider/Presentation/World_States_Screen/components/reUsable_row.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeath,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeath,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.name),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Card(
                    child: Column(
                      children: [
                        ReusableRow(
                            title: 'Total Cases',
                            value: widget.totalCases.toString()),
                        ReusableRow(
                            title: 'Total Death',
                            value: widget.totalDeath.toString()),
                        ReusableRow(
                            title: 'Total Recovered',
                            value: widget.totalRecovered.toString()),
                        ReusableRow(
                            title: 'Active', value: widget.active.toString()),
                        ReusableRow(
                            title: 'Critical',
                            value: widget.critical.toString()),
                        ReusableRow(
                            title: 'Today Recovered',
                            value: widget.todayRecovered.toString()),
                        ReusableRow(
                            title: 'Tests', value: widget.test.toString()),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
