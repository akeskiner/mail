/**
    A simple protocol for any mechanism that allows the sending of emails.

    Does not handle complications such as: variable authentication per send or
    storing and re-using connections. Individual mail clients are expected to
    implement these additional features as appropriate.

        try Client.send(email1, email2)

    or

        let client = try Client.make()
        try client.send(email1, email2, ...)

    or

        let client = try Client.make()
        try client.send([email1, email2])
*/
public protocol MailClientProtocol {

    /*
        MailClient must be able to init without arguments. Store configuration
        loaded by the Provider in static vars on your MailClient, and throw if
        configuration has not been provided.
    */
    init() throws

    /*
        Send one or more emails, re-using the same connection where appropriate
    */
    func send(_ emails: [Email]) throws

}

extension MailClientProtocol {

    /*
        Create and return an instance of the MailClient
    */
    public static func make() throws -> Self {
        return try Self.init()
    }

    /*
        Send one or more emails, re-using the same connection where appropriate
    */
    public func send(_ emails: Email...) throws {
        try send(emails)
    }

    /*
        Send one or more emails, re-using the same connection where appropriate
    */
    public static func send(_ emails: [Email]) throws {
        try make().send(emails)
    }

    /*
        Send one or more emails, re-using the same connection where appropriate
    */
    public static func send(_ emails: Email...) throws {
        try send(emails)
    }

}
