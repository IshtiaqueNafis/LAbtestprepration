import SwiftUI
import MapKit

struct MapView2: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotation = MKPointAnnotation()

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        annotation.coordinate = centerCoordinate // set the annotation's coordinate
        view.centerCoordinate = centerCoordinate // set the map view's center
        view.addAnnotation(annotation)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView2

        init(_ parent: MapView2) {
            self.parent = parent
        }

        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
}
