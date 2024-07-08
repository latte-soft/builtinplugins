local v0 = require(script:FindFirstAncestor("MaterialGenerator").Src.Enum.GenerationErrorType);
return function(v1)
    if type(v1) == "string" then
        if not string.find(v1, "got network error status: 429") then
            if not string.find(v1, "got network error status: 500") then
                if not string.find(v1, "got network error status: 504") then
                    if not string.find(v1, "TextFullyFiltered") then
                        if not string.find(v1, "AccountingFailed") or not string.find(v1, "Decrementing account failed") then
                            return v0.CustomMessage, v1;
                        else
                            return v0.AccountingFailedDecrement;
                        end;
                    else
                        return v0.TextFullyFiltered;
                    end;
                else
                    return v0.ServerError504;
                end;
            else
                return v0.ServerError500;
            end;
        else
            return v0.TooManyRequests;
        end;
    else
        return v0.Unknown, nil;
    end;
end;
