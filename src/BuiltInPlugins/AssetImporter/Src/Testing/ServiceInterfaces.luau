local v0 = require(script:FindFirstAncestor("AssetImporter").Src.Utility.DebugFlags);
local v1 = v0.RunningUnderCLI() or v0.RunTests();
local v2 = {};
if v1 then
    v2.PickFileWithPrompt = function()
        return "File/Picked/From/Prompt";
    end;
    return v2;
else
    local l_AssetImportService_0 = game:GetService("AssetImportService");
    v2.PickFileWithPrompt = function()
        return l_AssetImportService_0:PickFileWithPrompt();
    end;
    return v2;
end;
