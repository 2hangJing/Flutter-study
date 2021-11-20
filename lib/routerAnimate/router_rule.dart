/*
 * @Author: monai
 * @Date: 2021-11-12 17:49:15
 * @LastEditors: monai
 * @LastEditTime: 2021-11-15 14:54:35
 */
part of './main.dart';

class RuleWidget extends StatelessWidget {
    RuleWidget({Key? key, required this.animation}): super(key: key);
    Animation<double> animation;

    Widget build(BuildContext ctx){
        return Scaffold(
            appBar: AppBar(
                title: Text('这是 title')
            ),
            body: AnimatedBuilder(
                animation: animation,
                child: Center(
                    child: Container(
                        child: TextButton(
                            child: Text('当前页面为 RULE，点击返回'),
                            onPressed: ()=> Navigator.pop(ctx, "已经打开过 Router one 页面了！")
                        ),
                    )
                ),
                builder: (BuildContext ctx, child){
                    return Center(
                        child: Opacity(child: Container(
                                width: animation.value * 200,
                                height: 200,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent
                                    ),
                                    child: child
                                )
                            ),
                            opacity: animation.value,
                        )
                    );
                }
            )
        );
    }
}