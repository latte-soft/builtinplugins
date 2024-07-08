local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptHistory.ChunkUtil);
return function(v1, v2, v3)
    local v4 = v1[1];
    for _, v6 in v1, nil, nil do
        local v7 = v2:getRevertedScriptSource(v6);
        local v8 = v2:getScriptInstanceFromGUID(v6);
        local v9 = v0:SplitIntoChunks(v7);
        if #v9 ~= 0 then
            v0:ReplaceWithChunk(v8, v9[1]);
            for v10 = 2, #v9 do
                v0:AppendChunk(v8, v9[v10]);
            end;
            if v3 then
                v3(v6);
            end;
            if v6 ~= v4 then
                v2:closeScriptIfOpen(v6);
            end;
        end;
    end;
    if v4 then
        v2:closeScriptIfOpen(v4);
    end;
end;
