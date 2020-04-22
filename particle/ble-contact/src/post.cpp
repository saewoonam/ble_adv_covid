#include "application.h"
#include "HttpClient.h"
/**
* Declaring the variables.
*/
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


    
int post(char *message)
{
    request.hostname = "192.168.0.106";
    request.port = 8000;
    request.path = "/data";
    //sprintf(request.body, "{\"msg\":\"%s\"}", message);
    // request.body = "{\"key\":\"value\"}";
    String msg = String(message);
    request.body = "{\"key\":\"" + msg + "\"}";

    http.put(request, response, headers);
    // Serial.print("Application>\tResponse status: ");
    // Serial.println(response.status);
    if (response.status==200) return 0;
    // Serial.print("Application>\tHTTP Response Body: ");
    // Serial.println(response.body);

    // nextTime = millis() + 10000;
    // . There was an error
    return 1;
}
