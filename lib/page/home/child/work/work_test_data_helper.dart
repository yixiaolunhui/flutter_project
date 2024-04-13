import 'dart:math';

import '../../../../model/Work_model.dart';

class TestDataGenerator {
  static List<WorkModel> generateTestData(int count) {
    List<WorkModel> testData = [];
    for (int i = 0; i < count; i++) {
      testData.add(_generateRandomWorkModel());
    }
    return testData;
  }

  static WorkModel _generateRandomWorkModel() {
    return WorkModel(
      name: _generateRandomString(10),
      status: _generateRandomStatus(),
      salaryRange: _generateRandomSalaryRange(),
      companyName: _generateRandomString(10),
      financingStage: _generateRandomFinancingStage(),
      employeeNum: _generateRandomEmployeeNum(),
      tags: _generateRandomTags(),
      commutingTime: _generateRandomCommutingTime(),
      address: _generateRandomAddressString(15),
      recruiter: _generateRandomRecruiter(),
    );
  }

  static String _generateRandomString(int length) {
    return ['Android开发', 'Flutter开发', '鸿蒙开发工程师'][Random().nextInt(3)];
  }

  static String _generateRandomAddressString(int length) {
    return ['北京海淀区', '上海市杨浦区', '南京路'][Random().nextInt(3)];
  }

  static String _generateRandomStatus() {
    return ['急聘', ''][Random().nextInt(2)];
  }

  static String _generateRandomSalaryRange() {
    return ['3-6万元', '5-8万元', '8-12万元'][Random().nextInt(3)];
  }

  static String _generateRandomFinancingStage() {
    return ['已上市', 'A轮', 'B轮', 'C轮', 'D轮及以上', '未融资'][Random().nextInt(6)];
  }

  static String _generateRandomEmployeeNum() {
    return [
      '1000以下',
      '1000-5000人',
      '5000-10000人',
      '10000以上'
    ][Random().nextInt(4)];
  }

  static List<String> _generateRandomTags() {
    return ['本科', '硕士', '博士', '设计模式', 'SDK', '算法', 'Java', 'Python']
        .sublist(0, Random().nextInt(8) + 1);
  }

  static String _generateRandomCommutingTime() {
    return ['地铁30分钟', '地铁1小时', '公交30分钟', '公交1小时', '自驾'][Random().nextInt(5)];
  }

  static Recruiter _generateRandomRecruiter() {
    return Recruiter(
      name: '周先生',
      icon:
          'https://img1.baidu.com/it/u=1308060489,3520735740&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=750',
      position: ['HR', '招聘经理', '人事专员'][Random().nextInt(3)],
      status: '今天回复${Random().nextInt(20)}次',
    );
  }
}
