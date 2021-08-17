import SwiftUI
import MapKit

struct HomeView: View {
	@State var inputText: String = ""
	@State var displaySearchKey = ""
	@State var displayMapType: MKMapType = .standard
	var body: some View {
		VStack {
			TextField(
				"キーワードを入力してください",
				text: $inputText,
				onCommit: {
					displaySearchKey = inputText
				}
			)
			.padding()
			ZStack(alignment: .bottomTrailing) {
				MapView(searchKey: displaySearchKey, mapType: displayMapType)
				Button(action: {
					if displayMapType == .standard {
						displayMapType = .satellite
					} else if displayMapType == .satellite {
						displayMapType = .hybrid
					} else if displayMapType == .hybrid {
						displayMapType = .satelliteFlyover
					} else if displayMapType == .satelliteFlyover {
						displayMapType = .hybridFlyover
					} else if displayMapType == .hybridFlyover {
						displayMapType = .mutedStandard
					} else {
						displayMapType = .standard
					}
				},
				label: {
					Image(systemName: "map")
						.resizable()
						.frame(width: 35.0, height: 35.0, alignment: .leading)
				})
				.padding(.trailing, 20.0)
				.padding(.bottom, 30.0)
			}
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
