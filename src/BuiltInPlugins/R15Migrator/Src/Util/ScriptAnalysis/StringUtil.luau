local v2 = {
    CharAt = function(v0, v1)
        return (string.sub(v0, v1, v1));
    end
};
v2.MatchBefore = function(v3, v4, v5, v6)
    if v6 and v4 - 1 < 1 then
        return true;
    elseif not (v4 - 1 >= 1) or not string.match(v2.CharAt(v3, v4 - 1), v5) then
        return false;
    else
        return true;
    end;
end;
v2.MatchAfter = function(v7, v8, v9, v10)
    if v10 and string.len(v7) < v8 + 1 then
        return true;
    elseif not (v8 + 1 <= string.len(v7)) or not string.match(v2.CharAt(v7, v8 + 1), v9) then
        return false;
    else
        return true;
    end;
end;
v2.MatchBeforeAndAfter = function(v11, v12, v13, v14, v15, v16, v17)
    if not v2.MatchBefore(v11, v12, v14, v16) then
        return false;
    else
        return v2.MatchAfter(v11, v13, v15, v17);
    end;
end;
v2.MatchBeforeOrAfter = function(v18, v19, v20, v21, v22, v23, v24)
    return v2.MatchBefore(v18, v19, v21, v23) or v2.MatchAfter(v18, v20, v22, v24);
end;
v2.SkipLeadingWhitespace = function(v25)
    for v26 = 1, string.len(v25) do
        if v2.CharAt(v25, v26) ~= " " and v2.CharAt(v25, v26) ~= "\t" then
            return v26;
        end;
    end;
    return nil;
end;
v2.RemoveWhitespace = function(v27)
    return string.gsub(v27, "%s", "");
end;
v2.ForEachLine = function(v28, v29)
    local v30 = 1;
    for v31, v32 in v28:gmatch("([^\r\n]*)([\r\n]*)") do
        v29(v31, v30);
        v30 = v30 + #v32:gsub("\n+", "\000%0\000"):gsub(".%z.", "."):gsub("%z", "");
    end;
end;
return v2;
