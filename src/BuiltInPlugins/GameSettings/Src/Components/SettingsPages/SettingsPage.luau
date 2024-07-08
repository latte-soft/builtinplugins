local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v4.Util;
local l_UI_0 = v4.UI;
local v9 = if not v1 then l_UI_0.Container else nil;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = if not v1 then l_Util_0.FitFrame.FitFrameOnAxis else nil;
local v15 = require(l_Parent_0.Src.Components.Header);
local v16 = require(l_Parent_0.Src.Components.SettingsPages.LoadFailedPage);
local v17 = require(l_Parent_0.Src.Thunks.LoadPageSettings);
local v18 = require(l_Parent_0.Src.Thunks.SavePageSettings);
local v19 = require(l_Parent_0.Src.Actions.SetPageSaveState);
local v20 = require(l_Parent_0.Src.Util.LoadState);
local v21 = require(l_Parent_0.Src.Util.SaveState);
local v22 = v2.Component:extend(script.Name);
v22.init = function(v23)
    v23.scrollingFrameRef = v2.createRef();
    v23.contentHeightChanged = function(v24)
        local l_current_0 = v23.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v24.AbsoluteContentSize.Y + v23.props.Stylizer.settingsPage.settingPadding);
        end;
    end;
end;
v22.didMount = function(v26)
    local l_props_0 = v26.props;
    local l_LoadState_0 = l_props_0.LoadState;
    local l_SaveState_0 = l_props_0.SaveState;
    local l_SettingsLoadJobs_0 = l_props_0.SettingsLoadJobs;
    local l_PageId_0 = l_props_0.PageId;
    if l_LoadState_0 == v20.Unloaded then
        l_props_0.LoadPageSettings(l_PageId_0, l_SettingsLoadJobs_0);
    end;
    if l_SaveState_0 == nil then
        l_props_0.SetPageSaveState(l_PageId_0, v21.Unsaved);
    end;
end;
v22.didUpdate = function(v32, v33, _)
    local l_props_1 = v32.props;
    local l_PageId_1 = l_props_1.PageId;
    local l_SettingsSaveJobs_0 = l_props_1.SettingsSaveJobs;
    local l_SaveState_1 = l_props_1.SaveState;
    local l_SaveState_2 = v33.SaveState;
    if l_SaveState_1 == v21.Pending and l_SaveState_1 ~= l_SaveState_2 then
        l_props_1.SavePageSettings(l_PageId_1, l_SettingsSaveJobs_0);
    end;
end;
v22.render = function(v40)
    local l_props_2 = v40.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Title_0 = l_props_2.Title;
    local l_LoadState_1 = l_props_2.LoadState;
    local l_SettingsLoadJobs_1 = l_props_2.SettingsLoadJobs;
    local l_PageId_2 = l_props_2.PageId;
    local v47 = true;
    if l_props_2.ShowHeader ~= nil then
        v47 = l_props_2.ShowHeader;
    end;
    if l_LoadState_1 <= v20.Loading then
        return v2.createElement(if not v1 then v9 else l_Pane_0, {}, {
            Loading = v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            })
        });
    elseif l_LoadState_1 == v20.LoadFailed then
        return v2.createElement(v16, {
            OnRetry = function()
                l_props_2.LoadPageSettings(l_PageId_2, l_SettingsLoadJobs_1);
            end
        });
    elseif l_LoadState_1 == v20.Loaded then
        return v2.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Layout = if not v1 then nil else Enum.FillDirection.Vertical, 
            Padding = if not v1 then nil else {
                Top = l_Stylizer_0.settingsPage.marginY, 
                Bottom = l_Stylizer_0.settingsPage.marginY, 
                Left = l_Stylizer_0.settingsPage.marginX, 
                Right = l_Stylizer_0.settingsPage.marginX
            }, 
            Spacing = if not v1 then nil else UDim.new(0, l_Stylizer_0.settingsPage.settingPadding), 
            [v2.Ref] = v40.scrollingFrameRef
        }, {
            Layout = if not v1 then v2.createElement("UIListLayout", {
                [v2.Change.AbsoluteContentSize] = v40.contentHeightChanged, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_Stylizer_0.settingsPage.settingPadding)
            }) else nil, 
            Padding = if not v1 then v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Stylizer_0.settingsPage.marginX), 
                PaddingRight = UDim.new(0, l_Stylizer_0.settingsPage.marginX)
            }) else nil, 
            Header = v47 and if v1 then v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Style = "Title", 
                Text = l_Title_0, 
                TextSize = 30
            }) else v2.createElement(v15, {
                LayoutOrder = 1, 
                Title = l_Title_0
            }), 
            Content = v2.createElement(if not v1 then v14 else l_Pane_0, if not v1 then {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                axis = v14.Axis.Vertical, 
                minimumSize = UDim2.new(1, 0, 0, 0), 
                contentPadding = UDim.new(0, l_Stylizer_0.settingsPage.settingPadding)
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 2, 
                Spacing = l_Stylizer_0.settingsPage.settingPadding
            }, v40.props.CreateChildren())
        });
    else
        return nil;
    end;
end;
return (v3.connect(function(v48, v49)
    local l_PageId_3 = v49.PageId;
    return {
        LoadState = v48.PageLoadState[l_PageId_3] or v20.Unloaded, 
        SaveState = v48.PageSaveState[l_PageId_3]
    };
end, function(v51)
    return {
        LoadPageSettings = function(v52, v53)
            v51(v17(v52, v53));
        end, 
        SavePageSettings = function(v54, v55)
            v51(v18(v54, v55));
        end, 
        SetPageSaveState = function(v56, v57)
            v51(v19(v56, v57));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v22))));
