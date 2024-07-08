local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
return function()
    for _, v5 in (v1(function(v3)
        return v3:IsA("LuaSourceContainer");
    end)), nil, nil do
        v2:RemoveScriptBackupChunks(v5);
    end;
end;
