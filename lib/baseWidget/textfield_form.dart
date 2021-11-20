/*
 * @Author: monai
 * @Date: 2021-11-19 14:48:16
 * @LastEditors: monai
 * @LastEditTime: 2021-11-20 18:09:51
 */
part of './main.dart';

class TextfieldFormWidget extends StatefulWidget{
    @override
    _TextfieldFormWidget createState()=> _TextfieldFormWidget();
}

class _TextfieldFormWidget extends State<TextfieldFormWidget>{
    bool isEnterComplete = false;
    // 通过 TextEditingController 获取输入框信息
    TextEditingController _textController = TextEditingController();
    // 焦点作用域
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();

    Color node1BorderColor = Colors.brown;

    @override
    void initState(){

        focusNode1.addListener(() {
            print(focusNode1.hasFocus);
            setState(() {
                if(focusNode1.hasFocus){
                    node1BorderColor = Colors.green;
                }else{
                    node1BorderColor = Colors.brown;
                }
            });
            
        });

        // 设置初始化值
        _textController.text='12345678910';
        _textController.selection = TextSelection(
            baseOffset: 1,
            extentOffset: 5
        );
        _textController.addListener(() { print('输入框输入内容为：' + _textController.text); });
    }

    Widget build(BuildContext context){
        return Container( height: 1000 ,child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
                Text('是否输入完成：$isEnterComplete'),
                Container(
                    width: 300,
                    child: TextField(
                        decoration : const InputDecoration(
                            label: Text('label'),
                            // labelText: 'labelText',
                            prefixIcon: Icon(Icons.phone_callback),
                            icon: Icon(Icons.phone_android_outlined),
                            helperText: 'helperText',
                            hintText: 'hintText',
                            suffixIcon: Icon(Icons.phone_missed),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.none,
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.amber
                        ),
                        textAlign: TextAlign.right,
                        autofocus: false,
                        // 是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
                        obscureText: false,
                        // 输入框多少行
                        // maxLines: 3,
                        maxLength: 30,
                        // maxLengthEnforcement: MaxLengthEnforcement
                        toolbarOptions: ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
                        onChanged: (String value){
                            setState((){ isEnterComplete = false; });
                        },
                        onSubmitted: (String value){
                            setState((){ isEnterComplete = true; });
                        },
                        cursorWidth: 4,
                        cursorRadius: Radius.circular(2.0),
                        cursorColor: Colors.amber
                    )
                ),
                const Padding(padding: EdgeInsets.only(top: 50), child: Text(
                    '登录输入框示例：',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),
                )),

                Container(
                    width: 350,
                    child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text('用户名'),
                            hintText: '用户名或邮箱',
                        ),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45
                        ),
                        autofocus: false,
                    )
                ),
                Container(
                    width: 350,
                    child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            label: Text('密码'),
                            hintText: '输入密码',
                        ),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45
                        ),
                        obscureText: true,
                    )
                ),

                const Padding(padding: EdgeInsets.only(top: 50), child: Text(
                    '焦点测试',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),
                )),

                Container(
                    width: 350,
                    child: TextField(
                        focusNode: focusNode1,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            label: Text('焦点输入框1111'),
                            hintText: '焦点输入框1111',
                            border: InputBorder.none
                        ),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45
                        ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: node1BorderColor,
                        )
                    ),
                ),
                Container(
                    width: 350,
                    child: TextField(
                        focusNode: focusNode2,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            label: Text('焦点输入框2222'),
                            hintText: '焦点输入框2222',
                            hintStyle: TextStyle(
                                color: Colors.tealAccent
                            ),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent))
                        ),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45
                        ),
                    ),
                ),

                ElevatedButton(
                    child: Text('转移焦点'),
                    onPressed: (){
                        FocusScopeNode scopeNode = FocusScope.of(context);
                        
                        scopeNode.requestFocus(focusNode1.hasFocus? focusNode2: focusNode1);
                    }
                ),
                ElevatedButton(
                    child: Text('取消所有焦点'),
                    onPressed: (){
                        FocusScopeNode scopeNode = FocusScope.of(context);

                        scopeNode.unfocus();
                    }
                ),

                const Padding(padding: EdgeInsets.only(top: 50), child: Text(
                    'Form 表单测试',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),
                )),

                Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    onChanged: (){ print('Form widget 里每个表单改动都会触发此回调'); },
                    child: Container(
                        width: 350,
                        child: Builder(builder: (BuildContext ctx){
                            return Column(children: [
                                TextFormField(
                                    decoration: const InputDecoration(
                                        icon: Icon(Icons.person),
                                        label: Text('用户名'),
                                        hintText: '用户名或邮箱',
                                    ),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black45
                                    ),

                                    // TextFormField 增加的几个方法、属性
                                    // 自动校验
                                    autovalidateMode: AutovalidateMode.always,
                                    // 初始化值
                                    initialValue: '',
                                    // 保存回调
                                    onSaved: (String? v){
                                        print('TextFormField 触发保存----------------：');
                                        print(v.toString());
                                    },
                                    validator: (String? v){
                                        print('TextFormField 触发校验----------------：');
                                        print(v.toString());

                                        return v == null || v.length >= 6? null: '大于6位字符！';
                                    }
                                ),
                                TextFormField(
                                    decoration: const InputDecoration(
                                        icon: Icon(Icons.lock),
                                        label: Text('密码'),
                                        hintText: '输入密码',
                                    ),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black45
                                    ),
                                    // 自动校验
                                    autovalidateMode: AutovalidateMode.disabled,
                                    validator: (v) {
                                        return v!.trim().length > 5 ? null : "密码不能少于6位";
                                    },
                                ),
                                ElevatedButton(
                                    child: Text('登录'),
                                    onPressed: (){
                                        FormState? f = Form.of(ctx);

                                        if(f != null){
                                            f.save();
                                            f.validate();
                                        }
                                    }
                                )
                            ]);
                        })
                    ),

                )


            ],
        ));
    }
}