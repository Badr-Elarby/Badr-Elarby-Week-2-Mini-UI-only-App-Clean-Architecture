import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ui_only_app/core/utils/app_colors.dart';
import 'package:mini_ui_only_app/core/utils/app_styles.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String _selectedPlan = 'Monthly'; // Default selected plan

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.lightIndigo, AppColors.White],
        ),
      ),
      child: Stack(
        children: [
          _buildStarImage(
            'assets/images/Star 1.png',
            top: -60.h,
            left: -100.w,
            width: 300.w,
            height: 300.h,
          ),
          _buildStarImage(
            'assets/images/Star 2.png',
            top: 100.h,
            left: 250.w,
            width: 300.w,
            height: 300.h,
          ),
          _buildRocketBoyImage(context),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  _buildTopSection(context),
                  SizedBox(height: 150.h),
                  _buildMainText(),
                  SizedBox(height: 10.h),
                  _buildDescriptionText(),
                  SizedBox(height: 20.h),
                  _buildSubscriptionOptions(context),
                  SizedBox(height: 30.h),
                  _buildContinueButton(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarImage(
    String assetPath, {
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double width,
    required double height,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Image.asset(assetPath, width: width, height: height),
    );
  }

  Widget _buildRocketBoyImage(BuildContext context) {
    return Positioned(
      top: 90.h,
      left: (MediaQuery.of(context).size.width - 200.w) / 2,
      child: Image.asset(
        'assets/images/Rocket Boy 1.png',
        width: 200.w,
        height: 200.h,
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 40.w), // For alignment
        Text('Upgrade Plan', style: AppTextStyles.DarkBlue22bold),
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.White,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lightGray, width: 1.w),
          ),
          child: IconButton(
            icon: Icon(Icons.close, color: AppColors.DarkBlue, size: 20.w),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMainText() {
    return Text(
      'Seamless Anime Experience, Ad-Free.',
      style: AppTextStyles.DarkBlue24bold,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescriptionText() {
    return Text(
      'Enjoy unlimited anime streaming without interruptions.',
      style: AppTextStyles.GreyMianText14medium,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubscriptionOptions(BuildContext context) {
    return Column(
      children: [
        _buildSubscriptionOption(
          context,
          'Monthly',
          '\$9.99/month',
          'assets/images/Files & Folders 3 1 (1).png',
          true, // Including family sharing for monthly
        ),
        SizedBox(height: 15.h),
        _buildSubscriptionOption(
          context,
          'Annually',
          '\$99.99/year',
          'assets/images/Files & Folders 3 1 (1).png',
          true, // Including family sharing for annually
        ),
      ],
    );
  }

  Widget _buildSubscriptionOption(
    BuildContext context,
    String planType,
    String price,
    String iconPath,
    bool includeFamilySharing,
  ) {
    final bool isActive = _selectedPlan == planType;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = planType;
        });
      },
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: isActive ? AppColors.DarkBlue : AppColors.White,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isActive ? AppColors.DarkBlue : AppColors.White,
            width: 2.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(iconPath, width: 60.w, height: 50.h),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planType,
                      style: isActive
                          ? AppTextStyles.White16bold
                          : AppTextStyles.DarkBlue16bold,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      price,
                      style: isActive
                          ? AppTextStyles.White14bold
                          : AppTextStyles.DarkBlue14bold,
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  isActive ? Icons.check_circle : Icons.radio_button_off,
                  color: isActive ? AppColors.VioletBlue : AppColors.DarkBlue,
                  size: 28.w,
                ),
              ],
            ),
            if (includeFamilySharing) ...[
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 90.w),
                child: Text(
                  'Include Family Sharing',
                  style: isActive
                      ? AppTextStyles.lightPurple12bold
                      : AppTextStyles.lightPurple12bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          // Handle subscription logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.VioletBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
        ),
        child: Text('Continue', style: AppTextStyles.White18semibold),
      ),
    );
  }
}
