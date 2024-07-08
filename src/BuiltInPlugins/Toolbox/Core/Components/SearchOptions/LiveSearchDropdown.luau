local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Util.DebugFlags);
local l_ShowOnTop_0 = v3.UI.ShowOnTop;
local v7 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local v8 = require(l_Parent_0.Core.Components.RoundFrame);
local v9 = require(l_Parent_0.Core.Components.SearchOptions.LiveSearchEntry);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v13 = v2.PureComponent:extend("LiveSearchDropdown");
v13.init = function(v14, _)
    v14.closeDropdown = function()
        if v14.props.closeDropdown then
            v14.props.closeDropdown();
        end;
    end;
    v14.onItemClicked = function(v16)
        if v14.props.onItemClicked then
            v14.props.onItemClicked(v16);
        end;
    end;
end;
v13.addEntry = function(v17, v18, v19, v20, v21)
    if not (v20.Name or not v5.shouldDebugWarnings()) then
        warn(("Index %d in DropdownMenu doesn't have a 'name' member"):format(v20));
    end;
    v18[if not v17.props.GetKey then v20.Name else v17.props.GetKey(v20)] = v2.createElement(v9, {
        Name = v20.Name, 
        Thumbnail = v20.Thumbnail, 
        LayoutOrder = v19, 
        closeDropdown = v17.closeDropdown, 
        onClick = function()
            v17.onItemClicked(v20);
        end
    });
    return v21 + v4.SEARCH_ENTRY_HEIGHT;
end;
v13.defaultLayout = function(v22, v23)
    local v24 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v25 = 0;
    local v26 = 0;
    if v23 then
        for _, v28 in ipairs(v23) do
            v26 = v22:addEntry(v24, v25, v28, v26);
            v25 = v25 + 1;
        end;
    end;
    return v24, v26;
end;
v13.render = function(v29)
    local v30 = v29.props.Position or UDim2.new();
    local l_Size_0 = v29.props.Size;
    local v32 = v29.props.LayoutOrder or 0;
    local v33 = v29.props.Items or {};
    local l_modalTarget_0 = v29.props.Modal.modalTarget;
    local v35 = v29.props.MaxHeight or v4.SEARCH_ENTRY_HEIGHT * 5;
    local l_dropdownMenu_0 = v29.props.Stylizer.dropdownMenu;
    local v37 = {};
    local v38, v39 = v29:defaultLayout(v33);
    local l_Offset_0 = l_Size_0.X.Offset;
    local l_Offset_1 = v30.Y.Offset;
    local l_Offset_2 = v30.X.Offset;
    v37.StyledScrollingFrame = v2.createElement(v7, {
        Position = UDim2.new(0, l_Offset_2, 0, l_Offset_1), 
        Size = UDim2.new(0, l_Offset_0, 0, (math.min(v39, v35))), 
        CanvasSize = UDim2.new(0, 0, 0, v39), 
        ZIndex = 1
    }, v38);
    v37.DropDownContainer = v2.createElement(v8, {
        Position = UDim2.new(0, l_Offset_2, 0, l_Offset_1), 
        Size = UDim2.new(0, l_Offset_0, 0, (math.min(v39, v35))), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        BorderColor3 = l_dropdownMenu_0.dropdownFrame.borderColor
    });
    return v2.createElement("Frame", {
        Position = v30, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v32
    }, {
        Portal = l_modalTarget_0 and v2.createElement(l_ShowOnTop_0, {
            Priority = 3
        }, {
            ClickEventDetectFrame = v2.createElement("ImageButton", {
                ZIndex = 10, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                [v2.Event.MouseButton1Click] = v29.closeDropdown
            }, v37)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v12
})(v13));
