local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v3.Components;
local _ = l_Components_0.InputBlocker;
local _ = l_Components_0.FlowScreenLayout;
local l_ButtonWithDropdown_0 = l_Components_0.ButtonWithDropdown;
local l_ConfirmDialog_0 = l_Components_0.ConfirmDialog;
local l_ConfirmCancelDialog_0 = l_Components_0.ConfirmCancelDialog;
local l_ItemCharacteristics_0 = v3.Util.AccessoryAndBodyToolShared.ItemCharacteristics;
local v11 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v11.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v11.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local _ = require(l_Parent_0.Src.Util.ShowDialog);
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local v20 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerActivity);
local v21 = require(l_Parent_0.Src.Actions.SetControlsPanelBlockerMessage);
local v22 = require(l_Parent_0.Src.Thunks.ReleaseEditor);
local v23 = require(l_Parent_0.Src.Thunks.FinishEditing);
local v24 = require(l_Parent_0.Src.Util.Constants);
local v25 = require(l_Parent_0.Src.Util.ShowDialog);
local v26 = v1.PureComponent:extend("GenerateScreen");
local l_Util_0 = v11.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local _ = l_Util_0.StyleModifier;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
l_Typecheck_0.wrap(v26, script);
local v31 = game:DefineFastString("GenerateLegacyHelpLink", "https://create.roblox.com/docs/art/avatar");
v26.init = function(v32)
    v32.state = {
        items = {}, 
        generateText = nil, 
        generateKey = nil
    };
    v32.startGeneration = function()
        local l_props_0 = v32.props;
        local l_Localization_0 = l_props_0.Localization;
        v32.generateClicked = true;
        l_props_0.SetControlsPanelBlockerMessage(l_Localization_0:getText("Generate", "Wait"));
        l_props_0.SetControlsPanelBlockerActivity(true);
    end;
    v32.onGenerateClicked = function()
        local l_props_1 = v32.props;
        local l_state_0 = v32.state;
        local l_Localization_1 = l_props_1.Localization;
        local v38 = l_props_1.EditingItemContext:getItem();
        local l_generateKey_0 = l_state_0.generateKey;
        if l_ItemCharacteristics_0.isMeshPartWithSurfaceAppearance(v38) and l_generateKey_0 == v24.GENERATE_LEGACY_KEY then
            v25(l_props_1.Plugin, l_Localization_1, l_ConfirmCancelDialog_0, {
                Text = l_Localization_1:getText("Generate", "LegacyConversionDialog"), 
                OnConfirm = v32.startGeneration, 
                Title = l_Localization_1:getText("Dialog", "DefaultTitle"), 
                ConfirmText = l_Localization_1:getText("Dialog", "Continue"), 
                Link = {
                    Text = l_Localization_1:getText("Generate", "LearnMoreLegacy"), 
                    Url = v31
                }
            });
            return ;
        else
            v32.startGeneration();
            return ;
        end;
    end;
    v32.onSelectGenerateDropdownItem = function(_, _)
        v32.setupDropdownMenu();
    end;
    v32.setupDropdownMenu = function()
        local l_props_2 = v32.props;
        local v43 = l_props_2.EditingItemContext:getItem();
        local l_Localization_2 = l_props_2.Localization;
        local v45 = l_ItemCharacteristics_0.hasAnyCage(v43);
        local v46 = l_ItemCharacteristics_0.isLegacyAccessory(v43);
        local l_generateKey_1 = v32.state.generateKey;
        local v48 = {};
        local v49 = nil;
        if not v45 then
            if not v46 then
                if not l_generateKey_1 or l_generateKey_1 == v24.GENERATE_LEGACY_KEY then
                    v49 = v24.GENERATE_MESH_PART_KEY;
                    table.insert(v48, l_Localization_2:getText("Flow", v24.GENERATE_LEGACY_KEY));
                else
                    v49 = v24.GENERATE_LEGACY_KEY;
                    table.insert(v48, l_Localization_2:getText("Flow", v24.GENERATE_MESH_PART_KEY));
                end;
            else
                v49 = v24.GENERATE_LEGACY_KEY;
            end;
        else
            v49 = v24.GENERATE_MESH_PART_KEY;
        end;
        v32:setState({
            items = v48, 
            generateText = l_Localization_2:getText("Flow", v49), 
            generateKey = v49
        });
    end;
