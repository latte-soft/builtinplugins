local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Separator_0 = l_UI_0.Separator;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_StudioDebuggerDropdownMenuSelectionRerender_0 = game:GetFastFlag("StudioDebuggerDropdownMenuSelectionRerender");
local v14 = v1.PureComponent:extend("DropdownField");
local _ = function(v15)
    for _, v17 in pairs(v15) do
        if not v17 then
            return false;
        end;
    end;
    return true;
end;
local _ = function(v19)
    for _, v21 in pairs(v19) do
        if v21 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v23)
    local v24;
    for _, v26 in pairs(v23) do
        if not v26 then
            v24 = false;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v24 = true;
    ::label0::;
    if not v24 then
        for _, v28 in pairs(v23) do
            if v28 then
                v24 = true;
                goto label1 --[[  true, false  ]];
            end;
        end;
        v24 = false;
        ::label1::;
        if not v24 then
            return false;
        else
            return l_Checkbox_0.Indeterminate;
        end;
    else
        return true;
    end;
end;
v14.init = function(v30)
    v30.state = {
        isOpen = false
    };
    v30.onDropdownClick = function(v31)
        local l_props_0 = v30.props;
        local v33 = {};
        local v34 = v3.Dictionary.join(l_props_0.KeyStates, {
            [v31] = not l_props_0.KeyStates[v31]
        });
        for v35, v36 in ipairs(v30.props.KeyTexts) do
            if not (not (v35 ~= 1) or not v34[v35]) then
                table.insert(v33, v36);
            end;
        end;
        l_props_0.ClickCallback(v33);
    end;
    v30.onAllDropdownClick = function(_)
        local l_props_1 = v30.props;
        local v39;
        for _, v41 in pairs(l_props_1.KeyStates) do
            if not v41 then
                v39 = false;
                goto label2 --[[  true, false  ]];
            end;
        end;
        v39 = true;
        ::label2::;
        local v42 = not v39;
        v39 = {};
        if v42 then
            for v43, v44 in ipairs(v30.props.KeyTexts) do
                if v43 ~= 1 then
                    table.insert(v39, v44);
                end;
            end;
        end;
        l_props_1.ClickCallback(v39);
    end;
    v30.onRenderItem = function(_, v46, _)
        local l_props_2 = v30.props;
        local l_Localization_0 = l_props_2.Localization;
        local l_Style_0 = l_props_2.Style;
        local l_createElement_0 = v1.createElement;
        local l_l_Pane_0_0 = l_Pane_0;
        local v53 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v46, 
            Stylizer = l_Style_0, 
            BackgroundColor = l_Style_0.MainBackground, 
            BorderColor = l_Style_0.BorderColor
        };
        local v54 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_Checkbox_0_0 = l_Checkbox_0;
        local v57 = {
            LayoutOrder = 1, 
            Key = v46
        };
        local v58;
        if v46 == 1 then
            local l_KeyStates_0 = l_props_2.KeyStates;
            local v60;
            for _, v62 in pairs(l_KeyStates_0) do
                if not v62 then
                    v60 = false;
                    goto label4 --[[  true, false  ]];
                end;
            end;
            v60 = true;
            ::label4::;
            if not v60 then
                for _, v64 in pairs(l_KeyStates_0) do
                    if v64 then
                        v60 = true;
                        goto label5 --[[  true, false  ]];
                    end;
                end;
                v60 = false;
                ::label5::;
                v58 = not not v60 and l_Checkbox_0.Indeterminate;
            else
                v58 = true;
            end;
            if v58 then
                goto label3;
            end;
        end;
        v58 = l_props_2.KeyStates[v46];
        ::label3::;
        v57.Checked = v58;
        v57.OnClick = v46 == 1 and v30.onAllDropdownClick or v30.onDropdownClick;
        v57.Text = l_Localization_0:getText(l_props_2.Widget, v30.props.KeyTexts[v46]);
        v57.Stylizer = l_Style_0;
        v54.CheckboxView = l_createElement_1(l_l_Checkbox_0_0, v57);
        l_createElement_1 = false;
        if v46 == 1 then
            l_createElement_1 = v1.createElement(l_Separator_0, {
                LayoutOrder = 2, 
                Position = UDim2.new(0.5, 0, 1, 0), 
                DominantAxis = Enum.DominantAxis.Width, 
                Style = l_Style_0.Separator, 
                Stylizer = l_Style_0
            });
        end;
        v54.SeparatorView = l_createElement_1;
        v54.Tooltip = (v30.props.Tooltips and v30.props.Tooltips[v46]) and v1.createElement(l_Tooltip_0, {
            Text = v30.props.Tooltips[v46]
        });
        return l_createElement_0(l_l_Pane_0_0, v53, v54);
    end;
    v30.openMenu = function()
        v30:setState(function(_)
            return {
                isOpen = true
            };
        end);
    end;
    v30.closeMenu = function()
        v30:setState(function(_)
            return {
                isOpen = false
            };
        end);
    end;
