//
//  Constants.swift
//  AkamTool
//
//  Created by Astin on 1/30/15.
//  Copyright (c) 2015 Astin. All rights reserved.
//

//var NSAppKitVersionNumberInt: Int32 { return Int32(floor(NSAppKitVersionNumber)) }


struct PathInfo {
    static let binSh = "/bin/sh"
    static let hostFile = "/etc/hosts"
}

// http://stackoverflow.com/questions/9208814/validate-ipv4-ipv6-and-hostname
// Leave (start ^) and (end $)
struct RegexInfo {
    static let ip4 = "\\s*((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))\\s*"
    static let ip6 = "\\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:)))(%.+)?\\s*"
    static let hostname = "\\s*((?=.{1,255}$)[0-9A-Za-z](?:(?:[0-9A-Za-z]|\\b-){0,61}[0-9A-Za-z])?(?:\\.[0-9A-Za-z](?:(?:[0-9A-Za-z]|\\b-){0,61}[0-9A-Za-z])?)*\\.?)\\s*"
}

struct BundleInfo {
    static let Version = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as String
    static let Build = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as String
    static let BundleName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as String
}

@objc class UserDefaultsKey {
    class var IgnoreApplicationFolderWarning: String { return "AKIgnoreApplicationFolder" }
    class var HotKey: String { return "AkamToolSettingKeyHotKey" }
    class var SelectedDictionaryName: String { return "SelectedDictionaryName" }
}


// MARK: - Dictionary
struct DictionaryName {
    static let Naver = "Naver"
    static let Daum = "Daum"
}

struct DictionaryInfoKey {
    static let Name = "Name"
    static let Title = "Title"
    static let URL = "URL"
    static let URLPattern = "URLPattern"
}

let DictionaryInfo = [
    [
        DictionaryInfoKey.Name: DictionaryName.Naver,
        DictionaryInfoKey.Title: "네이버 사전",
        DictionaryInfoKey.URL: "http://endic.naver.com/popManager.nhn?m=miniPopMain",
        DictionaryInfoKey.URLPattern: "[a-z]+(?=\\.naver\\.com)",
    ],
    [
        DictionaryInfoKey.Name: DictionaryName.Daum,
        DictionaryInfoKey.Title: "다음 사전",
        DictionaryInfoKey.URL: "http://small.dic.daum.net/",
        DictionaryInfoKey.URLPattern: "(?<=[?&]dic=)[a-z]+",
    ]
]


// MARK: - Google Analytics
struct AnalyticsCategory {
    static let Allkdic = "Allkdic"
    static let Preference = "Preference"
    static let About = "About"
}

struct AnalyticsAction {
    static let Open = "Open"
    static let Close = "Close"
    static let Dictionary = "Dictionary" // Use `DictionaryName` as Label
    static let Search = "Search"
    static let UpdateHotKey = "UpdateHotKey"
    static let CheckForUpdate = "CheckForUpdate"
    static let ViewOnGitHub = "ViewOnGitHub"
}

struct AnalyticsLabel {
    static let English = "English"
    static let Korean = "Korean"
    static let Hanja = "Hanja"
    static let Japanese = "Japanese"
    static let Chinese = "Chinese"
    static let French = "French"
    static let Russian = "Russian"
}