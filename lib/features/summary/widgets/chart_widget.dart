import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  late List<ChartData> chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    chartData = [
      ChartData('Jan', 60),
      ChartData('Feb', 75),
      ChartData('Mar', 80),
      ChartData('Apr', 85),
      ChartData('May', 90),
      ChartData('Jun', 95),
      ChartData('Jul', 92),
      ChartData('Aug', 88),
      ChartData('Sep', 85),
      ChartData('Oct', 82),
      ChartData('Nov', 78),
      ChartData('Dec', 70),
    ];
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              isVisible: false,
              majorTickLines: const MajorTickLines(size: 0),
            ),
            series: <CartesianSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                borderRadius: BorderRadius.circular(7),
                width: 1,
                pointColorMapper: (c, i) =>
                    c.month == 'Sep' ? AppColors.primaryColor : AppColors.grey,
                dataSource: chartData,
                trackColor: Colors.transparent,
                spacing: 0.3,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.value,
                dataLabelSettings: const DataLabelSettings(isVisible: false),
                enableTooltip: true,
              )
            ],
            tooltipBehavior: _tooltipBehavior,
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final int value;

  ChartData(this.month, this.value);
}
