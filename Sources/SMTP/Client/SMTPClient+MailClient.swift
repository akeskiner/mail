import Transport
import Mail

extension SMTPClient: MailClientProtocol {

    public convenience init() throws {
        guard let host = Provider.host else {
            throw Provider.Error.missingConfig("host")
        }
        guard let port = Provider.port else {
            throw Provider.Error.missingConfig("port")
        }
        guard let securityLayer = Provider.securityLayer else {
            throw Provider.Error.missingConfig("securityLayer")
        }
        try self.init(
            host: host,
            port: port,
            securityLayer: securityLayer,
            credentials: Provider.defaultCredentials
        )
    }

    public func send(_ emails: [Email]) throws {
        let _ = try send(emails, using: nil)
    }

}
