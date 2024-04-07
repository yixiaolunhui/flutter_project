import 'package:flutter/material.dart';
import 'package:flutter_project/res/colors/color_res.dart';
import 'package:flutter_project/util/date_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// BottomBarItem
class BottomBarItem extends StatefulWidget {
  // Tab 名字
  final String tabName;

  // Tab 图标
  final String tabIcon;

  // Tab 选中图标
  final String tabSelectedIcon;

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

  const BottomBarItem({
    Key? key,
    required this.tabName,
    required this.tabIcon,
    required this.tabSelectedIcon,
    required this.onTap,
    required this.tabIndex,
    this.tabTextColor = Colors.grey,
    this.tabTextSelectedColor = RC.themeColor,
    this.isChecked = false,
    this.badger = 0,
  }) : super(key: key);

  @override
  State<BottomBarItem> createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.isChecked
                      ? Image.network(
                          "${widget.tabSelectedIcon}?${DateUtil.getNowDateMs()}",
                          width: 40.w,
                          height: 30.w,
                          errorBuilder: (context, error, stackTrace) {
                            return ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                widget.tabTextSelectedColor,
                                BlendMode.srcIn,
                              ),
                              child: Image.asset(
                                widget.tabIcon,
                                width: 40.w,
                                height: 30.w,
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (child != null) {
                              return child;
                            } else {
                              return Image.asset(
                                widget.tabIcon,
                                width: 40.w,
                                height: 30.w,
                              );
                            }
                          },
                        )
                      : Image.asset(
                          widget.tabIcon,
                          width: 40.w,
                          height: 30.w,
                        ),
                  Text(
                    widget.tabName,
                    style: TextStyle(
                      color: widget.isChecked
                          ? widget.tabTextSelectedColor
                          : widget.tabTextColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
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
        setState(() {});
      },
    );
  }
}
