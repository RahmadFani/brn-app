import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/peta_induk/providers/peta_induk.dart';
import 'package:brn/presentation/screens/peta_induk/widgets/filter_peta_induk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class PetaIndukScreen extends StatefulWidget {
  PetaIndukScreen({Key key}) : super(key: key);

  @override
  _PetaIndukScreenState createState() => _PetaIndukScreenState();
}

class _PetaIndukScreenState extends State<PetaIndukScreen> {
  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 8;

  @override
  void initState() {
    Future.microtask(() async {
      Provider.of<PetaIndukProvider>(context, listen: false).initialPetaInduk();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provPetaInduk = Provider.of<PetaIndukProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Peta Induk'),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                // swPanBoundary: LatLng(13, 77.5),
                // nePanBoundary: LatLng(13.07001, 77.58),
                center: provPetaInduk.statePetaInduk == sLoading
                    ? provPetaInduk.latLngList[0]
                    : provPetaInduk.statePetaInduk == sLoaded
                        ? provPetaInduk.latLngList[0]
                        : provPetaInduk.latLngList[0],
                bounds: LatLngBounds.fromPoints(provPetaInduk.latLngList),
                zoom: _zoom,
                plugins: [
                  MarkerClusterPlugin(),
                ],
                // onTap: (_) => _popupController.hidePopup(),
              ),
              layers: [
                TileLayerOptions(
                  minZoom: 2,
                  maxZoom: 18,
                  backgroundColor: Colors.black,
                  // errorImage: ,
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerClusterLayerOptions(
                  maxClusterRadius: 190,
                  disableClusteringAtZoom: 16,
                  size: Size(50, 50),
                  fitBoundsOptions: FitBoundsOptions(
                    padding: EdgeInsets.all(50),
                  ),
                  markers: provPetaInduk.markers,
                  polygonOptions: PolygonOptions(
                      borderColor: Colors.blueAccent,
                      color: Colors.black12,
                      borderStrokeWidth: 3),
                  popupOptions: PopupOptions(
                      popupSnap: PopupSnap.mapBottom,
                      popupController: _popupController,
                      popupBuilder: (_, marker) => Container(
                            margin: EdgeInsets.only(bottom: 30),
                            color: Colors.amberAccent,
                            //TODO ganti popup dengan keterangan
                            child: Text('Lokasi'),
                          )),
                  builder: (context, markers) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      child: Text('${markers.length}'),
                    );
                  },
                ),
              ],
            ),
            FilterPetaInduk()
          ],
        ));
  }
}
