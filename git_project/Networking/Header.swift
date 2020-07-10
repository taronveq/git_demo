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
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMGMzN2Y3NS03NjZjLTQ3OTAtOGFlZC1kMGY4ZWE5ZGViNjEiLCJ1bmlxdWVfbmFtZSI6IiszNzQ5NDE3MjgzOSIsImp0aSI6ImI0Zjg1YTU5LWE3ZDctNDFiMi1iNmNlLTdmOGY1Y2FmN2Q5MiIsImlhdCI6MTU5NDM4NjEyNywiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsIm5iZiI6MTU5NDM4NjEyNywiZXhwIjoxNjAzMDI2MTI3LCJpc3MiOiJ3ZWJBcGkiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDIvIn0.Dz0lOGG3q4eLqMc3GEFx8Jwe9-uVvEUfYLcH8NDbaSY"]
    }
}
