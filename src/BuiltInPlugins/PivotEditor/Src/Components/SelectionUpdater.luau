local l_Parent_0 = script.Parent.Parent.Parent;
local l_Selection_0 = game:GetService("Selection");
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Utility.StatusMessage);
local function _(v4)
    local l_v4_0 = v4;
    if l_v4_0 then
        l_v4_0 = v4:IsA("PVInstance");
        if l_v4_0 then
            l_v4_0 = false;
            if v4 ~= workspace then
                l_v4_0 = v4 ~= workspace.Terrain;
            end;
        end;
    end;
    return l_v4_0;
end;
local v7 = v2.PureComponent:extend("SelectionUpdater");
v7.init = function(v8)
    assert(v8.props.selectObjectForEditing, "selectObjectForEditing is required");
    assert(v8.props.selectInvalidSelection, "selectInvalidSelection is required");
end;
v7.didMount = function(v9)
    v9._connection = l_Selection_0.SelectionChanged:Connect(function()
        v9:_update();
    end);
    v9:_update();
end;
v7.willUnmount = function(v10)
    v10._connection:Disconnect();
end;
v7.render = function(_)
end;
v7._update = function(v12)
    local v13 = l_Selection_0:Get();
    if #v13 == 1 then
        local v14 = v13[1];
        if v12.props.targetObject ~= v14 then
            local l_v14_0 = v14;
            if l_v14_0 then
                l_v14_0 = v14:IsA("PVInstance");
                if l_v14_0 then
                    l_v14_0 = false;
                    if v14 ~= workspace then
                        l_v14_0 = v14 ~= workspace.Terrain;
                    end;
                end;
            end;
            if not l_v14_0 then
                v12.props.selectInvalidSelection(v3.InvalidTarget);
                return ;
            else
                v12.props.selectObjectForEditing(v14);
                return ;
            end;
        end;
    elseif #v13 > 1 then
        v12.props.selectInvalidSelection(v3.MultipleSelection);
        return ;
    else
        v12.props.selectInvalidSelection(v3.NoSelection);
    end;
end;
return v7;
