/*
 * @Author: monai
 * @Date: 2021-11-24 14:48:04
 * @LastEditors: monai
 * @LastEditTime: 2021-11-24 16:36:18
 */
part of './main.dart';

class FlexibleLayoutWidget extends StatelessWidget {
    const FlexibleLayoutWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext content){
        return ConstrainedBox(
                    // 宽度最小限制为全屏宽度，child Column 宽度则被限制在全屏
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            Container(color: Colors.cyan, width: 100, height: 30, child: Text('主轴反向对其')),
                            Container(color: Colors.deepOrange, width: 150, height: 30, child: Text('占比 1')),
                            Container(color: Colors.blue, width: 150, height: 30, child: Text('占比 1'))
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Expanded(
                                flex: 1,
                                child: Container(color: Colors.cyan, height: 30, child: Text('占比 1'),)
                            ),
                            // 空占位
                            Spacer(flex: 1),
                            Expanded(
                                flex: 1,
                                child: Container(color: Colors.deepOrange, height: 50, child: Text('占比 2'))
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(color: Colors.blue, height: 30, child: Text('占比 2'))
                            )
                        ],
                    ),
                    Container(
                        color: Colors.cyanAccent,
                        height: 300,
                        width: double.infinity,
                        child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: double.infinity),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Spacer(flex: 1),
                                    Expanded(
                                        flex: 4,
                                        child: Container(color: Colors.green, height: 20, child: Text('占比 4'),)
                                    ),
                                    Spacer(flex: 1),
                                    Expanded(
                                        flex: 1,
                                        child: Container(color: Colors.brown, height: 20, child: Text('占比 1'),)
                                    ),
                                ],
                            ),
                        )
                    )
                ],
            )
        );
    }
}