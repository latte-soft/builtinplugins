return function(v0)
    return v0:gsub(".", function(v1)
        if v1 == "<" then
            return "&lt;";
        elseif v1 == ">" then
            return "&gt;";
        elseif v1 == "\"" then
            return "&quot;";
        elseif v1 == "'" then
            return "&apos;";
        elseif v1 == "&" then
            return "&amp;";
        else
            return v1;
        end;
    end);
end;
