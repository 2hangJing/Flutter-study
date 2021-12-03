/*
 * @Author: monai
 * @Date: 2021-11-30 14:02:31
 * @LastEditors: monai
 * @LastEditTime: 2021-11-30 15:05:56
 */
part of './main.dart';

class ReponseColumnWidget extends StatelessWidget {
    ReponseColumnWidget({Key? key, required this.childNum}): super(key: key);

    int childNum = 0;

    @override
    Widget build(BuildContext context)=> LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

            List<Widget> childWidgets = [];
            Widget resultWidget;

            for(int i = 0; i<childNum; i++){
                childWidgets.add(Text('当前 index: ${i}'));
            }

            if(constraints.maxWidth < 200){

                resultWidget = Column(children: childWidgets);

                
            }else{
                List<Widget> column1 = [];
                List<Widget> column2 = [];

                for(int i = 0; i<childWidgets.length; i++){

                    if(i % 2 == 0){
                        column1.add(childWidgets[i]);
                    }else{
                        column2.add(childWidgets[i]);
                    }
                }

                resultWidget = Row(
                    children: [Column(children: column1), Column(children: column2)],
                    mainAxisAlignment : MainAxisAlignment.spaceAround
                );
            }

            // 打印布局日志
            assert(() {
                print('${key ?? resultWidget}: $constraints');
                return true;
            }());

            return resultWidget;
        }
    );
}

class LayoutBuilderWidget extends StatelessWidget {
    LayoutBuilderWidget({Key? key}): super(key: key);

    @override
    Widget build(BuildContext context){
        return Column(
            children: [
                Row(children: [
                    Text('宽度为150， 小于200，单列布局：', style: TextStyle(color: Colors.blueAccent, fontSize: 16)),
                    Container(constraints: BoxConstraints(maxWidth: 150), child: ReponseColumnWidget(childNum: 6))
                ]),
                Row(children: [
                    Text('宽度为230， 大于200，双列布局：', style: TextStyle(color: Colors.blueAccent, fontSize: 16)),
                    Container(constraints: BoxConstraints(maxWidth: 230), child: ReponseColumnWidget(childNum: 6))
                ])
            ],
        );
    }
}