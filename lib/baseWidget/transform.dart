/*
 * @Author: monai
 * @Date: 2021-12-02 15:29:45
 * @LastEditors: monai
 * @LastEditTime: 2021-12-02 18:10:30
 */
part of './main.dart';

class TransformWidget extends StatelessWidget {
    TransformWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext context){
        return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: double.infinity),
            child: Column(children: [
                Container(
                    width: 50,
                    height: 30,
                    color: Colors.amber,
                    child: Transform.translate(
                        offset: Offset(20, 20),
                        child: Container(child: Text('平移'), color: Colors.cyan),
                    )
                ),

                Padding(padding: EdgeInsets.only(top: 50, bottom: 10), child: Text('旋转')),
                Container(
                    width: 50,
                    height: 30,
                    color: Colors.amber,
                    
                    // 按照Z轴 二维旋转
                    // child: Transform.rotate(
                    //     alignment: Alignment.centerLeft,
                    //     // 旋转 90°，角度分别为：1-2 象限： -180-0，3-4象限：180-0
                    //     // 参考：https://juejin.cn/post/7005347352798035999#heading-8
                    //     angle: pi/2,
                    //     child: Container( color: Colors.cyan, child: Text('--->')),
                    // )

                    // 3D 反转
                    child: Transform(
                        transform: Matrix4.rotationX(pi/3),
                        child: Container( color: Colors.cyan, child: Text('--->')),
                    )
                ),

                Padding(padding: EdgeInsets.only(top: 50, bottom: 10), child: Text('缩放')),
                Container(
                    width: 50,
                    height: 30,
                    color: Colors.amber,
                    // 3D 反转
                    child: Transform.scale(
                        scale: 0.5,
                        child: Container(color: Colors.cyan, child: Text('缩放')),
                    )
                ),

                Padding(padding: EdgeInsets.only(top: 50, bottom: 10), child: Text(' RotatedBox 影响其他元素')),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('正常元素', style: TextStyle(color: Colors.green, fontSize: 18.0),),
                        Container(
                            width: 50,
                            height: 30,
                            color: Colors.cyan,
                            // 3D 反转
                            child: Transform.rotate(
                                angle:  pi/2,
                                child: Container(color: Colors.cyan, child: Text('不影响元素的旋转 -->')),
                            )
                        ),
                        Container(
                            width: 100,
                            height: 30,
                            color: Colors.amber,
                            // 3D 反转
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Text('影响布局的旋转 -->'),
                            )
                        ),
                        Text('正常元素', style: TextStyle(color: Colors.green, fontSize: 18.0),),

                    ],
                )

            ])
        );
    }
}