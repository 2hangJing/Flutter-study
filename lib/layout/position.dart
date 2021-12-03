/*
 * @Author: monai
 * @Date: 2021-11-24 18:24:09
 * @LastEditors: monai
 * @LastEditTime: 2021-11-30 10:53:02
 */
/*
 * @Author: monai
 * @Date: 2021-11-24 14:48:04
 * @LastEditors: monai
 * @LastEditTime: 2021-11-24 17:32:20
 */
part of './main.dart';

class PositionLayoutWidget extends StatelessWidget {
    const PositionLayoutWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext content){
        return ConstrainedBox(
            // 宽度最小限制为全屏宽度，child Column 宽度则被限制在全屏
            constraints: BoxConstraints(minWidth: double.infinity, minHeight: 500),
            child: Container(
                width: double.infinity,
                height: 500,
                color: Colors.black26,
                child: Stack(
                    // 默认对其方式
                    alignment: AlignmentDirectional.center,
                    fit: StackFit.expand,
                    children: [
                        Container(
                            child: Text('没有定位，默认布局居中',style: TextStyle(color: Colors.white)),
                            color: Colors.red,
                        ),
                        Positioned(
                            bottom: 0,
                            left: 19.0,
                            child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.cyanAccent,
                                child: Text('Positioned left'),
                            ),
                        ),
                        Positioned(
                            top: 18.0,
                            child: Text('Positioned top'),
                        ),
                    ]
                )
            )
        );
    }
}