import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare/redux/models/pet_model.dart';
import 'package:petcare/widgets/app_size.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';
import 'package:petcare/widgets/size_config.dart';

List<PetModel> petList = [
  PetModel(
      petName: "Lucky",
      petImg: "https://pngimg.com/uploads/dog/dog_PNG50334.png",
      petBreed: "American Foxhound",
      sex: "Male",
      petWeight: "2 kg"),
];

class PetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeFit.screenHeight / 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: petList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {}, //view pet detail
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue[50],
                              offset: Offset(4, 6),
                              blurRadius: 20,
                            ),
                          ]),
                      padding: EdgeInsets.only(top: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Image.network(petList[index].petImg),
                              width: SizeConfig.screenWidth / 2,
                              height: SizeConfig.screenHeight / 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: petList[index].petName,
                                  size: 22,
                                  color: ColorStyles.color_333333,
                                ),
                                Icon(
                                  petList[index].sex == "Male"
                                      ? Icons.male
                                      : Icons.female,
                                  color: petList[index].sex == "Male"
                                      ? Colors.lightBlueAccent
                                      : Colors.pinkAccent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: petList[index].petBreed,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: petList[index].petWeight,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
