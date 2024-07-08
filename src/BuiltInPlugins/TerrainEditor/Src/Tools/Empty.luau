local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_Tab_0 = v2.Tab;
local l_Tool_0 = v2.Tool;
local l_UpgradeSettings_0 = v2.UpgradeSettings;
local v7 = require(l_script_FirstAncestor_0.Src.Util.Operations.ShorelinesOperation);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v9 = v1:new(l_Tool_0.Empty, l_Tab_0.None, {
    {
        Defaults = {}, 
        Id = l_Category_0.UpgradeSettings
    }
}, {});
v9.form = function(v10)
    local v11 = v1.form(v10);
    local v12 = {};
    for v13, v14 in v11, nil, nil do
        local v15 = false;
        for _, v17 in v14.Children, nil, nil do
            if not v17.Hidden then
                v15 = true;
            end;
        end;
        if v15 then
            v12[v13] = v14;
        end;
    end;
    return v12;
end;
v9.init = function(v18, v19, v20)
    v1.init(v18, v19, v20);
    v18._overrides = {
        [l_Category_0.UpgradeSettings] = {
            [l_UpgradeSettings_0.Shorelines] = {
                Hidden = not v20.Terrain or not v20.Terrain:CanShorelinesBeUpgraded(), 
                Label = "", 
                Layout = Enum.FillDirection.Vertical, 
                Schema = {
                    OnClick = function()
                        local v21 = v18:getPayload();
                        v18._operation = v7(v18._localization:getText("Operations", (("%*Name"):format(l_UpgradeSettings_0.Shorelines))), v18._localization:getText("Operations", (("%*Description"):format(l_UpgradeSettings_0.Shorelines))), v20, function(v22)
                            v18._overrides[l_Category_0.UpgradeSettings][l_UpgradeSettings_0.Shorelines].Hidden = not v22;
                            if not v8() then
                                v18.OnFormChanged:Fire();
                                v18.OnGizmoChanged:Fire();
                                return ;
                            else
                                v18.OnInternalsChanged:Fire();
                                return ;
                            end;
                        end);
                        v18._operation:start({
                            Payload = v21
                        });
                        v18.OnOperationChanged:Fire();
                    end
                }, 
                Value = true
            }
        }
    };
end;
v9.operation = function(v23)
    return v23._operation;
end;
return v9;
