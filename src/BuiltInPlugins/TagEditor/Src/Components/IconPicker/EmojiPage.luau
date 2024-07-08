local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Emoji);
local l_withContext_0 = v2.ContextServices.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Grid_0 = l_UI_0.Grid;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = require(l_Parent_0.Src.TagManager);
local v11 = {
    [2] = v3.getNamedEmoji("skin-tone-2"), 
    [3] = v3.getNamedEmoji("skin-tone-3"), 
    [4] = v3.getNamedEmoji("skin-tone-4"), 
    [5] = v3.getNamedEmoji("skin-tone-5"), 
    [6] = v3.getNamedEmoji("skin-tone-6")
};
local function v13(v12)
    return v1.createElement(l_Pane_0, {
        Size = v12.Size, 
        LayoutOrder = v12.modifier or 0, 
        Style = v12.currentMod == v12.modifier and "SubtleBorderBox" or "None", 
        OnClick = function()
            v12.onSelect(v12.modifier);
        end, 
        Layout = Enum.FillDirection.Horizontal
    }, {
        Text = v1.createElement(l_TextLabel_0, {
            Text = v11[v12.modifier] or v3.getNamedEmoji("large-yellow-square")
        })
    });
end;
local v14 = v1.PureComponent:extend("EmojiPage");
v14.init = function(v15)
    v15._enteredButton = nil;
    v15.state = {
        modifier = nil
    };
    v15._onSelect = function(v16)
        v15:setState({
            modifier = v16 or v1.None
        });
    end;
    v15.GetIconProps = function(v17, _, v19, v20)
        local l_props_0 = v15.props;
        return {
            Size = v20, 
            Text = v17.text, 
            BackgroundTransparency = 1, 
            TextSize = 18, 
            TextScaled = l_props_0.TextScaled, 
            Position = v19, 
            [v1.Event.MouseEnter] = function(v22)
                v15._enteredButton = v22;
                l_props_0.onHoverFunc(v17.name);
            end, 
            [v1.Event.MouseLeave] = function(v23)
                if v15._enteredButton == v23 then
                    l_props_0.onHoverFunc(nil);
                    v15._enteredButton = nil;
                end;
            end, 
            [v1.Event.MouseButton1Click] = function()
                v10.Get():SetIcon(l_props_0.tagName, v17.name);
                l_props_0.closeFunc();
            end
        };
    end;
end;
v14.render = function(v24)
    local l_props_1 = v24.props;
    local l_EmojiPage_0 = l_props_1.Stylizer.EmojiPage;
    local v27 = {};
    local v28 = v3.getCategories();
    local l_modifier_0 = v24.state.modifier;
    local v30 = 1;
    for v31 = 1, #v28 do
        for _, v33 in pairs(v28[v31].items) do
            if not (l_props_1.search and not v33.name:find(l_props_1.search)) then
                if (not l_modifier_0 or not v33.alts) or not v33.alts[l_modifier_0] then
                    v27[v30] = {
                        name = "emoji:" .. v33.name, 
                        text = v33.base
                    };
                else
                    v27[v30] = {
                        name = "emoji:" .. v33.name .. l_modifier_0, 
                        text = v33.alts[l_modifier_0]
                    };
                end;
                v30 = v30 + 1;
            end;
        end;
    end;
    local v34 = {
        [1] = v1.createElement(v13, {
            Size = l_EmojiPage_0.SkinToneModifierButtonSize, 
            modifier = nil, 
            currentMod = l_modifier_0, 
            onSelect = v24._onSelect
        })
    };
    for v35, _ in pairs(v11) do
        v34[v35] = v1.createElement(v13, {
            Size = l_EmojiPage_0.SkinToneModifierButtonSize, 
            modifier = v35, 
            currentMod = l_modifier_0, 
            onSelect = v24._onSelect
        });
    end;
    return v1.createElement(l_Pane_0, {
        Size = l_props_1.Size, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Padding = l_EmojiPage_0.Padding
    }, {
        SkinToneModifierPane = v1.createElement(l_Pane_0, {
            Size = l_EmojiPage_0.SkinToneModifierPaneSize, 
            Layout = Enum.FillDirection.Horizontal
        }, v34), 
        Grid = v1.createElement(l_Grid_0, {
            Size = l_EmojiPage_0.GridSize, 
            Position = l_EmojiPage_0.GridPosition, 
            CellSize = l_EmojiPage_0.GridCellSize, 
            Cells = v27, 
            CellComponent = "TextButton", 
            GetCellProps = v24.GetIconProps
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v14));
