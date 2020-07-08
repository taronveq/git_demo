//
//  Header.swift
//  git_project
//
//  Created by MacBook Pro on 7/8/20.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire

class Header {
    static func getHeaders() -> HTTPHeaders {
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZDNlZWYwMC04ZWJkLTRjYmEtOGI1ZS0yODBhOTA2YjAxYjIiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6ImIyNGQ4ZmNmLTZmNmMtNGMyNi1hNGE1LWEwNDRhYTg1ZThlNCIsImlhdCI6MTU5NDA0ODgyMSwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5NDA0ODgyMCwiZXhwIjoxNjAyNjg4ODIwLCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.BVj87MQ0IPYfIHOBTQNz2GtBM0zRo9lQ0mhrBjNlXbE"]
    }
}
