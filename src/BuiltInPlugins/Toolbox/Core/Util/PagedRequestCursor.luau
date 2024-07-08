return {
    createDefaultCursor = function()
        return {
            begin = true
        };
    end, 
    createCursor = function(v0)
        if not v0 then
            return {};
        else
            return {
                nextPageCursor = v0.nextPageCursor
            };
        end;
    end, 
    isNextPageAvailable = function(v1)
        if not v1.begin and not v1.nextPageCursor then
            return false;
        else
            return true;
        end;
    end, 
    getNextPageCursor = function(v2)
        return v2.nextPageCursor;
    end
};
