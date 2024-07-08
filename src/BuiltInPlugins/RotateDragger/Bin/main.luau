return function(v0, v1)
    local l_Parent_0 = script.Parent.Parent;
    local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
    local v4 = require(l_Parent_0.Packages.Roact);
    local v5 = require(l_Parent_0.Packages.DraggerSchemaCore.DraggerSchema);
    local v6 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
    local v7 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
    local v8 = require(l_DraggerFramework_0.Flags.getFFlagDraggerHandlesIsEnabledFunction);
    local v9 = require(l_DraggerFramework_0.Handles.RotateHandles);
    local v10 = nil;
    local v11 = false;
    local v12 = nil;
    local function v19()
        if not v12 then
            v11 = true;
            v0:Activate(true);
            v1.mainButton:SetActive(true);
            local function v16(v13, v14, v15)
                return v13:rotateToWithIk(v14, v15);
            end;
            local v17 = nil;
            if v8() then
                v17 = function(v18)
                    if not v18 or not v18.basisObject then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
            v12 = v4.mount(v4.createElement(v7, {
                Mouse = v0:GetMouse(), 
                DraggerContext = v10, 
                DraggerSchema = v5, 
                DraggerSettings = {
                    AnalyticsName = "Rotate", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true, 
                    ShowLocalSpaceIndicator = true, 
                    ShowPivotIndicator = true, 
                    HandlesList = {
                        v9.new(v10, {
                            ShowBoundingBox = true, 
                            Summonable = true, 
                            IsEnabledFunction = not not v8() and v17 or nil
                        }, v5.TransformHandlesImplementation.new(v10, v16))
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
        v0.Name = "RotateDragger";
        v10 = v6.new(v0, game, settings(), v5.Selection.new());
        v0.Deactivation:connect(function()
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
                v19();
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
