local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local v2 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging);
local v3 = require(l_script_FirstAncestor_0.Src.Util.findAllInServices);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
return function()
    v2:prepareToPublish();
    v4:RemoveAllScriptBackups();
    for _, v6 in (v3(v1.conversionIdFilter())), nil, nil do
        v1.removeConversionId(v6);
    end;
    v1.removeAllSavedData();
end;
