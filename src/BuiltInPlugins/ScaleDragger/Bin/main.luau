return function(v0, v1)
    local l_Parent_0 = script.Parent.Parent;
    local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
    local v4 = require(l_Parent_0.Packages.Roact);
    local v5 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
    local v6 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
    local v7 = require(l_DraggerFramework_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
    local v8 = require(l_DraggerFramework_0.Handles.ExtrudeHandles);
    local v9 = require(l_Parent_0.Packages.DraggerSchemaCore.DraggerSchema);
    local v10 = nil;
    local v11 = false;
    local v12 = nil;
    local function v15()
        if not v12 then
            v11 = true;
            v0:Activate(true);
            v1.mainButton:SetActive(true);
            local v13 = nil;
            if v7() then
                v13 = function(v14)
                    if not v14 or not v14.basisObject then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
            v12 = v4.mount(v4.createElement(v6, {
                Mouse = v0:GetMouse(), 
                DraggerContext = v10, 
                DraggerSchema = v9, 
                DraggerSettings = {
                    AnalyticsName = "Scale", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true, 
                    HandlesList = {
                        v8.new(v10, {
                            ShowBoundingBox = true, 
                            Summonable = true, 
                            IsEnabledFunction = not not v7() and v13 or nil
                        }, v9.ExtrudeHandlesImplementation.new(v10))
                    }
                }
            }));
            return ;
        else
            warn("Plugin handle already exists");
            return ;
        end;
    end;
    local function _()
        v11 = false;
        v1.mainButton:SetActive(false);
        if v12 then
            v4.unmount(v12);
            v12 = nil;
        end;
    end;
    (function()
        v0.Name = "ScaleDragger";
        v10 = v5.new(v0, game, settings(), v9.Selection.new());
        v0.Deactivation:Connect(function()
            if v11 then
                v11 = false;
                v1.mainButton:SetActive(false);
                if v12 then
                    v4.unmount(v12);
                    v12 = nil;
                end;
            end;
        end);
        v1.mainButtonClickedSignal:Connect(function()
            if not v11 then
                v15();
            else
                v11 = false;
                v1.mainButton:SetActive(false);
                if v12 then
                    v4.unmount(v12);
                    v12 = nil;
                    return ;
                end;
            end;
        end);
    end)();
end;
