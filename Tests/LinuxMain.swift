#if os(Linux)

import XCTest

@testable import MailModelsTests
@testable import ConsoleMailClientTests
@testable import InMemoryMailClientTests
@testable import SMTPTests

XCTMain([
    // Mail Models Tests
    testCase(EmailAddressTests.allTests),
    testCase(EmailAttachmentTests.allTests),
    testCase(EmailBodyTests.allTests),

    // ConsoleMailClientTests
    testCase(ConsoleMailClientTests.allTests),

    // InMemoryMailClientTests
    testCase(InMemoryMailClientTests.allTests),

    // SMTPTestSuite
    testCase(SMTPClientConvenienceTests.allTests),
    testCase(SMTPClientErrorTests.allTests),
    testCase(SMTPClientTests.allTests),
    testCase(SMTPCredentialsTests.allTests),
    testCase(SMTPExtensionsTests.allTests),
    testCase(SMTPGreetingTests.allTests),
    testCase(SMTPUUIDTests.allTests),
])

#endif
