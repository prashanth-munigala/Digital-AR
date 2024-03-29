//
//  EffectNodeHelper.swift
//  HertzARKit
//
//  Created by Vivekanandhan Sundarrajan on 4/19/19.
//  Copyright © 2019 Vivekanandhan Sundarrajan. All rights reserved.
//

import UIKit
import ARKit

class EffectNodeHelper: NSObject {
    
    static func getAlphaShader() -> SKShader {
        return SKShader(source: """
                                void main() {
                                vec2 texCoords = v_tex_coord;
                                vec2 colorCoords = vec2(texCoords.x, texCoords.y);
                                vec2 alphaCoords = vec2(texCoords.x, texCoords.y);
                                vec4 color = texture2D(u_texture, colorCoords);
                                float alpha = texture2D(u_texture, alphaCoords).r;
                                gl_FragColor = vec4(color.rgb, alpha);
                                }
                        """)
    }
    
    static func getHorizontalAlphaMaskShader() -> SKShader {
        return SKShader(source: """
                                void main() {
                                  vec2 texCoords = v_tex_coord;
                                  vec2 colorCoords = vec2((1.0 + texCoords.x) * 0.5, texCoords.y);
                                  vec2 alphaCoords = vec2(texCoords.x * 0.5, texCoords.y);
                                  vec4 color = texture2D(u_texture, colorCoords);
                                  float alpha = texture2D(u_texture, alphaCoords).r;
                                  gl_FragColor = vec4(color.rgb, alpha);
                                }
                                """)
    }
    
    static func getVerticalAlphaMaskShader() -> SKShader {
        return SKShader(source: """
                                void main() {
                                  vec2 texCoords = v_tex_coord;
                                  vec2 colorCoords = vec2(texCoords.x, (1.0 + texCoords.y) * 0.5);
                                  vec2 alphaCoords = vec2(texCoords.x, texCoords.y * 0.5);
                                  vec4 color = texture2D(u_texture, colorCoords);
                                  float alpha = texture2D(u_texture, alphaCoords).r;
                                  gl_FragColor = vec4(color.rgb, alpha);
                                }
                                """)
    }
}
