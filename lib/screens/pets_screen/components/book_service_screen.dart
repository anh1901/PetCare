import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/widgets/app_size.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

final Map<String, String> serviceTypes = {
  'Pickup': 'Pick Up',
  'StoreVisit': 'Store Visit',
};

class BookServiceScreen extends StatefulWidget {
  const BookServiceScreen(String currentAddress, String currentStore, {Key key})
      : super(key: key);

  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  String _selectedType = serviceTypes.keys.first;

  var today = new DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
  void onServiceTypeSelected(String serviceTypeKey) {
    setState(() {
      _selectedType = serviceTypeKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('createPet'),
      direction: DismissDirection.down,
      onDismissed: (_) => Navigator.pop(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFDDAE4E7),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CustomText(
              //     text: "Types of pet",
              //     size: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DropdownButton(
              //     isExpanded: true,
              //     hint: Text('Please choose a type of pet'),
              //     value: _selectedType,
              //     onChanged: (newValue) {
              //       setState(() {
              //         _selectedType = newValue;
              //       });
              //     },
              //     items: types.map((location) {
              //       return DropdownMenuItem(
              //         child: new Text(location),
              //         value: location,
              //       );
              //     }).toList(),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Select date",
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime newDateTime) {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Service Types",
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoRadioChoice(
                        choices: serviceTypes,
                        onChange: onServiceTypeSelected,
                        initialKeyValue: _selectedType,
                        selectedColor: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: ColorStyles.main_color,
                  child: MaterialButton(
                    minWidth: SizeFit.screenWidth,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      // bookService();
                    },
                    child: CustomText(
                        text: "Book Now",
                        size: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
