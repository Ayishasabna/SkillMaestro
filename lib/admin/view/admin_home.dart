import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/admin/view/experts_list.dart';
import 'package:skillmaestro/admin/view/jobs_list.dart';
import 'package:skillmaestro/admin/view/users_list.dart';
import 'package:skillmaestro/application/admin/chart_provider.dart';
import 'package:skillmaestro/application/admin/get_card_count_provider.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;
import '../../common/widgets/bottom_nav_bar.dart';

enum LegendShape { circle, rectangle }

Map<String, dynamic> counts = {};
List joblist = [];

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
                              builder: (context) => const BoardingLoginScreen(),
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
                  if (value.cardcount['result'] == null ||
                      value.cardcount['result'].isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  counts = value.cardcount['result'];

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
                              const UsersList(), context, Colors.green);
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
                              const BottomNavBar(),
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
                  const SizedBox(
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
                    if (value.expert['result'] == null ||
                        value.expert['result'].isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (value.expert['result']['pieData'] != null) {
                      joblist = value.expert['result']['pieData'];
                    }

                    final dataMap = <String, double>{};

                    for (final data in joblist) {
                      final id = data['_id'] as String;
                      final expertCount = data['expert_count'] as int;

                      dataMap[id] = expertCount.toDouble();
                    }

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
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Count:$count',
                style: const TextStyle(fontSize: 15),
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

// ignore: must_be_immutable
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
  // ignore: prefer_final_fields
  ChartType? _chartType = ChartType.disc;

  // ignore: unnecessary_nullable_for_final_variable_declarations
  final double? _ringStrokeWidth = 32;
  // ignore: prefer_final_fields
  double? _chartLegendSpacing = 32;

  // ignore: prefer_final_fields
  bool _showLegendsInRow = false;
  // ignore: prefer_final_fields
  bool _showLegends = true;

  final bool _showGradientColors = false;

  // ignore: unnecessary_nullable_for_final_variable_declarations
  final LegendShape? _legendShape = LegendShape.circle;
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final LegendPosition? _legendPosition = LegendPosition.right;

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
                const Flexible(
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
