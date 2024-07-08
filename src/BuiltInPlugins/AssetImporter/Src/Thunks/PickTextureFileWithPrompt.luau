local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.GetErrorChecked);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetErrorNodeChecked);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetTreeChecked);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v5 = require(l_script_FirstAncestor_0.Src.Testing.UseServiceInterfaces);
local v6 = nil;
local v7 = nil;
if not v5() then
    v7 = game:GetService("AssetImportService");
else
    v6 = require(l_script_FirstAncestor_0.Src.Testing.ServiceInterfaces);
end;
return function(v8, v9)
    return function(v10)
        local v11 = nil;
        v11 = if not v5() then v7:PickFileWithPrompt() else v6.PickFileWithPrompt();
        local v12 = v10:getState();
        if v11 and v11 ~= "" then
            v8[v9] = v11;
            v10:dispatch(v2((v1(v12.Preview.importTree))));
            v10:dispatch(v3({
                [v8] = v8.ShouldImport
            }));
            v10:dispatch(v4(v8:GetPreview()));
        end;
    end;
end;
