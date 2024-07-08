local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_DropdownMenu_0 = v2.UI.DropdownMenu;
return function(v5)
    local v6, v7 = v1.useState(false);
    local v8, v9 = v1.useState(Vector2.new(0, 0));
    local v10 = v1.useMemo(function()
        return v8.X;
    end, {
        v8
    });
    local v11, v12 = v1.useState("All Events");
    local v16 = v1.useMemo(function()
        local v13 = {};
        for v14, v15 in pairs(v5.items) do
            v13[v15] = v14;
        end;
        return v13;
    end, {
        v5.items
    });
    local v20 = v1.useMemo(function()
        local v17 = {};
        for _, v19 in pairs(v5.items) do
            table.insert(v17, v19);
        end;
        return v17;
    end, {
        v5.items
    });
    local function v23(v21, _)
        v12(v21);
        v7(false);
        v5.OnChanged(v16[v21]);
    end;
    local function v24()
        v7(false);
    end;
    local function v25()
        v7(true);
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-FilterDropdown"), 
        LayoutOrder = v5.LayoutOrder, 
        [v1.Change.AbsoluteSize] = function(v26)
            v9(v26.AbsoluteSize);
        end
    }, {
        Selected = v1.createElement("TextButton", {
            [v1.Tag] = l_joinTags_0("X-Fill", "CX-Invisible"), 
            Text = v11, 
            ZIndex = 100, 
            [v1.Event.Activated] = v25
        }), 
        ButtonContainer = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("CX-Invisible"), 
            ZIndex = 101
        }, {
            Button = v1.createElement("ImageButton", {
                [v1.Event.Activated] = v25
            })
        }), 
        Menu = v1.createElement(l_DropdownMenu_0, {
            Items = v20, 
            Width = v10, 
            Hide = not v6, 
            OnItemActivated = v23, 
            OnFocusLost = v24
        })
    });
end;
