local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v7 = require(script.Parent.AvatarCell);
local v8 = require(script.Parent.ImportPage);
local l_Grid_0 = v3.UI.Grid;
local l_Localization_0 = v3.ContextServices.Localization;
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local function v15()
    local v12 = {};
    debug.profilebegin("Find avatars");
    for _, v14 in l_Workspace_0:GetDescendants() do
        if v5(v14) then
            table.insert(v12, {
                Key = v14:GetDebugId(), 
                Avatar = v14
            });
        end;
    end;
    debug.profileend();
    return v12;
end;
local function v17(v16)
    return v16:gsub("([.%%^$()%[%]+*-?])", "%%%1");
end;
local function _(v18, v19)
    if #v19 == 0 then
        return v18;
    else
        return v2.filter(v18, function(v20)
            return v20.Avatar.Name:match(v17(v19));
        end);
    end;
end;
return function(v22)
    local v23 = l_Stylizer_0:use("ImportPage");
    local v24 = l_Localization_0:use();
    local v25 = v4.useMemo(v15);
    local v26, v27 = v4.useState("");
    return v4.createElement(v8, {
        Title = v24:getText("SelectScreen", "CurrentPlace"), 
        GoBack = v22.GoBack, 
        Search = v26, 
        SetSearch = v27
    }, {
        Grid = v4.createElement(l_Grid_0, {
            Cells = if #v26 == 0 then v25 else v2.filter(v25, function(v28)
                return v28.Avatar.Name:match(v17(v26));
            end), 
            CellComponent = v7, 
            CellPadding = v23.GridPadding, 
            CellSize = UDim2.fromOffset(v23.Avatar.IconSize, ((v23.Avatar.IconSize + v23.Avatar.NameFontSize) + v23.Avatar.NameLines) + v23.Avatar.Padding)
        })
    });
end;
