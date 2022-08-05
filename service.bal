import lahiru123/police_check_api;
import chevon/idapi;
import ballerina/log;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get validate(string nic, string address, string phone) returns json|error {
        // Send a response back to the caller.
        //idapi:Client idapiEndpoint1 = check new ({auth: {clientId: "vevLczfplSAgqzqkUgpra7ZI14ka", clientSecret: "NzRJmxMfIMpagvFSi0Gzl4VqxXwa"}});
        idapi:Client idapiEndpoint1 = check new ({auth: {clientId: "vevLczfplSAgqzqkUgpra7ZI14ka", clientSecret: "NzRJmxMfIMpagvFSi0Gzl4VqxXwa"}}); //idapi:Client idapiEndpoint = check new ({auth: {clientId: "vevLczfplSAgqzqkUgpra7ZI14ka", clientSecret: "NzRJmxMfIMpagvFSi0Gzl4VqxXwa"}});
        json getChecknicResponse = check idapiEndpoint1->getChecknic(nic);
        police_check_api:Client police_check_apiEndpoint = check new ({auth: {clientId: "CGKFcnBtzAdUbSzYPiARIyLqAtMa", clientSecret: "znaMA4rLFI0ajcVu1cyyPBTX4i8a"}});
        json getGetpersoncrimerecordsResponse = check police_check_apiEndpoint->getGetpersoncrimerecords(nic);
        
        log:printInfo(getGetpersoncrimerecordsResponse.toBalString());
        
        return getGetpersoncrimerecordsResponse;
    
    }
}
