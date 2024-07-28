import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:ringo_test/core/resources/resources.dart';
import 'package:ringo_test/shared/widgets/primary_button.dart';
import 'package:ringo_test/shared/widgets/primary_textfield.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/chart_widget.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTexfield(
                title: 'Search',
                maxLines: 1,
                hintText: 'Search project here',
                name: 'search',
                suffixIcon: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      SVGAssets.search,
                    )),
              ),
              16.space,
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff3A9ADE),
                              Color(0xff5EACE4),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '10',
                                  style: context.textTheme.displaySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                Icon(
                                  Icons.watch_later,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            8.space,
                            Text(
                              'Project\nIn Progress',
                              style: context.textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    8.space,
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff3F8B8D),
                              Color(0xff58B2B4),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '24',
                                  style: context.textTheme.displaySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                Icon(
                                  Icons.verified,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            8.space,
                            Text(
                              'Project\nCompeted',
                              style: context.textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    8.space,
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffDD4A4A),
                              Color(0xffE87777),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '5',
                                  style: context.textTheme.displaySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                SvgPicture.asset(
                                  SVGAssets.closeCircle,
                                  height: 24,
                                ),
                              ],
                            ),
                            8.space,
                            Text(
                              'Project\nCancelled',
                              style: context.textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              16.space,
              PrimaryButton(
                title: 'View All Project',
                color: Colors.white,
                titleColor: AppColors.primaryColor,
                onPressed: () {},
                elevation: 0,
                borderColor: AppColors.primaryColor,
              ),
              16.space,
              Text(
                'Productivity',
                style: context.textTheme.headlineLarge,
              ),
              16.space,


              SizedBox(height: 200, child: ChartWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  String? year;
  int? sales;

  SalesData(this.year, this.sales);
}

class ChartData {
  ChartData(
    this.year,
    this.investmentValue,
    this.annualIncome,
    this.annualGrowth,
  );

  final int year;
  final num investmentValue;
  final num annualIncome;
  final num annualGrowth;

  @override
  String toString() {
    return 'ChartData(year: $year, investmentValue: $investmentValue, annualIncome: $annualIncome, annualGrowth: $annualGrowth)';
  }

  @override
  bool operator ==(covariant ChartData other) {
    if (identical(this, other)) return true;

    return other.year == year &&
        other.investmentValue == investmentValue &&
        other.annualIncome == annualIncome &&
        other.annualGrowth == annualGrowth;
  }

  @override
  int get hashCode {
    return year.hashCode ^
        investmentValue.hashCode ^
        annualIncome.hashCode ^
        annualGrowth.hashCode;
  }
}
