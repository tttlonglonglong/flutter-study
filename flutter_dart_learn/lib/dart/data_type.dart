import 'package:flutter/cupertino.dart';

// 常用数据类型
class DateType extends StatefulWidget {
  @override
  _DateTypeState createState() => _DateTypeState();
}

class _DateTypeState extends State<DateType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _listMap();
    _tips();
    return Container(
      child: Text('常用数据类型，请查看控制台输出'),
    );
  }

  /// 数字类型
  void _numType() {
    // num：数字类型的父类,它有俩个子类
    num num1 = -1.0; //是数字类型的父类
    num num2 = 2; //是数字类型的父类
    int int1 = 3; // 只能是整数
    double d1 = 1.68; // 双精度
    print("num1$num1 num2:$num2 int1:$int1 double:$d1");
    print(num1.abs()); // 求绝对值
    print(num1.toInt()); // 转换成int
    print(num1.toDouble()); // 转换成double
  }

  /// 字符串
  void _stringType() {
    // dart中定义字符串，即可以用单引号也可以用双引号
    String str1 = '字符串', str2 = "双引号";
    // dart中字符串的拼接
    String str3 = 'str：' + str1 + 'str2:' + str2;
    String str4 = "str：$str1 str2:$str2";
    print(str3);
    print(str4);
    // 字符串常用方法
    String str5 = "常用数据类型，请看控制台输出";
    print(str5.substring(1, 5)); // 截取字符串
    print(str5.indexOf('类型')); // 获取指定字符串的位置
    //
  }
  /// 布尔类型，Dart 是强 bool 类型检查，只有bool 类型的值是true 才被认为是true
  void _boolType() {
    bool success = true,fail = false;
    print(success);
    print(fail);
    print(success || false);
    print(success && false);
    print('字符串连用$success');
  }


  /// List集合
  void _listType() {
    print('-----_listType-----');
    /// 集合初始化的方式
    List list = [1,2,3,4,'集合']; // 初始化时添加元素
    print(list);
    List<int>list2 =[1,2,3,4,];
    // list2 = list; // 错误做法，类型转换错误
    List list3 = [];
    list3.add('list3'); // 通过add方法添加元素
    list3.addAll(list);
    print(list3);
    // 其他API：
    // list.removeXx、insert、sublist、indexOf等
    /// 集合生成函数
    List list4 = List.generate(3, (index)=>index*2);
    print(list4);

    /// 遍历集合的三种方式
    for(int i=0;i<list.length;i++){
      print(list[i]);
    }
    for(var o in list){
      print(o);
    }
    list.forEach((val){
      print(val);
    });
  }

  /// Map：map是将kye和value相关联的对象，key和value都可以是任何类型的对象，
  /// 并且key是唯一的如果key重复后面添加的key会替换前面的
  void _listMap() {
    /// Map初始化
    Map names = {'xiaoming':'小明',"xiaohong":"小红"};
    print(names);
    Map ages = {};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print(ages);

    /// Map遍历方式
    ages.forEach((k,v){
      print('key:$k, value:$v');
    });
    Map ages2 = ages.map((k,v){
      // 颠倒Map的k、v
      return MapEntry(v,k);
    });
    print(ages2);

    for(var key in ages.keys){
      print('$key $ages[key]');
    }
  }

  /// 科普小知识：dynamic、var、Object三者的区别
  /// dynamic: 是所有Dart对象的基础类型，在大多数情况下，通常不直接使用它
  /// 通过它定义的变量会关闭类型检查，这意味着 dynamic x = 'hal';x.foo();
  /// 这段代码的静态类型检查不会报错，但是运行时会crash，因为x并没有foo()方法，所以建议谨慎使用
  /// var：是一个关键字，意思是"我不关心这里的类型是什么。"，系统会自动推断类型runtimeType；
  /// object：是Dart对象的基类，当你定义：Object x= xxx；时这时候系统会认为o是个对象
  /// 因为Object提供了这些方法，但是如果你尝试调用了o.foo()时，静态类型检查会进行报错
  /// 综上不难看出dymanic与Object的最法区别是在静态类型检查上
  void _tips() {
    print('-----tips---------');
    /// dynamic: 动态数据类型，只有在运行的时候才确定是什么类型
    /// 可以定义所有数据类型，但是却使 dart语法检查失效；最好不要使用，容易带来额外隐患
    dynamic x = 'hal';
    print(x.runtimeType); //
    print(x);

    x = 11234;
    print(x.runtimeType);
    print(x);

    /// var：关键字，不关心数据类型是什么，系统去自动推断数据类型
    /// 类型一旦被定义无法被修改
    var a = 'hal';
    print(a.runtimeType);
    print(a);

//    a = 11234; // 会报错
//    print(a.runtimeType);
//    print(a);

    /// Object
    /// dart对象的基类
    Object o1 = '1111';
    print(o1.runtimeType);
    print(o1);
    o1 = 111;
    print(o1.runtimeType);
    print(o1);
  }


}
