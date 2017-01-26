import Vapor
import Transport

public final class Provider: Vapor.Provider {

    static var host: String?
    static var port: Int?
    static var securityLayer: SecurityLayer?
    static var defaultCredentials: SMTPCredentials?

    public enum Error: Swift.Error {
        case noSMTPConfig
        case missingConfig(String)
    }

    public convenience init(config: Vapor.Config) throws {
        guard let smtp = config["smtp"]?.object else {
            throw Error.noSMTPConfig
        }
        guard let host = smtp["host"]?.string else {
            throw Error.missingConfig("host")
        }
        guard let port = smtp["port"]?.int else {
            throw Error.missingConfig("port")
        }
        guard let securityLayerString = smtp["securityLayer"]?.string else {
            throw Error.missingConfig("securityLayer")
        }
        var securityLayer = SecurityLayer.tls(nil) // TODO: fix - Droplet+TLS has parsing for security layer config
        var defaultCredentials: SMTPCredentials? = nil
        if
            let user = smtp["user"]?.string,
            let pass = smtp["password"]?.string
        {
            defaultCredentials = SMTPCredentials(user: user, pass: pass)
        }

        try self.init(
            host: host,
            port: port,
            securityLayer: securityLayer,
            defaultCredentials: defaultCredentials
        )
    }

    public init(
        host: String,
        port: Int,
        securityLayer: SecurityLayer,
        defaultCredentials: SMTPCredentials? = nil
    ) throws {
        Provider.host = host
        Provider.port = port
        Provider.securityLayer = securityLayer
        Provider.defaultCredentials = defaultCredentials
    }

    public func boot(_ drop: Droplet) {
        // TODO: Uncomment when Droplet has `mailer` property.
        // if let existing = drop.mailer {
        //     print("SMTPClient will overwrite existing mailer: \(type(of: existing))")
        // }
        // drop.mailer = SMTPClient<TCPClientStream>.self
    }

    public func afterInit(_ drop: Droplet) {

    }

    public func beforeRun(_ drop: Droplet) {

    }

}
