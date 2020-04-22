#include "application.h"
// #include "HttpClient/firmware/HttpClient.h"
#include "HttpClient.h"
/**
* Declaring the variables.
*/
unsigned int nextTime = 0;    // Next time to contact the server
HttpClient http;

// Headers currently need to be set at init, useful for API keys etc.
http_header_t headers[] = {
    //  { "Content-Type", "application/json" },
    //  { "Accept" , "application/json" },
    { "Accept" , "*/*"},
    { NULL, NULL } // NOTE: Always terminate headers will NULL
};

http_request_t request;
http_response_t response;

void setup() {
    Serial.begin(9600);
}

void loop() {
    if (nextTime > millis()) {
        return;
    }

    Serial.println();
    Serial.println("Application>\tStart of Loop.");
    // Request path and body can be set at runtime or at setup.
    // request.hostname = "www.worldclockapi.com";
    // request.port = 80;
    // request.path = "/api/json/utc/now";
    request.hostname = "192.168.0.106";
    request.port = 8000;
    request.path = "/data";
    
    // The library also supports sending a body with your request:
    request.body = "{\"key\":\"value\"}";

    // Get request
    // http.get(request, response, headers);
    http.put(request, response, headers);
    Serial.print("Application>\tResponse status: ");
    Serial.println(response.status);

    Serial.print("Application>\tHTTP Response Body: ");
    Serial.println(response.body);

    nextTime = millis() + 10000;
}
