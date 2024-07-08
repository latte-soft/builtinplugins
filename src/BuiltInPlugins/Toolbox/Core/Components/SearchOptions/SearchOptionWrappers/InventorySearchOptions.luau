local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.React);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v5.ContextServices;
local v7 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.UserAndGroupFilter);
local v8 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v9 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.SearchOptionsLayout);
local v10 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.VerfifiedCreatorCheckbox);
local l_Checkbox_0 = v5.UI.Checkbox;
local l_HoverArea_0 = v5.UI.HoverArea;
local l_RadioButtonList_0 = v5.UI.RadioButtonList;
local l_Pane_0 = v5.UI.Pane;
local _ = require(l_script_FirstAncestor_0.Core.Reducers.PageInfo);
local _ = require(l_script_FirstAncestor_0.Core.Reducers.LiveSearch);
local v17 = require(l_script_FirstAncestor_0.Core.Util.getUserId);
local v18 = require(l_script_FirstAncestor_0.Core.Util.getUsername);
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local l_showRobloxCreatedAssets_0 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v21 = require(l_script_FirstAncestor_0.Core.Types.BackendTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.CreatorTypes);
local v23 = require(l_script_FirstAncestor_0.Core.Hooks.useSelector);
local l_useCallback_0 = v3.useCallback;
local l_useMemo_0 = v3.useMemo;
local l_useState_0 = v3.useState;
local v27 = {
    IncludeUnverifiedCreators = "includeUnverifiedCreators", 
    MyAssets = "myAssets", 
    MyCreations = "myCreations"
};
return function(v28)
    local v29 = l_ContextServices_0.Localization:use();
    local v31 = v23(function(v30)
        return v2.Dictionary.join(v30.pageInfo);
    end);
    local v33 = v23(function(v32)
        return v32.liveSearch;
    end);
    local v34 = l_useMemo_0(function()
        return {
            Id = v17(), 
            Name = v18(), 
            Type = Enum.CreatorType.User
        };
    end, {});
    local v35, v36 = l_useState_0(nil);
    local v37, v38 = l_useState_0(function()
        if not v31.creatorTargetIds then
            return {};
        else
            return v31.creatorTargetIds;
        end;
    end);
    local v39, v40 = l_useState_0(function()
        if not v31.groupTargetIds then
            return {};
        else
            return v31.groupTargetIds;
        end;
    end);
    local v41, v42 = l_useState_0(function()
        if not v31.uiSortIntent then
            return v21.UiSortIntent.Default;
        else
            return v31.uiSortIntent;
        end;
    end);
    local v43, v44 = l_useState_0(function()
        return {
            includeUnverifiedCreators = v31.includeUnverifiedCreators, 
            myCreations = v37[tostring(v34.Id)] ~= nil, 
            myAssets = v31.excludeGroupCreations
        };
    end);
    local v45 = l_useMemo_0(function()
        return v2.Dictionary.join(v37, {
            [tostring(v34.Id)] = v2.None
        });
    end, {
        v37
    });
    local v46 = l_useMemo_0(function()
        return not l_showRobloxCreatedAssets_0();
    end, {});
    local v47 = l_useMemo_0(function()
        return {
            {
                Key = v21.UiSortIntent.Relevance, 
                Text = v29:getText("SearchOptionsSort", "Relevance")
            }, 
            {
                Key = v21.UiSortIntent.Name, 
                Text = v29:getText("SearchOptionsSort", "Name")
            }, 
            {
                Key = v21.UiSortIntent.DateModified, 
                Text = v29:getText("SearchOptionsSort", "DateModified")
            }, 
            {
                Key = v21.UiSortIntent.DateCreated, 
                Text = v29:getText("SearchOptionsSort", "DateCreated")
            }, 
            {
                Key = v21.UiSortIntent.Creator, 
                Text = v29:getText("SearchOptionsSort", "Creator")
            }
        };
    end, {
        v29
    });
    local v48 = l_useCallback_0(function()
        v36(nil);
        v38({});
        v40({});
        v42(v21.UiSortIntent.Default);
        v44({
            includeUnverifiedCreators = false, 
            myCreations = false, 
            myAssets = false
        });
    end, {
        v31
    });
    local v52 = l_useCallback_0(function(v49)
        local function v51(v50)
            return v2.Dictionary.join(v50, {
                [tostring(v49.Id)] = v49
            });
        end;
        if v49.Type == Enum.CreatorType.User then
            v38(v51);
            return ;
        else
            v40(v51);
            return ;
        end;
    end, {});
    local v56 = l_useCallback_0(function(v53)
        local function v55(v54)
            return v2.Dictionary.join(v54, {
                [tostring(v53.Id)] = v2.None
            });
        end;
        if v53.Type == Enum.CreatorType.User then
            v38(v55);
            return ;
        else
            v40(v55);
            return ;
        end;
    end, {});
    local v60 = l_useCallback_0(function(v57)
        local v58 = nil;
        v44(function(v59)
            v58 = not v59[v57];
            return v2.Dictionary.join(v59, {
                [v57] = v58
            });
        end);
        return v58;
    end, {});
    local v61 = l_useCallback_0(function()
        v60(v27.IncludeUnverifiedCreators);
    end, {});
    local v62 = l_useCallback_0(function()
        if not v60(v27.MyCreations) then
            v56(v34);
            return ;
        else
            v52(v34);
            return ;
        end;
    end, {
        v43.myCreations, 
        v34
    });
    local v64 = l_useCallback_0(function(v63)
        v52(v63);
        v36(nil);
    end, {});
    local v66 = l_useCallback_0(function(v65)
        v36(v65);
    end, {});
    local v69 = l_useCallback_0(function(_, v68)
        v56(v68);
    end, {});
    local v70 = l_useCallback_0(function()
        return {
            Creator = if v43.myCreations then nil else v35, 
            creatorTargetIds = v37, 
            excludeGroupCreations = v43.myAssets, 
            groupTargetIds = v39, 
            includeUnverifiedCreators = v43.includeUnverifiedCreators, 
            uiSortIntent = v41
        };
    end, {
        v35, 
        v37, 
        v43, 
        v39, 
        v41
    });
    local v71 = l_LayoutOrderIterator_0.new();
    return v4.createElement(v9, {
        GetSearchOptions = v70, 
        OnClose = v28.OnClose, 
        OnReset = v48
    }, {
        CreatorAndGroup = if not v46 then nil else v4.createElement(v8, {
            Header = v29:getText("General", "SearchOptionCreatorAndGroups"), 
            LayoutOrder = v71:getNextOrder()
        }, {
            VerfifiedCreatorCheckbox = v4.createElement(v10, {
                LayoutOrder = v71:getNextOrder(), 
                IsChecked = v43.includeUnverifiedCreators, 
                OnClick = v61
            }), 
            CreatorGroupFilterContainer = v4.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v71:getNextOrder(), 
                Spacing = 6
            }, {
                MyCreationsCheckbox = v4.createElement(l_Checkbox_0, {
                    Checked = v43.myCreations, 
                    Key = v27.MyCreations, 
                    LayoutOrder = v71:getNextOrder(), 
                    OnClick = v62, 
                    Text = v29:getText("General", "MyCreations")
                }, {
                    HoverArea = v4.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                }), 
                MyAssetsCheckbox = v4.createElement(l_Checkbox_0, {
                    Checked = v43.myAssets, 
                    Key = v27.MyAssets, 
                    LayoutOrder = v71:getNextOrder(), 
                    OnClick = v60, 
                    Text = v29:getText("General", "MyAssets")
                }, {
                    HoverArea = v4.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                }), 
                SearchBar = v4.createElement(v7, {
                    LayoutOrder = v71:getNextOrder(), 
                    OnDeleteCreatorPill = v69, 
                    OnSearchUpdate = v66, 
                    OnSelectCreator = v64, 
                    CreatorResults = v33.results, 
                    SearchTerm = v35, 
                    SelectedUsers = v45, 
                    SelectedGroups = v39
                })
            })
        }), 
        SortBy = v4.createElement(v8, {
            Header = v29:getText("General", "SearchOptionSort"), 
            HideLowerSeparator = true, 
            LayoutOrder = v71:getNextOrder()
        }, {
            RadioButtons = v4.createElement(l_RadioButtonList_0, {
                Buttons = v47, 
                CurrentSelectedKey = v41, 
                OnClick = v42, 
                SelectedKey = v31.uiSortIntent
            })
        })
    });
end;
