local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_LayoutOrderIterator_0 = require(l_Parent_1.Packages.Framework).Util.LayoutOrderIterator;
local v4 = require(l_Parent_0.Util.ConstantLayout);
local v5 = require(l_Parent_0.Util.StateInterfaceTheme);
local v6 = require(l_Parent_0.Components.PublishingHint);
local v7 = require(l_Parent_0.Components.PresetsPanel);
local v8 = require(l_Parent_0.Components.AvatarTypePanel);
local v9 = require(l_Parent_0.Components.AnimationPanel);
local v10 = require(l_Parent_0.Components.CollisionPanel);
local v11 = require(l_Parent_0.Components.ScalePanel);
local v12 = require(l_Parent_0.Components.AssetsPanel);
local v13 = v2.Component:extend("ComponentMorpherTemplate");
v13.init = function(v14)
    v14.frameRef = v2.createRef();
end;
v13.render = function(v15)
    local v16 = l_LayoutOrderIterator_0.new();
    local function v17()
        return {
            ThemeData = v15.props.ThemeData, 
            LayoutOrder = v16:getNextOrder(), 
            template = v15.props.template, 
            StateTemplates = v15.props.StateTemplates, 
            IsEnabled = v15.props.IsEnabled, 
            IsGameShutdownRequired = v15.props.IsGameShutdownRequired, 
            AssetOverrideErrors = v15.props.AssetOverrideErrors, 
            Mouse = v15.props.Mouse, 
            clobberTemplate = v15.props.clobberTemplate
        };
    end;
    local function _()
        local v18 = v17();
        v18.IsEnabled = v15.props.IsPlacePublished;
        return v18;
    end;
    local l_createElement_0 = v2.createElement;
    local v21 = "Frame";
    local v22 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v5.getBackgroundColor(v15.props), 
        [v2.Ref] = v15.frameRef
    };
    local v24 = {
        UIListLayoutVertical = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v4.VirticalPadding, 
            [v2.Change.AbsoluteContentSize] = function(v23)
                v15.frameRef.current.Size = UDim2.new(1, 0, 0, v23.AbsoluteContentSize.y);
            end
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_v6_0 = v6;
    local v27 = v17();
    v27.IsEnabled = v15.props.IsPlacePublished;
    v24.PublishingHint = l_createElement_1(l_v6_0, v27);
    v24.PresetsPanel = v2.createElement(v7, (v17()));
    v24.AvatarTypePanel = v2.createElement(v8, (v17()));
    v24.AnimationPanel = v2.createElement(v9, (v17()));
    v24.CollisionPanel = v2.createElement(v10, (v17()));
    v24.ScalePanel = v2.createElement(v11, (v17()));
    v24.AssetsPanel = v2.createElement(v12, (v17()));
    return l_createElement_0(v21, v22, v24);
end;
return v13;
