/*
 * @Author: monai
 * @Date: 2021-11-19 11:36:07
 * @LastEditors: monai
 * @LastEditTime: 2021-11-19 14:43:02
 */
part of './main.dart';


class SwitchCheckboxWidget extends StatefulWidget {
    const SwitchCheckboxWidget({Key? key}): super(key: key);

    @override
    _SwitchCheckboxWidget createState()=> _SwitchCheckboxWidget();
}

class _SwitchCheckboxWidget extends State<SwitchCheckboxWidget> {
    bool switchBtnStatus = false;
    Map<String, bool> checkboxStatusMap = {
        'checkBox1': false,
        'checkBox2': true,
    };

    Widget build(BuildContext content){
        return Center(
            child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                    Text(
                        'switch 状态：$switchBtnStatus',
                        style: TextStyle(
                            color: switchBtnStatus? Colors.amber: Colors.black,
                            fontSize: 20
                        ),
                    ),
                    Switch(
                        activeColor: Colors.deepOrange,
                        value: switchBtnStatus,
                        onChanged: (bool status){
                            setState(() {
                                switchBtnStatus = status;
                            });
                        }
                    ),
                    Text(
                        'Checkbox1 状态：' + checkboxStatusMap['checkBox1'].toString(),
                        style: TextStyle(
                            color: checkboxStatusMap['checkBox1']! ? Colors.amber: Colors.black,
                            fontSize: 20
                        ),
                    ),
                    Text(
                        'Checkbox2 状态：' + checkboxStatusMap['checkBox2'].toString(),
                        style: TextStyle(
                            color: checkboxStatusMap['checkBox2']! ? Colors.amber: Colors.black,
                            fontSize: 20
                        ),
                    ),
                    Row(
                        children: [
                            Checkbox(
                                value: checkboxStatusMap['checkBox1'],
                                onChanged: (bool? status){
                                    setState(() {
                                        checkboxStatusMap['checkBox1'] = status!;
                                    });
                                }
                            ),
                            Checkbox(
                                value: checkboxStatusMap['checkBox2'],
                                onChanged: (bool? status){
                                    setState(() {
                                        checkboxStatusMap['checkBox2'] = status!;
                                    });
                                }
                            )
                        ],
                    )
                ],
            )
        );
    }
    
}


