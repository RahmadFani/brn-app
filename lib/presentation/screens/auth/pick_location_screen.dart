import 'package:brn/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class PickLocationScreen extends StatefulWidget {
  Function(LatLng latLng) callback;
  PickLocationScreen({Key key, this.callback}) : super(key: key);
  @override
  _PetaIndukScreenState createState() => _PetaIndukScreenState();
}

class _PetaIndukScreenState extends State<PickLocationScreen> {
  MapController _mapController = MapController();
  LatLng latLng = LatLng(-6.949634, 107.571979);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.callback.call(latLng);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text('Pilih Lokasi'),
          ),
          body: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  // swPanBoundary: LatLng(13, 77.5),
                  // nePanBoundary: LatLng(13.07001, 77.58),
                  center: LatLng(-6.949634, 107.571979),
                  zoom: 10,
                  // plugins: [
                  //   MarkerClusterPlugin(),
                  // ],
                  onTap: (latLng) => setState(() => this.latLng = latLng),
                ),
                layers: [
                  TileLayerOptions(
                    minZoom: 2,
                    maxZoom: 18,
                    backgroundColor: Colors.white70,
                    // errorImage: ,
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(markers: [
                    Marker(
                        point: latLng,
                        builder: (context) => Icon(
                              Icons.pin_drop,
                              size: 48,
                              color: Colors.red[800],
                            ),
                        width: 48,
                        height: 40,
                        anchorPos: AnchorPos.align(AnchorAlign.top))
                  ]),
                ],
              ),
              Positioned(
                child: Text(
                  "${latLng.latitude} | ${latLng.longitude}",
                  textAlign: TextAlign.center,
                ),
                bottom: 20,
                left: 0,
                right: 0,
              )
            ],
          )),
    );
  }
}
