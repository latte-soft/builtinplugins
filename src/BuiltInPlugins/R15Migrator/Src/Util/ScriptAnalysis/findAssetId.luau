local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.parseAssetURL);
local v1 = require(script.Parent.StringUtil);
return function(v2, v3, v4)
    local v5, v6, v7 = v0(v2);
    if v5 then
        if v1.MatchBeforeAndAfter(v2, v5, v6, "[\"]", "[\"]") or v1.MatchBeforeAndAfter(v2, v5, v6, "[']", "[']") then
            if v4 then
                v4(v5, v6, v7, v2, v3);
            end;
            return v7;
        else
            return false;
        end;
    else
        return false;
    end;
end;
