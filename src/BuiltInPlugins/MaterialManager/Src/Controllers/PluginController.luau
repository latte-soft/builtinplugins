local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Flags.getFFlagMaterialActionAsTool);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.DEPRECATED_SetMaterialAsTool);
local v6 = require(l_Actions_0.SetMaterialBrowserLayout);
local v7 = require(l_Actions_0.SetMaterialTileSize);
local v8 = require(l_Actions_0.SetViewType);
local v9 = require(l_Parent_0.Src.Controllers.GeneralServiceController);
local v10 = require(l_Parent_0.Src.Util.DEPRECATED_SetHighlight);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local v12 = not v3() and "rbxasset://SystemCursors/Arrow" or nil;
local v13 = not v3() and "rbxasset://textures/FillCursor.png" or nil;
local v14 = l_ContextItem_0:extend("PluginController");
v14.new = function(v15, v16, v17, v18, v19)
    local v20 = setmetatable({
        _plugin = v15, 
        _store = v16, 
        _mouse = v17, 
        _generalServiceController = v18, 
        _mock = v19
    }, v14);
    v20._mouseMoveConnection = nil;
    v20._mouseClickedConnection = nil;
    v20._deactivationConnection = nil;
    return v20;
end;
v14.mock = function()
    return v14.new(nil, nil, v9.mock(), true);
end;
v14.initialize = function(v21)
    if not v21._mock then
        local l_Setting_0 = v21._plugin:GetSetting("MaterialBrowserLayout");
        local l_Setting_1 = v21._plugin:GetSetting("MaterialTileSize");
        local l_Setting_2 = v21._plugin:GetSetting("ViewType");
        if l_Setting_0 then
            v21._store:dispatch(v6(l_Setting_0));
        end;
        if l_Setting_1 then
            v21._store:dispatch(v7(l_Setting_1));
        end;
        if l_Setting_2 then
            v21._store:dispatch(v8(l_Setting_2));
        end;
        return ;
    else
        return ;
    end;
end;
v14.setMaterialTileSize = function(v25, v26)
    if not v25._mock then
        v25._plugin:SetSetting("MaterialTileSize", v26);
        return ;
    else
        return ;
    end;
end;
v14.setViewType = function(v27, v28)
    if not v27._mock then
        v27._plugin:SetSetting("ViewType", v28);
        return ;
    else
        return ;
    end;
end;
v14.setMaterialBrowserLayout = function(v29, v30)
    if not v29._mock then
        v29._plugin:SetSetting("MaterialBrowserLayout", v30);
        return ;
    else
        return ;
    end;
end;
v14.DEPRECATED_toggleMaterialAsTool = function(v31)
    if not v31._mock then
        v31._plugin:Activate(true);
        v31._store:dispatch(v5(true));
        local v32 = nil;
        v31._mouseMoveConnection = v31._mouse.Move:Connect(function()
            if not v31._store:getState().MaterialBrowserReducer.Material then
                v31._mouse.Icon = if not v3() then v12 else nil;
                return ;
            else
                v31._mouse.Icon = if not v3() then v13 else nil;
                v32 = v10(v32, v31._mouse.Target);
                return ;
            end;
        end);
        v31._mouseClickedConnection = v31._mouse.Button1Down:Connect(function()
            local l_Material_0 = v31._store:getState().MaterialBrowserReducer.Material;
            if l_Material_0 then
                v31._mouse.Icon = if not v3() then v13 else nil;
                v31._generalServiceController:ApplyToBasePart(v31._mouse.Target, l_Material_0.Material, if not l_Material_0.MaterialVariant then nil else l_Material_0.MaterialVariant.Name);
            end;
        end);
        v31._deactivationConnection = v31._plugin.Deactivation:Connect(function()
            v31._store:dispatch(v5(false));
            if v32 then
                v32:Destroy();
            end;
            v31._mouse.Icon = if not v3() then v12 else nil;
            if v31._mouseMoveConnection then
                v31._mouseMoveConnection:Disconnect();
                v31._mouseMoveConnection = nil;
            end;
            if v31._mouseClickedConnection then
                v31._mouseClickedConnection:Disconnect();
                v31._mouseClickedConnection = nil;
            end;
            if v31._deactivationConnection then
                v31._deactivationConnection:Disconnect();
                v31._deactivationConnection = nil;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v14.DEPRECATED_untoggleMaterialAsTool = function(v34)
    if not v34._mock then
        v34._plugin:Deactivate();
        return ;
    else
        return ;
    end;
end;
v14.destroy = function(v35)
    if not v35._mock then
        if v35._mouseMoveConnection then
            v35._mouseMoveConnection:Disconnect();
        end;
        if v35._mouseClickedConnection then
            v35._mouseClickedConnection:Disconnect();
        end;
        if v35._deactivationConnection then
            v35._deactivationConnection:Disconnect();
        end;
        return ;
    else
        return ;
    end;
end;
return v14;
