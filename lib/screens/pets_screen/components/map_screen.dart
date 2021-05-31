import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petcare/widgets/app_size.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

import 'book_service_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position _currentPosition;
  String _currentAddress;
  String _currentStore;
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(10.773213, -122.232421), zoom: 11.5);
  GoogleMapController _googleMapController;
  Marker _origin;
  Marker _destination;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    Geolocator.getCurrentPosition().then((value) => _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(value.latitude, value.longitude), zoom: 11.5))));
  }

  @override
  void dispose() {
    super.dispose();
    _googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomText(text: 'Select your location'),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: _origin.position,
                zoom: 20,
                tilt: 50.0,
              ))),
              style: TextButton.styleFrom(
                primary: ColorStyles.white,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: Icon(Icons.home),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: _destination.position,
                zoom: 20,
                tilt: 50.0,
              ))),
              style: TextButton.styleFrom(
                  primary: ColorStyles.color_666666,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600)),
              child: Icon(Icons.pets),
            ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: {
                if (_origin != null) _origin,
                if (_destination != null) _destination,
              },
              onTap: _addMarker,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: SizeFit.screenHeight / 13,
              child: Container(
                color: ColorStyles.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = _currentAddress != null ? _currentAddress : "",
                    decoration: InputDecoration(
                      focusColor: ColorStyles.white,
                      fillColor: Colors.white70,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    maxLines: 1,
                    autofocus: false,
                    onChanged: (String location) {
                      getYourLocation(location);
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: SizeFit.screenHeight / 13,
              width: SizeFit.screenWidth / 3,
              child: Container(
                color: ColorStyles.white,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            ColorStyles.main_color),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(ColorStyles.white),
                      ),
                      onPressed: (_origin != null && _currentAddress != null)
                          ? () {
                              showModal(context);
                            }
                          : null,
                      child: Text('Choose store'),
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorStyles.main_color,
        foregroundColor: ColorStyles.black,
        onPressed: () async {
          _getCurrentLocation();
          print(_origin);
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (builder) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.grey[800],
            height: SizeFit.screenHeight * 0.7,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0)),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(right: 50.0, left: 50.0),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey[200]),
                    )),
                    child: Center(
                      child: CustomText(
                        text: 'Choose the store',
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: ListView.separated(
                      itemCount: 10,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(""),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Store title'),
                                    Container(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text('Location'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorStyles.main_color),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorStyles.white),
                                  ),
                                  onPressed: (true)
                                      ? () {
                                          _currentStore = "";
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .bottomToTop,
                                                  child: BookServiceScreen(
                                                      _currentAddress,
                                                      _currentStore)));
                                        }
                                      : null,
                                  child: Text('Choose'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin == null ||
        _origin.position != pos ||
        (_origin != null && _destination != null)) {
      setState(() async {
        _origin = Marker(
            markerId: const MarkerId('_origin'),
            infoWindow: const InfoWindow(title: 'Your location'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);
        //_destination = null;
        try {
          List<Placemark> placemarks =
              await placemarkFromCoordinates(pos.latitude, pos.longitude);
          Placemark place = placemarks[0];
          setState(() {
            _currentAddress =
                "${place.street},${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
          });
          print(_currentAddress);
        } catch (e) {
          print(e);
        }
      });
    }
    // if (_destination == null) {
    //   setState(() {
    //     _destination = Marker(
    //         markerId: const MarkerId('_destination'),
    //         infoWindow: const InfoWindow(title: 'Store'),
    //         icon:
    //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    //         position: pos);
    //   });
    // }
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((value) => {
          setState(() {
            _currentPosition = value;
            _getAddressFromLatLng();
          }),
          _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(value.latitude, value.longitude), zoom: 20.5)))
        });
    setState(() {
      _origin = Marker(
        markerId: const MarkerId('_origin'),
        infoWindow: const InfoWindow(title: 'Your location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      );
      //_destination = null;
    });
    print(_currentPosition);
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            "${place.street},${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
      });
      print(_currentAddress);
    } catch (e) {
      print(e);
    }
  }

  getYourLocation(String location) {
    this._currentAddress = location;
  }
}
