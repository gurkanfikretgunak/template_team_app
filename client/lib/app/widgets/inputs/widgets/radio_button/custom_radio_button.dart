import 'package:client/app/widgets/inputs/widgets/radio_button/radio_button_notifier.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RadioButtonNotifier>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          activeColor: ColorConstant.instance.purple2,
          selectedTileColor: ColorConstant.instance.purple2,
          title: Text(
            list[index],
            style: TextStyle(
              color: list[index] == provider.selectedOption
                  ? ColorConstant.instance.purple2
                  : ColorConstant.instance.dark0,
            ),
          ),
          value: list[index],
          groupValue: provider.selectedOption,
          onChanged: (value) {
            provider.setSelectedOption(value);
          },
        );
      },
    );
  }
}


// class CustomRadio extends StatefulWidget {
//   const CustomRadio({super.key});

//   @override
//   createState() {
//     return CustomRadioState();
//   }
// }

// class CustomRadioState extends State<CustomRadio> {
//   List<RadioModel> sampleData = [
//     RadioModel(false, 'A'),
//     RadioModel(false, 'A'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ListItem"),
//       ),
//       body: ListView.builder(
//         itemCount: sampleData.length,
//         itemBuilder: (BuildContext context, int index) {
//           return InkWell(
//             splashColor: Colors.blueAccent,
//             onTap: () {
//               setState(() {
//                 sampleData.forEach((element) => element.isSelected = false);
//                 sampleData[index].isSelected = true;
//               });
//             },
//             child: RadioItem(sampleData[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// class RadioItem extends StatelessWidget {
//   final RadioModel _item;
//   RadioItem(this._item);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(15.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           Container(
//             height: 50.0,
//             width: 50.0,
//             decoration: BoxDecoration(
//               color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
//               border: Border.all(
//                   width: 1.0,
//                   color: _item.isSelected ? Colors.blueAccent : Colors.grey),
//               borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 10.0),
//             child: Text(_item.text),
//           )
//         ],
//       ),
//     );
//   }
// }

// class RadioModel {
//   bool isSelected;
//   final String text;

//   RadioModel(this.isSelected, this.text);
// }