end;
v26.didMount = function(v50)
    v50.setupDropdownMenu();
end;
v26.render = function(v51)
    local l_props_3 = v51.props;
    local l_state_1 = v51.state;
    local l_items_0 = l_state_1.items;
    local l_generateText_0 = l_state_1.generateText;
    local l_InBounds_0 = l_props_3.InBounds;
    local l_GoToPrevious_0 = l_props_3.GoToPrevious;
    local l_Localization_3 = l_props_3.Localization;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local v60 = if l_InBounds_0 then nil else l_Localization_3:getText("Generate", "InvalidBoundsUGC");
    if l_InBounds_0 then
        v60 = l_Localization_3:getText("Generate", "Tooltip");
    end;
    local v61 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = 10
    }, {
        BackButton = v1.createElement(l_Button_0, {
            Text = l_Localization_3:getText("Flow", "Back"), 
            Style = "Round", 
            Size = UDim2.new(0, l_Stylizer_0.BackButtonWidth, 0, l_Stylizer_0.GenerateDropdownButtonHeight), 
            OnClick = l_GoToPrevious_0, 
            LayoutOrder = v61:getNextOrder()
        }), 
        GenerateDropdownButton = v1.createElement(l_ButtonWithDropdown_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Height = l_Stylizer_0.GenerateDropdownButtonHeight, 
            ButtonWidth = l_Stylizer_0.GenerateDropdownButtonWidth, 
            ArrowWidth = l_Stylizer_0.ArrowWidth, 
            LayoutOrder = v61:getNextOrder(), 
            TooltipText = v60, 
            ButtonIcon = if l_InBounds_0 then nil else l_Stylizer_0.WarningIcon, 
            IconSize = l_Stylizer_0.IconSize, 
            ButtonText = l_generateText_0, 
            Items = l_items_0, 
            ItemHeight = l_Stylizer_0.DropdownItemHeight, 
            OnSelectItem = v51.onSelectGenerateDropdownItem, 
            OnClick = v51.onGenerateClicked
        })
    });
end;
v26.didUpdate = function(v62, v63)
    if not ((not (v62.props.IsControlsPanelBlockerActive ~= v63.IsControlsPanelBlockerActive) or not v62.props.IsControlsPanelBlockerActive) or not v62.generateClicked) then
        task.delay(0, function()
            local v64 = v62.props.EditingItemContext:getItem();
            local v65 = v62.props.EditingItemContext:getSourceItemWithUniqueDeformerNames();
            local l_Analytics_0 = v62.props.Analytics;
            v62.props.FinishEditing(v62.props.LuaMeshEditingModuleContext, v64, v65, l_Analytics_0, v62.state.generateKey == v24.GENERATE_LEGACY_KEY);
            l_Analytics_0:getHandler("SessionEnded")();
            v62.props.SetControlsPanelBlockerActivity(false);
            v62.props.EditingItemContext:clear();
            v62.props.GoToNext();
            v62.props.ReleaseEditor();
            v62.props.EditingItemContext:setSourceItem(nil);
            v62.generateClicked = false;
            v25(v62.props.Plugin, v62.props.Localization, l_ConfirmDialog_0, {
                Text = v62.props.Localization:getText("Generate", "Success", {
                    name = v65.Name
                }), 
                OnClose = function()
                end
            });
        end);
    end;
end;
return v2.connect(function(v67, _)
    return {
        IsControlsPanelBlockerActive = v67.controlsPanelBlocker.isActive, 
        InBounds = v67.selectItem.inBounds
    };
end, function(v69)
    return {
        SetControlsPanelBlockerActivity = function(v70)
            v69(v20(v70));
        end, 
        SetControlsPanelBlockerMessage = function(v71)
            v69(v21(v71));
        end, 
        FinishEditing = function(v72, v73, v74, v75, v76)
            v69(v23(v72, v73, v74, v75, v76));
        end, 
        ReleaseEditor = function()
            v69(v22());
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Analytics = l_ContextServices_0.Analytics, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0
})(v26)));
