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

			MapView(searchKey: displaySearchKey)
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
