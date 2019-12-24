
class TestFunction{
  FunctonLearn functonLearn = FunctonLearn();
  void start(){
    print(functonLearn.sum(1, 4));
    functonLearn.anonymousFunction();
  }
}
 class FunctonLearn{
  /// 方法的构成
   /// 返回值 + 方法名 + 参数
   /// 其中：返回值类型可缺省，也可为void或具体的类型
   /// 方法名：匿名方法不需要方法名
   /// 参数：参数类型和参数名，参数类型可缺省(另外，参数又分为可选参数和默认参数，可选参考面向对象构造方法的参数)
   int sum(int val1,int val2){
     return val1 + val2;
   }
    /// 私有方法：
   /// 通过_开头命名的方法
   /// 作用域是当前文件
   _learn(){
     print('私有方法');
   }

   /// 匿名方法，没有名字的方法
   /// 大部分方法都带有名字，例如：main() 或者print()
   /// 在Dart中你有可以创建没有名字的方法， 称之为 匿名方法，有时候也被称为  lambda 或者 clo
   /// 可以吧匿名方法赋值给一个变量，然后你可以使用这个方法，比如添加到集合或者从集合中删除
   /// 匿名方法和命名方法看起来类似--在括号之间可以定义一些参数，参数使用逗号 分割，也可以是
   /// 后面打括号中的代码称为函数体：
   /// ([Type] param1[...,m]){ codeBack; }
 anonymousFunction(){
     var list = ['私有方法','匿名方法'];
     list.forEach((i){
       print(list.indexOf(i).toString() +": "+i);
     });
 }
 }