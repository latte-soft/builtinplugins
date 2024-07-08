local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(script.Parent.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v2.Category;
local l_ClearSettings_0 = v2.ClearSettings;
local l_Tab_0 = v2.Tab;
local l_Tool_0 = v2.Tool;
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorDisabledFixes);
local v9 = v1:new(l_Tool_0.Clear, l_Tab_0.Create, {
    {
        Defaults = {}, 
        Id = l_Category_0.ClearSettings
    }
}, {});
v9.init = function(v10, v11, v12)
    v1.init(v10, v11, v12);
    v10._overrides = {
        [l_Category_0.ClearSettings] = {
            [l_ClearSettings_0.Clear] = {
                Disabled = v12.Terrain:CountCells() == 0, 
                Hidden = false, 
                Label = "", 
                Schema = {
                    OnClick = function()
                        v12.Terrain:Clear();
                        v12.ChangeHistoryService:SetWaypoint("Cleared Terrain");
                        v10._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled = true;
                        if not v7() then
                            v10.OnGizmoChanged:Fire();
                        else
                            v10.OnInternalsChanged:Fire();
                        end;
                        v10._analytics:report("Usage", l_Tool_0.Clear, 1);
                    end
                }, 
                Value = true
            }
        }
    };
end;
if v7() then
    v9.setDisabledState = function(v13)
        local _ = v13:getPayload();
        local v15 = v13._services.Terrain:CountCells() == 0;
        if v13._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled ~= v15 then
            v13._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled = v15;
            v13.OnInternalsChanged:Fire();
        end;
    end;
end;
v9.updateDisabled = function(v16)
    v16._overrides[l_Category_0.ClearSettings][l_ClearSettings_0.Clear].Disabled = v16._services.Terrain:CountCells() == 0;
end;
v9.activate = function(v17)
    v1.activate(v17);
    if not v8() or not v7() then
        v17:updateDisabled();
    else
        v17:setDisabledState();
    end;
    v17._undo = v17._services.ChangeHistoryService.OnUndo:Connect(function()
        if not v8() or not v7() then
            v17:updateDisabled();
            return ;
        else
            v17:setDisabledState();
            return ;
        end;
    end);
    v17._redo = v17._services.ChangeHistoryService.OnRedo:Connect(function()
        if not v8() or not v7() then
            v17:updateDisabled();
            return ;
        else
            v17:setDisabledState();
            return ;
        end;
    end);
    v17._analytics:report("Activated", l_Tool_0.Clear);
end;
v9.deactivate = function(v18)
    v1.deactivate(v18);
    if v18._undo then
        v18._undo:Disconnect();
    end;
    if v18._redo then
        v18._redo:Disconnect();
    end;
end;
return v9;
