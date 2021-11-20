/*
 * @Author: monai
 * @Date: 2021-11-03 18:35:30
 * @LastEditors: monai
 * @LastEditTime: 2021-11-03 18:35:31
 */
part of 'demo1_main.dart';

Widget _buildTextInfo()=>Container(
	padding: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 50),
	child: const Text(
		'''
			(17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			I/RmeSchedManager(17693): SetMarginData, input:3, animation:4, traversal:4, util:600, frameRate:60
			I/View    (17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			I/chatty  (17693): uid=10140(com.example.flutter_demo) identical 2 lines
			I/View    (17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			I/RmeSchedManager(17693): SetMarginData, input:3, animation:4, traversal:4, util:600, frameRate:60
			5
			I/View    (17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			I/RmeSchedManager(17693): SetMarginData, input:3, animation:4, traversal:4, util:600, frameRate:60
			I/View    (17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			W/HiTouch_PressGestureDetector(17693): Touch pointer move a lot. The moving distance of X is:16.48291, limit is:51The moving distance of Y is:55.184082, limit is:51
			I/View    (17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			I/chatty  (17693): uid=10140(com.example.flutter_demo) identical 1 line
			I/View    (17693): requestUnbufferedDispatch window com.example.flutter_demo/com.example.flutter_demo.MainActivity
			I/RmeSchedManager(17693): SetMarginData, input:3, animation:4, traversal:4, util:600, frameRate:60
		''',
		// textAlign: TextAlign.justify,
		softWrap: true
	)
);