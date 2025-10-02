import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ui_only_app/core/utils/app_colors.dart';
import 'package:mini_ui_only_app/core/utils/app_styles.dart';
import 'package:mini_ui_only_app/features/subscription/presentation/screens/subscription.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String rating;
  final String imageUrl;

  const DetailsScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image (same as original)
          Image.asset('assets/images/Rectangle 5.png', fit: BoxFit.cover),
          Positioned.fill(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            ),
          ),
          SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  _buildAnimeImageWithBadge(),
                  SizedBox(height: 70.h),
                  _buildGenreTags(),
                  SizedBox(height: 20.h),
                  _buildStatsRow(),
                  SizedBox(height: 24.h),
                  _buildDescription(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildActionButtons(),
    );
  }

  Widget _buildAnimeImageWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Main image full width
        SizedBox(
          width: double.infinity,
          height: 500.h,
          child: Image.asset(
            'assets/images/4cc0861e-40ee-4f28-8cfb-6bae9edb5f7b 1.png',
            fit: BoxFit.cover,
          ),
        ),

        // Badge at bottom
        Positioned(bottom: -40.h, child: _buildTitleBadge()),
      ],
    );
  }

  Widget _buildTitleBadge() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
      height: 170.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ellipse 3 (bottom/main ellipse)
          Positioned(
            bottom: 0,
            left: 80.w,
            child: Image.asset(
              'assets/images/Ellipse 3.png',
              width: 160.w,
              height: 150.w,
              fit: BoxFit.fitWidth,
            ),
          ),

          // Ellipse 6 (top/accent ellipse)
          Positioned(
            bottom: -8.h,
            right: 55.w,
            child: Image.asset(
              'assets/images/Ellipse 6.png',
              width: 105.w,
              height: 160.w,
              fit: BoxFit.cover,
            ),
          ),

          // Title text on top
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text(
                    'DEMON',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.NewRocker_black35regular.copyWith(
                      color: AppColors.Black,
                    ),
                  ),
                  Text(
                    'SLAYER',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.NewRocker_black30regular.copyWith(
                      color: AppColors.Black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenreTags() {
    final genres = ['Dark Fantasy', 'Action', 'Adventure'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: genres.map((genre) => _buildGenreChip(genre)).toList(),
      ),
    );
  }

  Widget _buildGenreChip(String genre) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors
            .slateBlueGray, // Dark purple-blue color matching the image
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(genre, style: AppTextStyles.White11medium),
    );
  }

  Widget _buildStatsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Divider(color: Colors.grey.withOpacity(0.3)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem('assets/images/Vector.png', '2.3M views'),
                _buildStatItem('assets/images/HandsClapping.png', '2K clap'),
                _buildStatItem('assets/images/Mask group.png', '4 Seasons'),
              ],
            ),
          ),
          Divider(color: Colors.grey.withOpacity(0.3)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String imagePath, String label) {
    return Row(
      children: [
        Image.asset(imagePath, color: Colors.white, width: 20.w, height: 20.h),
        SizedBox(width: 2.w),
        Text(
          label,
          style: AppTextStyles.inter_white13regular.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Group 16.png', width: 24.w, height: 24.h),
          SizedBox(width: 8.w), // Add spacing between image and text
          Expanded(
            child: Text(
              'Demon Slayer: Kimetsu no Yaiba follows Tanjiro, a kind-hearted boy who becomes a demon slayer after his family is slaughtered and his sister is turned into a demon. Experience breathtaking battles, stunning animation, and an emotional journey of courage and hope.',
              style: AppTextStyles.hintgrey14medium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      color: AppColors.buttonBackground,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildPreviewButton()),
              SizedBox(width: 15.w),
              Expanded(child: _buildWatchNowButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPurpleGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/solar_stopwatch-play-bold.png',
            color: AppColors.White,
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 6.w),
          Text('preview', style: AppTextStyles.White15semibold),
        ],
      ),
    );
  }

  Widget _buildWatchNowButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SubscriptionScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.VioletBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shadowColor: AppColors.VioletBlue.withOpacity(0.5),
        elevation: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Vector.png',
            color: AppColors.White,
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 6.w),
          Text('Watch Now', style: AppTextStyles.White15semibold),
        ],
      ),
    );
  }
}
