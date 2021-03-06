import PackageDescription

let package = Package(
    name: "bookshelfApi",
    dependencies: [
            .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 0),
            .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 0),
            .Package(url: "https://github.com/IBM-Swift/Kitura-CouchDB.git", majorVersion: 1, minor: 0),
        ]
)
