//
//  ISensores.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/24/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit

protocol ISensores: Codable {
    func onGettingAllPosts(posts: [Sensores])
}
