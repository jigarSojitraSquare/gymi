import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gymi/components/Splash/SplashCustomBackground.dart';
import 'package:gymi/core/constants/ImageConstants.dart';
import 'package:gymi/core/theme/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../components/Common/CommonTextStyle.dart';


@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: CustomCirclePainter(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 140.h,
              ),
              Image.asset(ImageConstants.imgMainLogoP,
                  height: 200.r, width: 200.r),
              SizedBox(
                height: 45.h,
              ),
              Text(appLocalization.gymi,style: textWith48W600(ColorConstants.primaryTextColor)),
              SizedBox(
                height: 125.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text(
                  appLocalization.learning_can_take_various_form,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: textWith16W400(ColorConstants.primaryTextColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


