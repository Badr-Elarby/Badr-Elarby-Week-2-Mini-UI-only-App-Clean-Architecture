import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_ui_only_app/core/utils/app_colors.dart';
import 'package:mini_ui_only_app/core/utils/app_styles.dart';
import 'package:mini_ui_only_app/features/details/presentation/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;
  int _selectedNavIndex = 0;

  final List<String> _tabs = [
    'All',
    'Popular',
    'Trending',
    'New Releases',
    'Top Rated',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background is applied via a full-size Container
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [AppColors.LightBlue, AppColors.White],
          ),
        ),
        child: Stack(
          children: [
            // Top decorative star image layered behind content
            Positioned.fill(
              right: -130.w,
              child: IgnorePointer(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/images/Star 1.png',
                    width: 350.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  _buildHeader(),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTabBar(),
                          SizedBox(height: 24.h),
                          _buildFeaturedAnime(),
                          SizedBox(height: 25.h),
                          _buildTopCharacters(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Where Anime Comes Alive',
              style: AppTextStyles.DarkBlue24bold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedTabIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.VioletBlue : AppColors.White,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? AppColors.VioletBlue : AppColors.White,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  _tabs[index],
                  style: isSelected
                      ? AppTextStyles.White14bold
                      : AppTextStyles.VioletBlue14bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedAnime() {
    return SizedBox(
      height: 280.h,

      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        children: [
          _buildAnimeCard(
            title: 'Detective Conan',
            subtitle: 'Mystery',
            rating: '5.0',
            imageUrl: 'assets/images/card.png',
          ),
          SizedBox(width: 20.w),
          _buildAnimeCard(
            title: 'Hunter x Hunter',
            subtitle: 'Adventure',
            rating: '5.0',
            imageUrl:
                'assets/images/Hunter-x-hunter-phantom-rouge-poster 1.png',
          ),
          SizedBox(width: 20.w),
          _buildAnimeCard(
            title: 'Dragon Ball Z',
            subtitle: 'Action',
            rating: '5.0',
            imageUrl: 'assets/images/card (1).png',
          ),
        ],
      ),
    );
  }

  Widget _buildAnimeCard({
    required String title,
    required String subtitle,
    required String rating,
    required String imageUrl,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsScreen(
              title: title,
              subtitle: subtitle,
              rating: rating,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  ),
                ),

                Positioned(
                  top: 3.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.blue, size: 12.sp),
                        SizedBox(width: 2.w),
                        Text(rating, style: AppTextStyles.DarkBlue14semibold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.DarkBlue14bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(subtitle, style: AppTextStyles.grey12medium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopCharacters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Text('Top Characters', style: AppTextStyles.Black24bold),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          height: 120.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            children: [
              _buildCharacterItem(
                name: 'Gon Freecss',
                anime: 'Hunter x Hunter',
                imageUrl: 'assets/images/HxH2011_EP147_Gon_Portrait 1.png',
              ),
              SizedBox(width: 12.w),
              _buildCharacterItem(
                name: 'Naruto Uzumaki',
                anime: 'Naruto',
                imageUrl: 'assets/images/Naruto_Shipp%3Fden_Logo-1 1.png',
              ),
              SizedBox(width: 12.w),
              _buildCharacterItem(
                name: 'Luffy',
                anime: 'One Piece',
                imageUrl:
                    'assets/images/bff01dd0ae186d938f1af8ba127f12bd 1.png',
              ),

              SizedBox(width: 12.w),
              _buildCharacterItem(
                name: 'Conan Edogawa',
                anime: 'Detective Conan',
                imageUrl: 'assets/images/download 1.png',
              ),

              SizedBox(width: 12.w),
              _buildCharacterItem(
                name: 'Goku',
                anime: 'Dragon Ball',
                imageUrl: 'assets/images/download (1) 1.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCharacterItem({
    required String name,
    required String anime,
    required String imageUrl,
  }) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.w,
          decoration: BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 80.w,
          child: Text(
            name,
            style: AppTextStyles.DarkBlue16semibold.copyWith(fontSize: 12.sp),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: 80.w,
          child: Text(
            anime,
            style: AppTextStyles.grey12medium.copyWith(fontSize: 10.sp),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(color: AppColors.White),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, 'Home', 0),
              _buildNavItem(Icons.bookmarks_outlined, 'Library', 1),
              _buildNavItem(Icons.search_rounded, 'Search', 2),
              _buildNavItem(Icons.public_rounded, 'Explore', 3),
              _buildNavItem(Icons.settings_outlined, 'Settings', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedNavIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedNavIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16.w : 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.VioletBlue : AppColors.White,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.White : Colors.grey,
              size: 24.sp,
            ),
            if (isSelected) ...[
              SizedBox(width: 8.w),
              Text(label, style: AppTextStyles.White14semibold),
            ],
          ],
        ),
      ),
    );
  }
}
