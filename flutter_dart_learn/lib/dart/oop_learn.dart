class Student extends Person {
  // 定义类的变量
  String _school; // 通过下划线来标示私有字段(变量)
  String city;
  String country;
  String name;

  /// 构造方法
  /// 通过this._school初始化自有参数
  /// name，age交给父类进行初始化
  /// city为可选参数
  /// country为默认参数，可选参数必须是默认参数
  Student(this._school, String name, int age,
      {this.city, this.country = 'China'})
      : // 初始化列表：除了调用父类构造器，在子类构造器方法体之前，也可以初始化实例变量，不同的初始化变量之间用逗号分隔
        name = '$country.$city',
        // 如果父类没有默认构造方法(无参的构造方法)，则需要在初始化列表中调用父类的构造方法进行初始化
        super(name, age) {
    // 构造方法体不是必须
    print('构造方法体不是必须的');
  }


  @override
  String toString() {
    return 'Student{name: $name school:${this._school}, city:$city,country:$country, ${super.toString()}';
  }

  /// getter:可以为私有字段设置 getter 来让外界获取到私有字段
  String get school=>_school;
  /// setter:可以为私有字段设置 setter 来控制外界对私有字段的修改
  set school(String value){
    _school = value;
  }


  /// 静态方法
  /// 静态方法通过类名来调用
  static doPrint(String str){
    print('doPrint:$str');
  }



  /// 命名构造方法:[类名 + . + 方法名]
  /// 使用命名构造方法为类实现多个构造方法
  /// 无论什么构造方法，都需要先调用父类的方法
  Student.cover(Student stu) : super(stu.name, stu.age) {
    print("命名构造方法");
  }

  /// 命名工厂构造方法：factory [类名+.+方法名]
  /// 它可以有返回值，而且不需要将类的final变量作为参数，是提供一种灵活获取类对象的方式
  factory Student.stu(Student stu){
    return Student(stu._school, stu.name, stu.age);
  }
}



/// 工厂构造方法--单例模式
class Logger{
  // 静态变量，类的实例
  static Logger _cache;
  /// 工厂构造方法：
  /// 不仅仅是构造方法，更是一种模式
  /// 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
  /// 那么可以使用工厂模式来定义构造方法
  factory Logger(){
    if(_cache == null){
      _cache = Logger._internal();
    }
    return _cache;
  }
  Logger._internal();
  void  log(String msg){
    print(msg);
  }
}



/// 定义一个Dart类，所有的类都继承自Object
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  /// 重写父类方法
  @override
  String toString() {
    return 'name:$name, age:$age';
//    return super.toString();
  }
}


/*抽象类和方法*/
/// 继承抽象类要实现它的抽象方法，否则需要将自己定义成抽象类
class StudyFlutter extends Study{
  @override
  void study() {
    print('abstract:Learning Flutter');
  }
}

/// 使用 abstract 修饰符来定义一个抽象类，该类不能被实例化。
/// 抽象类在定义接口的时候非常有用，可以有一个不包括方法体的方法
/// 可以有抽象方法，也可以没有抽象方法;如果一个类有抽象方法，必须标示为抽象类
abstract class Study{
  void study();

}

/*mixins*/
/// mixins： 为类添加一些特性，是在多个类层次结构中重用代码的一种方式
/// 要使用mixins，在width关键字后面跟上一个或多个mixin 的名字(用逗号分隔)，并且width要用在extends关键字之前
/// mixins的特征：实现 mixins，就创建一个继承 Object 类的子类(不能继承其他类)，不声明任何构造方法，不调用super

class Test extends Person with Study{
  Test(String name, int age) : super(name, age);

  // mixins: 复用已经存在的类的相关特性
  @override
  void study() {

  }


}