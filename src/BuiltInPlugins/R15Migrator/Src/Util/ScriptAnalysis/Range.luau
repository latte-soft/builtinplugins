local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis.Constants);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3, v4, v5)
    return (setmetatable({
        startLine = v2, 
        startCharacter = v3, 
        endLine = v4, 
        endCharacter = v5
    }, v1));
end;
v1.__eq = function(v6, v7)
    local v8 = false;
    if v6.startLine == v7.startLine then
        v8 = false;
        if v6.startCharacter == v7.startCharacter then
            v8 = false;
            if v6.endLine == v7.endLine then
                v8 = v6.endCharacter == v7.endCharacter;
            end;
        end;
    end;
    return v8;
end;
v1.__lt = function(v9, v10)
    if v9.startLine == v10.startLine then
        return v9.startCharacter < v10.startCharacter;
    else
        return v9.startLine < v10.startLine;
    end;
end;
v1.__le = function(v11, v12)
    return v11:__eq(v12) or v11:__lt(v12);
end;
v1.fromLinter = function(v13)
    return v1.new(v13[v0.StartKey].line, v13[v0.StartKey].character, v13[v0.EndKey].line, v13[v0.EndKey].character);
end;
v1.Overlaps = function(v14, v15)
    local v16 = true;
    if v15.endLine >= v14.startLine then
        if v15.endLine == v14.startLine then
            v16 = true;
            if not (v15.endCharacter >= v14.startCharacter) then
                goto label0;
            end;
        end;
        v16 = true;
        if v14.endLine >= v15.startLine then
            v16 = false;
            if v15.startLine == v14.endLine then
                v16 = v14.endCharacter < v15.startCharacter;
            end;
        end;
    end;
    ::label0::;
    return not v16;
end;
v1.GetDataForLinter = function(v17)
    return {
        [v0.StartKey] = {
            line = v17.startLine, 
            character = v17.startCharacter
        }, 
        [v0.EndKey] = {
            line = v17.endLine, 
            character = v17.endCharacter
        }
    };
end;
return v1;
