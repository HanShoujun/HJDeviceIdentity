import KeychainAccess
import AdSupport


struct IdentifierConfig {
    static let KIdentifier = "KIdentifier"

    /// idfa 校验正则：都是0
    static let InvalidIdfaRegex = #"^0+$"#
}

public struct HJDeviceIdentity {

    private static let keychain = Keychain()

    public static var identifier: String {
        /// 获取keychain中的标识
        if let id = getIdentifierInKeychain() {
            return id
        }

        /// keychain中没有，就从idfa或uuid中获取一个有效的标识
        let validId = getValidIdentifier()
        /// 存储标识
        saveIdentifierInKeychain(validId)
        return validId
    }

    static func getValidIdentifier() -> String {
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        if ad_isValidFor(idfa: idfa) {
            return idfa
        }
        return UUID().uuidString
    }

    static func ad_isValidFor(idfa: String) -> Bool {
        let cleanIdfa = idfa.replacingOccurrences(of: "-", with: "")
        let range = cleanIdfa.range(of: IdentifierConfig.InvalidIdfaRegex, options: .regularExpression, range: nil, locale: nil)
        return range == nil
    }

    static func getIdentifierInKeychain() -> String? {
        return keychain[IdentifierConfig.KIdentifier]
    }

    static func saveIdentifierInKeychain(_ id: String) {
        try? keychain.set(id, key: IdentifierConfig.KIdentifier)
    }
}
