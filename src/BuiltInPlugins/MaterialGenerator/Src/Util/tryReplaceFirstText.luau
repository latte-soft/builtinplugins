local function _(v0)
    assert(type(v0) == "string", "Bad str");
    return string.gsub(v0, "[%(%)%.%%%+%-%*%?%[%]%^%$]", function(v1)
        return "%" .. v1;
    end);
end;
return function(v3, v4, v5)
    if v3 == v4 then
        return v5;
    elseif v3 ~= nil then
        local l_gsub_0 = string.gsub;
        local l_v3_0 = v3;
        assert(type(v4) == "string", "Bad str");
        l_gsub_0, l_v3_0 = l_gsub_0(l_v3_0, string.gsub(v4, "[%(%)%.%%%+%-%*%?%[%]%^%$]", function(v8)
            return "%" .. v8;
        end), v5, 1);
        if l_v3_0 > 0 then
            return l_gsub_0;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
