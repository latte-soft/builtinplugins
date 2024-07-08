local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptHistory.ChunkUtil);
return function(v1, v2, v3)
    local v4 = {};
    local v5 = {};
    for _, v7 in v1, nil, nil do
        local v8 = v2:getScriptInstanceFromGUID(v7);
        local l_v0_ScriptBackupChunks_0 = v0:GetScriptBackupChunks(v8);
        if not (not l_v0_ScriptBackupChunks_0 or not v0:DidSourceChange(v8, l_v0_ScriptBackupChunks_0)) then
            v4[v7] = true;
            v5[v7] = l_v0_ScriptBackupChunks_0;
        end;
    end;
    local v10 = next(v5);
    for v11, v12 in v5, nil, nil do
        local v13 = v2:getScriptInstanceFromGUID(v11);
        v2:setRevertedScriptSource(v11);
        v0:ReplaceWithChunk(v13, v12[1]);
        if #v12 > 1 then
            for v14 = 2, #v12 do
                v0:AppendChunk(v13, v12[v14]);
            end;
        end;
        if v3 then
            v3(v11);
        end;
        if v11 ~= v10 then
            v2:closeScriptIfOpen(v11);
        end;
    end;
    if v10 then
        v2:closeScriptIfOpen(v10);
    end;
    return v4;
end;
