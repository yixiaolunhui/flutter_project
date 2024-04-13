import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/res/colors/color_res.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/Work_model.dart';

class WorkListWidget extends StatelessWidget {
  WorkListWidget({
    super.key,
    required this.workList,
  });

  List<WorkModel> workList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: workList.length,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${workList[index].name}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    "${workList[index].salaryRange}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: RC.themeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.w),
              Text(
                "${workList[index].companyName} ${workList[index].financingStage}  ${workList[index].employeeNum}",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5.w),
              Wrap(
                spacing: 8.0, // 水平间距
                runSpacing: 8.0, // 垂直间距
                children: _tagListWidget(workList[index].tags),
              ),
              SizedBox(height: 10.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                            workList[index].recruiter?.icon ?? ""),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "${workList[index].recruiter?.name ?? ""}.${workList[index].recruiter?.position ?? ""} ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    "${workList[index].commutingTime ?? ""} ${workList[index].address ?? ""} ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 8.w,
        );
      },
    );
  }

  _tagListWidget(List<String>? tags) {
    return tags?.map((tag) {
      return UnconstrainedBox(
        child: Container(
          height: 25.w,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
          decoration: BoxDecoration(
            color: RC.pageBgColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            tag,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ),
      );
    }).toList();
  }
}
