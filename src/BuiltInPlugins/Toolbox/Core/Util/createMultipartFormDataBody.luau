local v0 = require(script.Parent.Parent.Parent.Core.Util.AssetConfigConstants);
return function(v1)
    local v2 = "";
    for _, v4 in ipairs(v1) do
        v2 = v2 .. "--" .. v0.MULTIPART_FORM_BOUNDARY .. "\r\n";
        if v4.type then
            v2 = v2 .. "Content-Type: " .. v4.type .. "\r\n";
        end;
        if v4.disposition then
            v2 = v2 .. "Content-Disposition: form-data; ";
            local v5 = true;
            for v6, v7 in pairs(v4.disposition) do
                if not v5 then
                    v2 = v2 .. "; ";
                end;
                v5 = false;
                v2 = v2 .. v6 .. "=\"" .. v7 .. "\"";
            end;
            v2 = v2 .. "\r\n";
        end;
        v2 = v2 .. "\r\n" .. v4.value .. "\r\n";
    end;
    return v2 .. "--" .. v0.MULTIPART_FORM_BOUNDARY .. "--" .. "\r\n";
end;
