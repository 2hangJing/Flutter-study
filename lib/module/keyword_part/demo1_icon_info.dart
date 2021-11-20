/*
 * @Author: monai
 * @Date: 2021-11-03 18:34:42
 * @LastEditors: monai
 * @LastEditTime: 2021-11-03 18:34:42
 */
part of 'demo1_main.dart';

Widget _buildIconInfo()=>Container(
	padding: EdgeInsets.only(left: 80, right: 80, top: 30),
	child: Row(
		mainAxisAlignment: MainAxisAlignment.spaceBetween,
		children: [
			Column(
				children: [
					Icon(
						Icons.phone,
						color: Colors.blue[400],
					),
					Container(
						margin: EdgeInsets.only(top: 10),
						child: Text('CALL'),
					)
				],
			),
			Column(
				children: [
					Icon(
						Icons.room_outlined,
						color: Colors.blue[400],
					),
					Container(
						margin: const EdgeInsets.only(top: 10),
						child: const Text(
							'ROUTE',
							style: TextStyle(
								color: Colors.blue
							),
						),
					)
				],
			),
			Column(
				children: [
					Icon(
						Icons.share,
						color: Colors.blue[400],
					),
					Container(
						margin: EdgeInsets.only(top: 10),
						child: Text('SHARE'),
					)
				],
			),
		],
	),
);