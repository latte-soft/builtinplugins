local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ForceRerender);
local v5 = require(l_script_FirstAncestor_0.Src.Components.CategoryTab);
local v6 = require(l_script_FirstAncestor_0.Src.Components.PickTabMenu);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v8 = v7();
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Tabs_0 = l_UI_0.Tabs;
return function(v19)
    local v20 = l_Analytics_0:use();
    local v21 = l_Localization_0:use();
    local v22 = l_Stylizer_0:use("TabBar");
    local v23 = v3.useRef(nil);
    local v24 = v3.useRef(nil);
    local v25 = v3.useRef({});
    local v26, v27 = v3.useState(100);
    local v28, v29 = v3.useState(100);
    local v30, v31 = v3.useState(Vector2.new());
    local v33 = v3.useMemo(function()
        return v1.map(v19.Tabs, function(v32)
            return {
                Key = v32, 
                Label = v21:getText("Categories", v32)
            };
        end);
    end, {
        v21, 
        v19.Tabs
    });
    local v35 = if not v8 then nil else v3.useMemo(function()
        return v1.map(v19.Tabs, function(v34)
            return {
                Text = v21:getText("Categories", v34), 
                OnItemClicked = function()
                    v19.SetSelectedTab(v34);
                    assert(v24.current ~= nil, "Ref to category tabs is nil");
                    assert(v25.current ~= nil, "Ref to category tabs list is nil");
                    v31(Vector2.new(v25.current[v34].current.AbsolutePosition.X - v24.current.AbsolutePosition.X, 0));
                end, 
                Checked = v34 == v19.SelectedTab
            };
        end);
    end, {
        v21, 
        v19.Tabs, 
        v19.SelectedTab, 
        v19.SetSelectedTab
    });
    local v36 = v26 < v28;
    if v8 then
        v3.useEffect(function()
            assert(v23.current ~= nil, "Ref to category tabs frame is nil");
            v27(v23.current.AbsoluteSize.X);
            assert(v24.current ~= nil, "Ref to category tabs is nil");
            v29(v24.current.AbsoluteSize.X);
        end, {});
    end;
    return v3.createElement(l_Pane_0, {
        LayoutOrder = v19.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 32), 
        Style = "SubtleBox", 
        ref = if not v7() then nil else v23, 
        [v3.Change.AbsoluteSize] = if not v7() then nil else function(v37)
            v27(v37.AbsoluteSize.X);
        end
    }, {
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            CanvasPosition = if not v7() then nil else v30, 
            OnScrollUpdate = if not v7() then nil else v31, 
            Padding = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ScrollBarThickness = 0, 
            Size = if not v7() then nil else UDim2.new(1, not v36 and 0 or -32, 1, 0)
        }, {
            Tabs = v3.createElement(v4, {
                component = l_Tabs_0, 
                innerProps = {
                    SelectedTab = v19.SelectedTab, 
                    OnTabSelected = function(v38)
                        v20:report("openTab", v38.Key);
                        v19.SetSelectedTab(v38.Key);
                    end, 
                    Tabs = v33, 
                    TabComponent = if not v7() then nil else v5, 
                    ref = if not v7() then nil else v24, 
                    TabsListRef = v25, 
                    OnAbsoluteSizeChanged = if not v7() then nil else function(v39)
                        v29(v39.AbsoluteSize.X);
                    end
                }, 
                dependencies = {
                    v33
                }
            })
        }), 
        PickTabMenu = if not not v7() and v36 then v3.createElement(v6, {
            MenuTabs = v35, 
            BackgroundColor = v22.BackgroundColor, 
            BackgroundColorHover = v22.BackgroundColorHover
        }) else nil
    });
end;
