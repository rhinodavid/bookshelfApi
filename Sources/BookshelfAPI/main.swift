import CouchDB
import HeliumLogger
import Foundation
import Kitura
import LoggerAPI
import SwiftyJSON

// disable buffering
setbuf(stdout, nil)

// attach logger
Log.logger = HeliumLogger()

let connectionProperties = ConnectionProperties(
  host: "localhost",
  port: 5984,
  secured: false,
  username: "root",
  password: "{password}"
)

let databaseName = "bookshelf_db"

let client = CouchDBClient(connectionProperties: connectionProperties)
let database = client.database(databaseName)
let booksMapper = BooksMapper(withDatabase: database)

// setup routes
let router = Router()
router.get("/") { _, response, next in 
  response.status(.OK).send(json: JSON(["hello": "world"]))
  next()
}

router.get("/books", handler: listBooksHandler)


// start server
Log.info("Starting server")
Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
