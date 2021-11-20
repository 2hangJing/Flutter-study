/*
 * @Author: monai
 * @Date: 2021-11-17 17:48:41
 * @LastEditors: monai
 * @LastEditTime: 2021-11-19 10:35:55
 */
part of './main.dart';

class BaseButtonWidget extends StatelessWidget {
    Widget build(BuildContext ctx){
        return Center(
            child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                    ElevatedButton(
                        child: Text('ElevatedButton'),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            foregroundColor: MaterialStateProperty.all(Colors.white60),
                            overlayColor: MaterialStateProperty.all(Colors.indigo),
                        )
                    ),
                    TextButton(
                        child: Text('TextButton'),
                        onPressed: () {},
                    ),
                    OutlinedButton(onPressed: (){}, child: Text('OutlinedButton')),
                    IconButton(icon: Icon(Icons.auto_fix_high), onPressed: (){}),
                    ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.not_interested_rounded), label: Text('ElevatedButton 带 ICON')),
                    TextButton.icon(onPressed: (){}, icon: Icon(Icons.note), label: Text('TextButton 带 ICON')),
                    OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.one_k), label: Text('OutlinedButton 带 ICON')),
                ],
            )
        );
    }
}