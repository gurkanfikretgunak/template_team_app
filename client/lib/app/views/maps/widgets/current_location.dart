import 'dart:async';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/maps/maps.viewmodel.dart';
import 'package:client/app/views/maps/widgets/maps_permission.widget.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class MapsViewWidget extends StatefulWidget with MapsPermissionsWidget {
  const MapsViewWidget({Key? key}) : super(key: key);

  @override
  State<MapsViewWidget> createState() => _MapsViewWidgetState();
}

class _MapsViewWidgetState extends State<MapsViewWidget> {
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(38.392300, 28.979530),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  String? currentAddress;
  Position? _currentPosition;

  static const _initialCameraPosition =
      CameraPosition(target: LatLng(38.392300, 27.047840), zoom: 11.5);
  final Completer<GoogleMapController> _controller = Completer();

  Future<void> _getCurrentPosition() async {
    final hasPermission =
        await MapsPermissionsWidget.handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    final provider = Provider.of<HomeViewModel>(context, listen: false);
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        currentAddress = place.subLocality;
        provider.ddLocationValueSt = currentAddress!;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MapsViewModel>(context);

    return Stack(
      children: [
        GoogleMap(
          markers: Set<Marker>.of(_markers),
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationEnabled: false,
        ),
        Positioned(
          top: 20,
          left: MediaQuery.of(context).size.width / 1.2,
          child: FloatingActionButton(
            backgroundColor: ColorConstant.instance.light4,
            onPressed: () async {
              _getCurrentPosition().then((value) async {
                // marker added for current users location
                _markers.add(Marker(
                    markerId: const MarkerId("2"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueViolet),
                    position: LatLng(_currentPosition!.latitude,
                        _currentPosition!.longitude),
                    infoWindow: InfoWindow(title: '$currentAddress')));
                // specified current users location
                CameraPosition cameraPosition = CameraPosition(
                    target: LatLng(_currentPosition!.latitude,
                        _currentPosition!.longitude),
                    zoom: 14);

                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            child: Icon(
              Icons.my_location_outlined,
              color: ColorConstant.instance.purple2,
            ),
          ),
        ),
        Positioned(
            bottom: 50,
            left: 100,
            right: 100,
            child: CustomElevatedButton(
              text: "Confirm Location",
              buttonColor: ButtonColor.purple,
              buttonSize: ButtonSize.medium,
              textColor: ButtonColor.light,
              onPressed: () {
                _getCurrentPosition;

                provider.showButton();
              },
            ))
      ],
    );
  }
}
