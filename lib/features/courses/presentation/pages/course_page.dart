import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_finance/core/presentation/panel.dart';
import 'package:kids_finance/core/routing/providers/router_providers.dart';
import 'package:kids_finance/features/courses/domain/entity/course.dart';
import 'package:kids_finance/features/courses/presentation/widgets/course_card.dart';

class CoursePage extends ConsumerWidget {
  final int courseId;

  const CoursePage({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, ref) {
    final TextStyle? appBarTitleStyle = Theme.of(context).textTheme.headlineMedium;
    final TextStyle? titleStyle = Theme.of(context).textTheme.headlineLarge;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: ref.read(locationServiceProvider).pop,
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios_rounded),
                const SizedBox(width: 10),
                Text(
                  'Назад',
                  style: appBarTitleStyle?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                // SizedBox.square(
                //   dimension: 24.h,
                //   child: SvgPicture.asset(
                //     'assets/images/Back.svg',
                //     fit: BoxFit.contain,
                //   ),
                // )
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox.square(
              dimension: 24.h,
              child: SvgPicture.asset(
                'assets/images/share.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.w),
              Panel(
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Основы финансовой грамотности',
                        style: titleStyle?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.w),
                      SizedBox(
                        width: 255.w,
                        height: 240.h,
                        child: Image.asset(
                          'assets/images/manL.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              const CoursesCard(
                title: 'О курсе',
                description:
                    'В рамках первого модуля вы научитесь управлять личными финансами: определять свои доходы и расходы, узнаете, как составлять бюджет и достиг',
                lessons: [
                  // Course(
                  //     id: 1,
                  //     header: 'История денег и их функции',
                  //     logo: 'assets/images/courseCard1.png',
                  //     description: '2ч 30 мин.',
                  //     lessons: []),
                  // Course(
                  //     id: 2,
                  //     header: 'Деньги и банкноты мира',
                  //     logo: 'assets/images/courseCard2.png',
                  //     description: '2ч 30 мин.',
                  //     lessons: []),
                  // Course(
                  //     id: 3,
                  //     header: 'Доходы и карманные деньги',
                  //     logo: 'assets/images/courseCard3.png',
                  //     description: '2ч 30 мин.',
                  //     lessons: []),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
