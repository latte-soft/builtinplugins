return {
    new = function(v0, v1, v2, v3, v4)
        return {
            responseTimeMs = v1, 
            responseCode = v2, 
            responseBody = v0, 
            requestType = v3, 
            url = v4
        };
    end
};
