import '../utils/request.dart';

class StaffApi {
  /// 单例模式
  static StaffApi? _instance;

  // 工厂函数：初始化，默认会返回唯一的实例
  factory StaffApi() => _instance ?? StaffApi._internal();

  // 用户Api实例：当访问UserApi的时候，就相当于使用了get方法来获取实例对象，如果_instance存在就返回_instance，不存在就初始化
  static StaffApi? get instance => _instance ?? StaffApi._internal();

  /// 初始化
  StaffApi._internal() {
    // 初始化基本选项
  }

  getStaff() async {
    Request.instance?.openLog();

    var result =
        await Request().request('/staff/getstaff', method: DioMethod.get);

    return result.data;
  }
}
