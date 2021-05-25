//
//  Wallet.swift
//  Summer
//
//  Created by Arturo Jamaica on 2021/05/23.
//

import Foundation

public protocol Wallet: Hashable  {
    associatedtype T : Token
    var pubkey: String? { get }
    var lamports: UInt64? { get }
    var token: T { get }
    var userInfo: AnyHashable? { get }
    var liquidity: Bool? { get }
}

extension Wallet {
    func shortPubkey(numOfSymbolsRevealed: Int = 4) -> String {
        guard let pubkey = pubkey else { return ""}
        return pubkey.prefix(numOfSymbolsRevealed) + "..." + pubkey.suffix(numOfSymbolsRevealed)
    }
}

struct SummerWallet: Wallet {

    var pubkey: String?
    var lamports: UInt64?
    var token: SummerToken
    var userInfo: AnyHashable?
    let liquidity: Bool?
    
    init(pubkey: String? = nil, lamports: UInt64? = nil, token: SummerToken, liquidity: Bool? = false) {
        self.pubkey = pubkey
        self.lamports = lamports
        self.token = token
        self.liquidity = liquidity
    }
}
