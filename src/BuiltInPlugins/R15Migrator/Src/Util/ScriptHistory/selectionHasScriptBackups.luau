local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptHistory.ChunkUtil);
return function(v1, v2)
    for _, v4 in v1, nil, nil do
        if not v0:HasScriptBackup((v2:getScriptInstanceFromGUID(v4.scriptId))) then
            return false;
        end;
    end;
    return true;
end;
