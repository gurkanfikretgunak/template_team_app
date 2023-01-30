import 'package:client/app/views/home/widgets/drop_down/city_list.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:flutter/material.dart';

class CountryDrop extends StatefulWidget {
  const CountryDrop({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final HomeViewModel provider;

  @override
  State<CountryDrop> createState() => _CountryDropState();
}

class _CountryDropState extends State<CountryDrop> {
  @override
  void initState() {
    super.initState();
    getList();
  }

  String _selectedState = "Turkey";
  List<String> _locationsList = [];
  String _selectedLocation = "Antalya";

  final List<String> _statesList = [];
  Future<void> getList() async {
    for (int i = 0; i < countryCity.length; i++) {
      _statesList.add(countryCity[i]["country"] as String);
    }
    _locationsList = countryCity[0]["city"] as List<String>;
    _selectedState = _statesList[0];
    _selectedLocation = _locationsList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    value: _selectedState,
                    hint: const Text("Country"),
                    isExpanded: true,
                    items: _statesList
                        .map((String item) => DropdownMenuItem<String>(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedState = newValue!;

                        int index = countryCity.indexWhere((element) => element["country"] == _selectedState);
                        _locationsList = countryCity[index]["city"] as List<String>;
                        _selectedLocation = _locationsList[0];
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                  ))),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: _selectedLocation,
                    hint: const Text("City"),
                    isExpanded: true,
                    items: _locationsList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue!;
                        widget.provider.ddLocationValue = newValue;
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                  ))),
        )
      ],
    );
  }
}
