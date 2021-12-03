/*
 * @Author: monai
 * @Date: 2021-11-24 14:48:04
 * @LastEditors: monai
 * @LastEditTime: 2021-12-02 15:09:48
 */
part of './main.dart';

class AlignLayoutWidget extends StatelessWidget {
    const AlignLayoutWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext content){
        return ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Center(child: Container(
                        width: 150.w,
                        height: 150.w,
                        color: Colors.red[300],
                        child: Align(
                            widthFactor: null,
                            heightFactor: null,
                            // 实际偏移 = (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
                            // alignment: Alignment(3, 0),

                            // 实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
                            alignment: FractionalOffset.centerLeft,
                            child: Container(width: 50, height: 50, color: Colors.teal),
                        ),
                    ))
                ],
            )
        );
    }
}