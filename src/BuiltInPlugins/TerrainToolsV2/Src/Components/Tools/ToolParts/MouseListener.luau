local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local v8 = v2.PureComponent:extend("MouseListener");
local function _()
    return l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt);
end;
local function _()
    return l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
end;
v8.pickMaterial = function(v11)
    v11._mouse = v11.props.Mouse:get();
    local l_Direction_0 = v11._mouse.UnitRay.Direction;
    local l_p_0 = v11._mouse.Origin.p;
    local v14 = nil;
    local v15 = nil;
    local v16 = l_Workspace_0:Raycast(l_p_0, l_Direction_0 * 10000, v11._raycastParams);
    if v16 then
        v14 = v16.Instance;
        v15 = v16.Material;
    end;
    if not (not v14 or not v14:IsA("Terrain")) then
        if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
            if v11.props.dispatchSetTargetMaterial then
                v11.props.dispatchSetTargetMaterial(v15);
            end;
        else
            if v11.props.dispatchSetMaterial then
                v11.props.dispatchSetMaterial(v15);
            end;
            if v11.props.dispatchSetSourceMaterial then
                v11.props.dispatchSetSourceMaterial(v15);
                return ;
            end;
        end;
    end;
end;
v8.init = function(v17)
    v17.onInputBegan = function(v18, v19)
        if not ((not (v18.UserInputType == Enum.UserInputType.MouseButton1) or v19) or not (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt))) then
            v17:pickMaterial();
        end;
    end;
end;
v8.didMount = function(v20)
    v20._raycastParams = RaycastParams.new();
    v20._raycastParams.FilterType = Enum.RaycastFilterType.Whitelist;
    v20._raycastParams.BruteForceAllSlow = true;
    v20._raycastParams.FilterDescendantsInstances = {
        v20.props.Terrain:get()
    };
    v20._onInputBeganConnection = l_UserInputService_0.InputBegan:Connect(v20.onInputBegan);
end;
v8.willUnmount = function(v21)
    if v21._onInputBeganConnection then
        v21._onInputBeganConnection:Disconnect();
        v21._onInputBeganConnection = nil;
    end;
end;
v8.render = function(_)
    return nil;
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    Terrain = v5.Terrain
})(v8));
