local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
local function _(v4, v5, v6)
    v6:SetAttribute(v2.AttributeChunkNameBase .. tostring(v4), (l_HttpService_0:JSONEncode(v5)));
end;
return function(v8)
    if v8 and not v8:GetAttribute(v2.AttributeChunkCountName) then
        local v9 = v3:SplitIntoChunks(v8.Source);
        v8:SetAttribute(v2.AttributeChunkCountName, #v9);
        for v10, v11 in v9, nil, nil do
            v8:SetAttribute(v2.AttributeChunkNameBase .. tostring(v10), (l_HttpService_0:JSONEncode({
                source = v11
            })));
        end;
        v3:TrackBackup(v8);
        return ;
    else
        return ;
    end;
end;
