import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skillmaestro/admin/view/cancelled_jobs_list.dart';
import 'package:skillmaestro/admin/view/experts_list.dart';
import 'package:skillmaestro/admin/view/jobs_list.dart';
import 'package:skillmaestro/admin/view/users_list.dart';
import 'package:skillmaestro/application/admin/chart_provider.dart';
import 'package:skillmaestro/application/admin/get_card_count_provider.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/user/view/login.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

enum LegendShape { circle, rectangle }

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<getCardProvider>().cardCount();
    context.read<ChartDataProvider>().chartData();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    icon: const Icon(Icons.menu),
                    onSelected: (value) {
                      if (value == 'logout') {
                        deleteAdminAccesToken();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserLogin(),
                            ),
                            (route) => false);
                        const Text('logout');
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ],
                  )
                ],
              ),
              const Text(
                'Admin',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Consumer<getCardProvider>(
                builder: (context, value, child) {
                  log('___________________getcard provider_______${value.cardcount['result']}');
                  Map<String, dynamic> counts = value.cardcount['result'];
                  return GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16.0),
                    itemCount: 4, // Total number of card types
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      switch (index) {
                        case 0:
                          return buildCard('Users', counts["userCount"],
                              UsersList(), context, Colors.green);
                        case 1:
                          return buildCard('Experts', counts["expertCount"],
                              const AllExpertForAdmin(), context, Colors.grey);
                        case 2:
                          return buildCard('Jobs', counts["bookingCount"],
                              const JobsList(), context, Colors.lime);
                        case 3:
                          return buildCard(
                              'Cancelled Jobs',
                              counts["cancelCount"],
                              const CancelledJobs(),
                              context,
                              Colors.cyan);
                        default:
                          return Container(
                            color: Colors.amberAccent,
                          ); // Placeholder if needed
                      }
                    },
                  );
                },
              ),
              /* SizedBox(
                height: 10,
              ), */
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Number of Workers per Job',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration:
                          TextDecoration.combine([TextDecoration.underline]),
                    ),
                  ),
                ],
              ),
              //const SizedBox(height: 8.0),
              Container(
                height: 400,
                //width: 300,
                color: Colors.grey,
                //width: 50,
                child: Consumer<ChartDataProvider>(
                  builder: (context, value, child) {
                    log('_______________value__${value.expert['result']['pieData']}');
                    log("____________hai_______");
                    List joblist = value.expert['result']['pieData'];
                    //log('_______________value__${joblist}');

                    //final List<Map<String, dynamic>> dataList = joblist;

                    final dataMap = <String, double>{};

                    for (final data in joblist) {
                      final id = data['_id'] as String;
                      final expertCount = data['expert_count'] as int;

                      dataMap[id] = expertCount.toDouble();
                      log("_______________________datamap________${dataMap}");
                    }

                    /*  final chartModel =
                        chartModelFromJson(value.expert.toString());

                    final dataMap = <String, double>{};

                    for (final pieData in chartModel.result.pieData) {
                      dataMap[pieData.id] = pieData.expertCount.toDouble();
                    }

                    print(dataMap); */

                    return HomePage(
                      dataMap: dataMap,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    String title,
    int count,
    dynamic pageroute,
    BuildContext context,
    Color colors,
  ) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Add rounded corners
        ),
        color: colors,
        // ignore: avoid_unnecessary_containers
        child: Container(
          //height: 100, // Set a fixed height for the card item
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Count:$count',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 8.0),
              //Text('Count: $count'),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => pageroute));
      },
    );
  }
}

/* class PieChartWidget extends StatelessWidget {
  final List<ChartModel> result;

  PieChartWidget({required this.result});

  @override
  Widget build(BuildContext context) {
    context.read<ChartDataProvider>().chartData();
    final data = result.map((datum) {
      return charts.Series<PieDatum, String>(
        id: datum.id,
        data: [datum],
        domainFn: (PieDatum datum, _) => datum.id,
        measureFn: (PieDatum datum, _) => datum.expertCount,
      );
    }).toList();

    return charts.PieChart(
      data,
      animate: true,
      animationDuration: Duration(milliseconds: 500),
    );
  }
} */

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.dataMap}) : super(key: key);
  Map<String, double> dataMap = {};

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  ChartType? _chartType = ChartType.disc;
  bool _showCenterText = true;
  double? _ringStrokeWidth = 32;
  double? _chartLegendSpacing = 32;

  bool _showLegendsInRow = false;
  bool _showLegends = true;
  bool _showLegendLabel = false;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  bool _showGradientColors = false;

  LegendShape? _legendShape = LegendShape.circle;
  LegendPosition? _legendPosition = LegendPosition.right;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: widget.dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: math.min(MediaQuery.of(context).size.width / 2.2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      //centerText: _showCenterText ? "HYBRID" : null,
      //legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.black,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth >= 600) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: chart,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Text('hhh'),
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    child: chart,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

/* class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Flutter": 5,
  };

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart 1"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
          colorList: colorList,
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
          totalValue: 20,
        ),
      ),
    );
  }
} */
