/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

				Button {
					withAnimation {
						showDetail.toggle()
					}
				} label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
						.rotationEffect(.degrees(self.showDetail ? 90 : 0))
						.scaleEffect(self.showDetail ? 1.5 : 1.0)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
					.transition(.asymmetric(insertion: .slide, removal: .scale))
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: DataRepository().hikes[0])
                .padding()
            Spacer()
        }
    }
}
