import 'dart:async';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/views/maps/maps.viewmodel.dart';
import 'package:client/app/views/maps/widgets/maps_permission.widget.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_l10n.dart';

class MapsViewWidget extends StatefulWidget with MapsPermissionsWidget {
  const MapsViewWidget({Key? key}) : super(key: key);

  @override
  State<MapsViewWidget> createState() => _MapsViewWidgetState();
}

class _MapsViewWidgetState extends State<MapsViewWidget> {
  final List<Marker> _markers = <Marker>[];

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

                // ignore: use_build_context_synchronously
                bottomSheet(context, provider);
              });
            },
            child: Icon(
              Icons.my_location_outlined,
              color: ColorConstant.instance.purple2,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> bottomSheet(BuildContext context, MapsViewModel provider) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: context.paddingNormal,
          child: SizedBox(
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.my_location_outlined,
                      color: ColorConstant.instance.purple2,
                    ),
                    context.emptySizedWidthBoxNormal,
                    Text(
                      currentAddress!,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 25),
                    ),
                  ],
                ),
                Text(
                  "${L10n.of(context)!.useLocationInApp} ?",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 15),
                ),
                Center(
                  child: SizedBox(
                    width: context.mediaQuery.size.width,
                    child: CustomElevatedButton(
                      text: L10n.of(context)!.confirmLocation,
                      buttonColor: ButtonColor.purple,
                      textColor: ButtonColor.light,
                      onPressed: () {
                        _getCurrentPosition;
                        provider.showButton();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
