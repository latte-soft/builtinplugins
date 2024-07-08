local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ForceRerender);
local v5 = require(l_script_FirstAncestor_0.Src.Components.PickTabMenu);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v7 = v6();
local v8 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(script.AssetPaletteTab);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Tabs_0 = l_UI_0.Tabs;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v19)
    local v20 = l_Analytics_0:use();
    local v21 = l_Localization_0:use();
    local v22 = l_Stylizer_0:use("AssetPalettes");
    local v23 = v3.useRef(nil);
    local v24 = v3.useRef(nil);
    local v25 = v3.useRef({});
    local v26, v27 = v3.useState(100);
    local v28, v29 = v3.useState(100);
    local v30, v31 = v3.useState(Vector2.new());
    local v32 = v8[v19.SelectedTab];
    local v35 = v3.useMemo(function()
        if v32 == nil then
            return nil;
        else
            return v1.collectArray(v32, function(_, v34)
                return {
                    Key = v34.Key, 
                    Label = v21:getText("AssetPalettes", v34.Key)
                };
            end);
        end;
    end, {
        v32
    });
    local v38 = if not v7 then nil else v3.useMemo(function()
        return v1.collectArray(v32, function(_, v37)
            return {
                Text = v21:getText("AssetPalettes", v37.Key), 
                OnItemClicked = function()
                    if v19.SelectedPalette == v37.Key then
                        v19.SetSelectedPalette(nil);
                        return ;
                    else
                        v19.SetSelectedPalette(v37.Key);
                        assert(v24.current ~= nil, "Ref to palette tabs is nil");
                        assert(v25.current ~= nil, "Ref to palette tabs list is nil");
                        v31(Vector2.new(v25.current[v37.Key].current.AbsolutePosition.X - v24.current.AbsolutePosition.X, 0));
                        return ;
                    end;
                end, 
                Checked = v37.Key == v19.SelectedPalette
            };
        end);
    end, {
        v21, 
        v32, 
        v19.SelectedPalette, 
        v19.SetSelectedPalette
    });
    local v39 = v26 < v28;
    if v7 then
        v3.useEffect(function()
            assert(v23.current ~= nil, "Ref to palette tabs frame is nil");
            v27(v23.current.AbsoluteSize.X);
            assert(v24.current ~= nil, "Ref to palette tabs is nil");
            v29(v24.current.AbsoluteSize.X);
        end, {});
    end;
    if v32 == nil then
        return nil;
    elseif not v6() then
        return (v3.createElement(l_ScrollingFrame_0, v1.join({
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Spacing = v22.ScrollingFrame.Spacing, 
            Size = v22.Size, 
            Style = v22.ScrollingFrame
        }, v19.ScrollingFrameProps), {
            Tabs = v3.createElement(v4, {
                component = l_Tabs_0, 
                innerProps = {
                    SelectedTab = v19.SelectedPalette, 
                    OnTabSelected = function(v40)
                        v20:report("openPalette", v40.Key);
                        v19.SetSelectedPalette(function(v41)
                            if v41 == v40.Key then
                                return nil;
                            else
                                return v40.Key;
                            end;
                        end);
                    end, 
                    Tabs = v35, 
                    TabComponent = v11
                }, 
                dependencies = {
                    v35
                }
            })
        }));
    else
        return (v3.createElement(l_Pane_0, {
            LayoutOrder = v19.LayoutOrder, 
            Size = v22.Size, 
            ref = v23, 
            [v3.Change.AbsoluteSize] = function(v42)
                v27(v42.AbsoluteSize.X);
            end
        }, {
            ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                CanvasPosition = v30, 
                Layout = Enum.FillDirection.Horizontal, 
                OnScrollUpdate = v31, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                Spacing = v22.ScrollingFrame.Spacing, 
                Size = UDim2.new(1, not v39 and 0 or -32, 1, 0), 
                Style = v22.ScrollingFrame
            }, {
                Tabs = v3.createElement(v4, {
                    component = l_Tabs_0, 
                    innerProps = {
                        SelectedTab = v19.SelectedPalette, 
                        OnTabSelected = function(v43)
                            v20:report("openPalette", v43.Key);
                            v19.SetSelectedPalette(function(v44)
                                if v44 == v43.Key then
                                    return nil;
                                else
                                    return v43.Key;
                                end;
                            end);
                        end, 
                        Tabs = v35, 
                        TabComponent = v11, 
                        ref = v24, 
                        TabsListRef = v25, 
                        OnAbsoluteSizeChanged = function(v45)
                            v29(v45.AbsoluteSize.X);
                        end
                    }, 
                    dependencies = {
                        v35
                    }
                })
            }), 
            PickTabMenu = if not v39 then nil else v3.createElement(v5, {
                MenuTabs = v38, 
                BackgroundColor = v22.BackgroundColor, 
                BackgroundColorHover = v22.BackgroundColorHover
            })
        }));
    end;
end;
