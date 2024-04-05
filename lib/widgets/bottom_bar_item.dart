import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

/// Lottie BottomBarItem
class LottieBottomBarItem extends StatefulWidget {
  // Tab 名字
  final String tabName;

  // Tab 图标
  final String tabIcon;

  // 默认颜色
  final Color tabTextColor;

  // 选中颜色
  final Color tabTextSelectedColor;

  // Tab对应索引
  final int tabIndex;

  // 点击回调
  final Function(int) onTap;

  // 是否选中
  final bool isChecked;

  // 角标
  final int badger;

  const LottieBottomBarItem({
    Key? key,
    required this.tabName,
    required this.tabIcon,
    required this.onTap,
    required this.tabIndex,
    this.tabTextColor = Colors.grey,
    this.tabTextSelectedColor = Colors.black,
    this.isChecked = false,
    this.badger = 0,
  }) : super(key: key);

  @override
  State<LottieBottomBarItem> createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<LottieBottomBarItem>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    if (widget.isChecked) {
      _animationController?.forward();
    }
  }

  @override
  void didUpdateWidget(covariant LottieBottomBarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isChecked) {
      _animationController?.reset();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Column(
              children: [
                Lottie.asset(
                  widget.tabIcon,
                  repeat: false,
                  controller: _animationController,
                  width: 35.w,
                  height: 30.w,
                ),
                Text(
                  widget.tabName,
                  style: TextStyle(
                    color: widget.isChecked
                        ? widget.tabTextSelectedColor
                        : widget.tabTextColor,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: widget.badger > 0,
            child: Positioned(
              right: 30.w,
              top: 10.w,
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  width: 8,
                  height: 8,
                ),
              ),
            ),
          )
        ],
      ),
      onTap: () {
        widget.onTap(widget.tabIndex);
        _animationController?.forward();
      },
    );
  }
}
