import XCTest
import Mail
import ConsoleMailClient

class ConsoleMailClientTests: XCTestCase {
    static let allTests = [
        ("testSendEmail", testSendEmail),
        ("testSendMultipleEmails", testSendMultipleEmails),
    ]

    func testSendEmail() throws {
        let mailer = ConsoleMailClient.MailClient()
        let email = Email(from: "from@email.com",
                          to: "to1@email.com", "to2@email.com",
                          subject: "Email Subject",
                          body: "Hello Email")
        let attachment = EmailAttachment(filename: "dummy.data",
                                         contentType: "dummy/data",
                                         body: [1,2,3,4,5])
        email.attachments.append(attachment)
        try mailer.send(email)
    }

    func testSendMultipleEmails() throws {
        let mailer = ConsoleMailClient.MailClient()
        let emails = [
            Email(from: "from@email.com", to: "to@email.com", subject: "Email1", body: "Email1 body"),
            Email(from: "from@email.com", to: "to@email.com", subject: "Email2", body: "Email2 body"),
            Email(from: "from@email.com", to: "to@email.com", subject: "Email3", body: "Email3 body"),
        ]
        try mailer.send(emails)
    }

}