end;
v14.render = function(v67)
    local l_props_3 = v67.props;
    local l_Style_1 = l_props_3.Style;
    local l_Localization_1 = l_props_3.Localization;
    local v71 = not l_props_3.ShouldShowDropdownIcon and not l_props_3.HamburgerMenu;
    local v72 = "";
    if v71 then
        if l_props_3.NumDisplay == 0 then
            v72 = l_Localization_1:getText("Common", "None");
        elseif l_props_3.NumDisplay == 1 then
            for v73, v74 in pairs(l_props_3.KeyStates) do
                if v74 then
                    v72 = l_Localization_1:getText(l_props_3.Widget, v67.props.KeyTexts[v73]);
                end;
            end;
        else
            v72 = if l_props_3.NumDisplay == l_props_3.MaxDisplay then l_Localization_1:getText(l_props_3.Widget, v67.props.KeyTexts[1]) else l_Localization_1:getText(l_props_3.Widget, "DropdownFieldText", {
                NumFields = l_props_3.NumDisplay
            });
        end;
    end;
    local v75 = if not v71 then v4.BUTTON_SIZE else l_props_3.DropdownWidth;
    local v76 = {};
    if l_StudioDebuggerDropdownMenuSelectionRerender_0 then
        for v77, _ in ipairs(l_props_3.KeyTexts) do
            if v77 == 1 then
                local v79 = l_props_3.KeyTexts[v77];
                local l_KeyStates_1 = l_props_3.KeyStates;
                local v81;
                for _, v83 in pairs(l_KeyStates_1) do
                    if not v83 then
                        v81 = false;
                        goto label6 --[[  true, false  ]];
                    end;
                end;
                v81 = true;
                ::label6::;
                local v84;
                if not v81 then
                    for _, v86 in pairs(l_KeyStates_1) do
                        if v86 then
                            v81 = true;
                            goto label7 --[[  true, false  ]];
                        end;
                    end;
                    v81 = false;
                    ::label7::;
                    v84 = not not v81 and l_Checkbox_0.Indeterminate;
                else
                    v84 = true;
                end;
                table.insert(v76, v79 .. tostring(v84));
            else
                table.insert(v76, l_props_3.KeyTexts[v77] .. tostring(l_props_3.KeyStates[v77]));
            end;
        end;
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(0, v75, 1, 0), 
        LayoutOrder = l_props_3.LayoutOrder
    }, {
        IconView = l_props_3.ShouldShowDropdownIcon and v1.createElement(l_IconButton_0, {
            Size = UDim2.new(0, v4.BUTTON_SIZE, 0, v4.BUTTON_SIZE), 
            LeftIcon = "rbxasset://textures/Debugger/Breakpoints/filter.png", 
            TooltipText = l_props_3.Tooltip, 
            OnClick = v67.openMenu
        }), 
        HamburgerIconView = l_props_3.HamburgerMenu and v1.createElement(l_IconButton_0, {
            Size = UDim2.new(0, v4.BUTTON_SIZE, 0, v4.BUTTON_SIZE), 
            LeftIcon = "rbxasset://textures/Debugger/Breakpoints/MoreButton.png", 
            OnClick = v67.openMenu, 
            BackgroundStyle = "Box"
        }), 
        ButtonView = v71 and v1.createElement(l_Button_0, {
            Text = v72, 
            TextSize = l_Style_1.TextSize, 
            Font = l_Style_1.Font, 
            Size = UDim2.new(1, 0, 1, 0), 
            Stylizer = l_Style_1, 
            BorderSizePixel = 0, 
            OnClick = v67.openMenu, 
            Tooltip = l_props_3.Tooltip
        }), 
        DropdownView = v1.createElement(l_DropdownMenu_0, {
            Width = l_props_3.DropdownWidth, 
            Hide = not v67.state.isOpen, 
            Items = if not l_StudioDebuggerDropdownMenuSelectionRerender_0 then v67.props.KeyTexts else v76, 
            OnFocusLost = v67.closeMenu, 
            OnRenderItem = v67.onRenderItem, 
            Stylizer = l_Style_1
        })
    });
end;
return v14;
