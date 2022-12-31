
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: ElevatedButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return Dialog(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                 elevation: 16,
//                 child: Container(
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: <Widget>[
//                       SizedBox(height: 20),
//                       Center(child: Text('Leaderboard')),
//                       SizedBox(height: 20),
//                       _buildRow('assets/choc.png', 'Name 1', 1000),
//                       _buildRow('assets/choc.png', 'Name 2', 2000),
//                       _buildRow('assets/choc.png', 'Name 3', 3000),
//                       _buildRow('assets/choc.png', 'Name 4', 4000),
//                       _buildRow('assets/choc.png', 'Name 5', 5000),
//                       _buildRow('assets/choc.png', 'Name 6', 6000),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         child: Text('Show dialog'),
//       ),
//     ),
//   );
// }
//
// Widget _buildRow(String imageAsset, String name, double score) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Column(
//       children: <Widget>[
//         SizedBox(height: 12),
//         Container(height: 2, color: Colors.redAccent),
//         SizedBox(height: 12),
//         Row(
//           children: <Widget>[
//             CircleAvatar(backgroundImage: AssetImage(imageAsset)),
//             SizedBox(width: 12),
//             Text(name),
//             Spacer(),
//             Container(
//               decoration: BoxDecoration(color: Colors.yellow[900], borderRadius: BorderRadius.circular(20)),
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//               child: Text('$score'),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }