import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let annotation = MKPointAnnotation()
    @ObservedObject var viewModel = PostViewModel()
    var body: some View {
        
        TabView {
            MapView2(centerCoordinate: $region.center, annotation: annotation)
                .frame(height: 300)
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Map")
                }
            NavigationView {
                List(viewModel.posts) { listedPost in
                    NavigationLink(destination:PostDetailsView(post: listedPost)){
                        Text(listedPost.title)
                    }
                    
                }
                .navigationBarTitle("List")
            }
            .tabItem {
                Image(systemName: "2.circle")
                Text("Second")
            }
        }
        .onAppear{
            viewModel.fetchItems()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
