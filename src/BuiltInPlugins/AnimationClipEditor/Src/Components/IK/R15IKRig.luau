local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RigIK);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_Workspace_0 = game:GetService("Workspace");
local v6 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRigIK);
local v7 = v1.PureComponent:extend("R15IKRig");
v7.buildConstraints = function(v8)
    local v9 = if not v6() then v3.buildR15Constraints(v8.props.RootInstance) else v2.buildR15Constraints(v8.props.RootInstance);
    local v10 = {};
    for v11, v12 in pairs(v9) do
        v10[v11] = v1.createElement(v12.Type, v12.Props);
    end;
    return v10;
end;
v7.init = function(_)
    local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v4.TEMPORARY_CONSTRAINTS);
    if l_l_Workspace_0_FirstChild_0 then
        l_l_Workspace_0_FirstChild_0:Destroy();
    end;
end;
v7.render = function(v15)
    return v1.createElement(v1.Portal, {
        target = l_Workspace_0
    }, {
        [v4.TEMPORARY_CONSTRAINTS] = v1.createElement("Folder", {}, v15:buildConstraints())
    });
end;
return v7;
