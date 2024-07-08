local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v8.collectArray;
local l_copy_0 = v8.copy;
local l_includes_0 = v8.includes;
local l_mapOne_0 = v8.mapOne;
local l_startsWith_0 = v8.startsWith;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v20 = require(l_Parent_0.Src.Util.DesignHelpers);
local v21 = require(l_Parent_0.Src.Components.TokenTable);
local v22 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v23 = v2.PureComponent:extend("ThemesView");
v23.init = function(v24)
    v24.state = {
        Themes = nil, 
        SelectedTheme = nil
    };
    v24.updateThemes = function()
        local l_props_0 = v24.props;
        local l_DesignSheet_0 = l_props_0.DesignSheet;
        local v29 = l_collectArray_0(l_props_0.RootItem.Children, function(_, v28)
            return v28.Instance;
        end);
        v24:setState({
            Themes = v29, 
            SelectedTheme = l_mapOne_0(l_DesignSheet_0:GetDerives(), function(v30)
                local l_v30_Attribute_0 = v30:GetAttribute("StyleCategory");
                if (not l_v30_Attribute_0 or not l_startsWith_0(l_v30_Attribute_0, "Themes")) or not l_includes_0(v29, v30) then
                    return nil;
                else
                    return v30;
                end;
            end)
        });
    end;
    v24.toggleThemes = function(v32)
        v24:setState(function(v33)
            local v34 = l_copy_0(v33.Themes);
            local v35 = nil;
            for _, v37 in v34, nil, nil do
                if v37 == v32 then
                    v35 = v37;
                end;
            end;
            v22({
                Name = "StyleEditor.SetDerives", 
                DisplayName = "Style Editor - Set Derives", 
                DoChange = function()
                    v20.replaceDerive(v24.props.DesignSheet, v35, v33.SelectedTheme);
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return {
                Themes = v34, 
                SelectedTheme = v35
            };
        end);
    end;
    v24.updateThemes();
end;
v23.didUpdate = function(v38, v39, _)
    local l_props_1 = v38.props;
    if not (not (v39.IsDirty and not l_props_1.IsDirty) and v39.DesignSheet == l_props_1.DesignSheet) or v39.RootItem ~= l_props_1.RootItem then
        v38.updateThemes();
    end;
end;
v23.render = function(v42)
    local l_props_2 = v42.props;
    local l_state_0 = v42.state;
    local v45 = {};
    for v46, v47 in ipairs(l_state_0.Themes) do
        v45["Theme " .. v46] = v2.createElement(v21, {
            RootInstance = v47, 
            ThemeSelected = v47 == l_state_0.SelectedTheme, 
            OnClick = v42.toggleThemes
        });
    end;
    return v2.createElement(l_ScrollingFrame_0, {
        [v2.Tag] = "ScrollingAutomaticSize"
    }, {
        Themes = v2.createElement(l_SimpleExpandablePane_0, {
            AlwaysExpanded = true, 
            Text = l_props_2.RootItem.Name.Value .. " Themes", 
            [v2.Tag] = "X-ColumnM X-FitY X-PadS"
        }, {
            Column = v2.createElement(l_Pane_0, {
                [v2.Tag] = "X-ColumnM X-FitY"
            }, v45)
        })
    });
end;
return v3.connect(function(v48)
    return {
        DesignSheet = v48.Window.DesignSheet, 
        IsDirty = v48.Window.IsDirty
    };
end)((l_withContext_0({
    Localization = l_Localization_0
})(v23)));
