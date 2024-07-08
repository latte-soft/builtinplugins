local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_FlowScreenLayout_0 = v7.Components.FlowScreenLayout;
local l_ItemCharacteristics_0 = v7.Util.AccessoryAndBodyToolShared.ItemCharacteristics;
local l_EditingItemContext_0 = v7.Contexts.EditingItemContext;
local v11 = require(l_Parent_0.Src.Components.AssetTypeSelector);
local v12 = require(l_Parent_0.Src.Components.ScaleTypeDropdown);
local l_Pane_0 = v4.UI.Pane;
local l_Util_0 = v4.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v17 = v1.PureComponent:extend("AssetTypeScreen");
l_Typecheck_0.wrap(v17, script);
v17.init = function(v18)
    v18.state = {
        shouldShowScaleDropdown = true
    };
    v18.onEditingItemChanged = function(v19)
        if v19 then
            v18:setState({
                shouldShowScaleDropdown = not l_ItemCharacteristics_0.hasAnyCage(v19)
            });
            return ;
        else
            return ;
        end;
    end;
    v18.renderContent = function(v20)
        local l_props_0 = v18.props;
        local l_state_0 = v18.state;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_shouldShowScaleDropdown_0 = l_state_0.shouldShowScaleDropdown;
        local v25 = l_LayoutOrderIterator_0.new();
        return v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.ContentHeight), 
            LayoutOrder = v20, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_Stylizer_0.ContentSpacing
        }, {
            AssetTypeSelector = v1.createElement(v11, {
                LayoutOrder = v20 + v25:getNextOrder()
            }), 
            ScaleTypeDropdown = if not l_shouldShowScaleDropdown_0 then nil else v1.createElement(v12, {
                LayoutOrder = v20 + v25:getNextOrder()
            })
        });
    end;
end;
v17.didMount = function(v26)
    local _ = v26.props;
    local v28 = v26.props.EditingItemContext:getItem();
    v26.editingItemChangedHandle = v26.props.EditingItemContext:getEditingItemChangedSignal():Connect(v26.onEditingItemChanged);
    v26.onEditingItemChanged(v28);
end;
v17.render = function(v29)
    local l_props_2 = v29.props;
    local _ = v29.state;
    local l_GoToNext_0 = l_props_2.GoToNext;
    local l_GoToPrevious_0 = l_props_2.GoToPrevious;
    local l_AccessoryTypeInfo_0 = l_props_2.AccessoryTypeInfo;
    local l_Localization_0 = l_props_2.Localization;
    return v1.createElement(l_Pane_0, {
        Style = "Box"
    }, {
        Screen = v1.createElement(l_FlowScreenLayout_0, {
            Title = l_Localization_0:getText("AssetType", "AssetType"), 
            PromptText = l_Localization_0:getText("AssetType", "Prompt"), 
            NextButtonText = l_Localization_0:getText("Flow", "Next"), 
            BackButtonText = l_Localization_0:getText("Flow", "Back"), 
            NextButtonEnabled = l_AccessoryTypeInfo_0 ~= nil, 
            BackButtonEnabled = true, 
            Scrollable = true, 
            HasBackButton = true, 
            GoToNext = l_GoToNext_0, 
            GoToPrevious = l_GoToPrevious_0, 
            RenderContent = v29.renderContent
        })
    });
end;
v17.willUnmount = function(v36)
    if v36.editingItemChangedHandle then
        v36.editingItemChangedHandle:Disconnect();
        v36.editingItemChangedHandle = nil;
    end;
end;
return v2.connect(function(v37, _)
    return {
        AccessoryTypeInfo = v37.selectItem.accessoryTypeInfo
    };
end, nil)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v17)));
