//
//  PlayerInfo.swift
//  AppleMusicClone
//
//  Created by Aleck David Holly on 2025-11-15.
//

import SwiftUI

struct PlayerInfo: View {
    let size: CGSize
    @State private var slide: Bool = false
    @State private var textWidth: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: size.height / 4)
                .fill(.red.gradient)
                .frame(width: size.width, height: size.height)
            
            VStack(alignment: .leading, spacing: 6) {
                GeometryReader { geo in
                    HStack {
                        Text("Some Apple Music Title That Needs To Scroll For A Long Time")
                            .font(.callout)
                            .fixedSize()
                            .background(
                                GeometryReader { textGeo in
                                    Color.clear
                                        .onAppear {
                                            textWidth = textGeo.size.width
                                        }
                                }
                            )
                        
                        Text("Some Apple Music Title That Needs To Scroll For A Long Time")
                            .font(.callout)
                            .fixedSize()
                    }
                    .offset(x: slide ? -textWidth-6 : 0)
                    .animation(.spring(duration: 5).repeatForever(autoreverses: false), value: slide)
                    .onAppear {
                        slide.toggle()
                    }
                }
                .frame(height: 20)
                .clipped()
                
                
                
                Text("ImAleck")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    PlayerInfo(size: .init(width: 300, height: 300))
}
