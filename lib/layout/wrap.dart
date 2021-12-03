/*
 * @Author: monai
 * @Date: 2021-11-24 14:48:04
 * @LastEditors: monai
 * @LastEditTime: 2021-11-24 17:32:20
 */
part of './main.dart';

class WrapLayoutWidget extends StatelessWidget {
    const WrapLayoutWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext content){
        return ConstrainedBox(
                    // 宽度最小限制为全屏宽度，child Column 宽度则被限制在全屏
            constraints: BoxConstraints(minWidth: double.infinity, minHeight: 500),
            child: Container(
                width: double.infinity,
                height: 500,
                color: Colors.black26,
                child: Wrap(
                    // // 主轴 X轴 相关【horizontal时X为主轴，vertical 时 Y为主轴】
                    // direction: Axis.horizontal,
                    // // X 轴间距
                    // spacing: 10,
                    // // Y 轴间距
                    // runSpacing: 30,
                    // alignment: WrapAlignment.center,
                    // // 交叉轴所有行看作一个整体的对其方式
                    // runAlignment: WrapAlignment.center,
                    // // 交叉轴每一行中，每一行的交叉轴对其方式
                    // crossAxisAlignment: WrapCrossAlignment.end,
                    // // 交叉轴的方向，down：从上往下，up: 从下网上排
                    // verticalDirection: VerticalDirection.up,


                    // 主轴为 Y轴
                    direction: Axis.vertical,
                    spacing: 15,
                    runSpacing: 60,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: [
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 1')),
                        Container(width: 50, height: 80, color: Colors.cyanAccent),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 3')),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 4')),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 5')),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 6')),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 7')),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 8')),
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('Elevated 9')),
                    ],
                ),
            )
        );
    }
}