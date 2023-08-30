
// class LinearColorPicker extends StatelessWidget {
//   Color _currColor(NoteModel note) => note.color ?? kDefaultNoteColor;
//
//   @override
//   Widget build(BuildContext context) {
//     NoteModel note = Provider.of<NoteModel>(context);
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//           children: kNoteColors.map((color) => InkWell(
//             child: Container(
//             ...
//             color: color,
//             child: color == _currColor(note) ? const Icon(Icons.check) : null,
//           ),
//             onTap: () {
//               if (color != _currColor(note)) {
//                 note.updateWith(color: color);
//               }
//             },
//           )).toList(),
//     ),
//     );
//   }
// }
