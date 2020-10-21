//
//  UIDevice+.swift
//  ThemeSwitcher
//
//  Created by Andrey Raevnev on 07.03.2020.
//  Copyright © 2020 Andrey Raevnev. All rights reserved.
//

import UIKit
public enum Device {
    case iPhoneSE1stGen
    case iPhoneSE2ndGen
    case iPhone8plus
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax

    case iPad
    case iPad8thGen
    case iPadAir3thGen
    case iPadAir4thGen
    case iPad9dot7
    case iPad11
    case iPad12dot9
    
    case tv
    case carPlay
    
    case mac
    
    case unknown
}

public extension UIDevice {
    
    static var iPhone5: Bool { return device == .iPhoneSE1stGen }
    static var iPhoneX: Bool { return device == .iPhone11 || device == .iPhone11Pro || device == .iPhone11ProMax }
    static var iPad: Bool { return device == .iPad }
    
    static var device: Device {
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            switch UIScreen.main.nativeBounds.height {
            case 1136:          return .iPhoneSE1stGen
            case 1334:          return .iPhoneSE2ndGen
            case 1920, 2208:    return .iPhone8plus
            case 1792:          return .iPhone11
            case 2436:          return .iPhone11Pro
            case 2688:          return .iPhone11ProMax
            default:            return .unknown
            }
        case .pad:
            switch UIScreen.main.nativeBounds.height {
            case 2160:          return .iPad8thGen
            case 2224:          return .iPadAir3thGen
            case 2360:          return .iPadAir4thGen
            case 2048:          return .iPad9dot7
            case 2388:          return .iPad11
            case 2732:          return .iPad12dot9
            default:            return .unknown
            }
        case .tv: return .tv
        case .carPlay: return .carPlay
        case .mac: return .mac
        case .unspecified: return .unknown
        @unknown default: return .unknown
        }
    }
    
    static func giveSizeForCurrentDevice() -> CGSize {
        return giveSize(for: self.device)
    }
    
    static func giveSize(for device: Device) -> CGSize {
        switch device {
        case .iPhoneSE1stGen:
            return CGSize(width: 320, height: 568)
        case .iPhoneSE2ndGen:
            return CGSize(width: 375, height: 667)
        case .iPhone8plus:
            return CGSize(width: 414, height: 736)
        case .iPhone11:
            return CGSize(width: 414, height: 896)
        case .iPhone11Pro:
            return CGSize(width: 375, height: 812)
        case .iPhone11ProMax:
            return CGSize(width: 414, height: 896)
        case .iPad8thGen:
            return CGSize(width: 810, height: 1080)
        case .iPadAir3thGen:
            return CGSize(width: 834, height: 1112)
        case .iPadAir4thGen:
            return CGSize(width: 820, height: 1180)
        case .iPad9dot7:
            return CGSize(width: 768, height: 1024)
        case .iPad11:
            return CGSize(width: 834, height: 1194)
        case .iPad12dot9:
            return CGSize(width: 1024, height: 1366)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
    
}
