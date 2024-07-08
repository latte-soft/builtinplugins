local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Packages.Rodux);
local l_showContextMenu_0 = require(l_Parent_0.Packages.Framework).UI.showContextMenu;
local v5 = require(l_Parent_0.Packages.Dash);
local l_map_0 = v5.map;
local l_filter_0 = v5.filter;
local l_join_0 = v5.join;
local v9 = require(l_Parent_0.Src.Resources.Telemetry.ContextMenuItemClickedEvent);
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local _ = require(l_Parent_0.Src.Types);
local v12 = require(l_Parent_0.Src.Resources.ModernIcons);
local v16 = {
    Classes = {
        "CanvasGroup", 
        "ImageButton", 
        "ImageLabel", 
        "ScrollingFrame", 
        "Frame", 
        "TextBox", 
        "TextButton", 
        "TextLabel"
    }, 
    PseudoInstances = {
        "UIAspectRatioConstraint", 
        "UICorner", 
        "UIGradient", 
        "UIGridLayout", 
        "UIListLayout", 
        "UIPadding", 
        "UIPageLayout", 
        "UIScale", 
        "UISizeConstraint", 
        "UIStroke", 
        "UITableLayout", 
        "UITextSizeConstraint"
    }, 
    GuiStates = {
        "hover", 
        "idle", 
        "pressed"
    }, 
    AttributeTypes = {
        "string", 
        "boolean", 
        "number", 
        "UDim", 
        "UDim2", 
        "BrickColor", 
        "Color3", 
        "Vector2", 
        "Vector3", 
        "CFrame", 
        "ColorSequence", 
        "NumberSequence", 
        "NumberRange", 
        "Rect", 
        "Font"
    }, 
    getClassIcon = function(v13)
        local l_status_0, l_result_0 = pcall(function()
            return l_StudioService_0:GetClassIcon(v13);
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0.Image;
        end;
    end, 
    StyleSheetCategories = {
        {
            Name = "Tokens", 
            Icon = v12.Standard.TokenSheet()
        }, 
        {
            Name = "Themes", 
            Icon = v12.Standard.ThemeSheet()
        }, 
        {
            Name = "Designs", 
            Icon = v12.Standard.DesignSheet()
        }
    }, 
    MoreAction = {
        {
            Id = "Menu", 
            Icon = {
                Image = v12.more()
            }, 
            [v2.Tag] = "Contrast IconOnly"
        }
    }, 
    FullSpanMoreAction = {
        {
            Id = "Menu", 
            Icon = {
                Image = v12.more()
            }, 
            [v2.Tag] = "IconOnly SecondaryHoverBackground"
        }
    }
};
v16.getStyleSheetCategoryActions = function(v17, v18)
    return l_map_0(v16.StyleSheetCategories, function(v19)
        return {
            Id = v19.Name, 
            Text = v18:getText("Category", v19.Name), 
            Icon = v19.Icon, 
            OnItemClicked = v17, 
            Data = {
                Category = v19.Name
            }
        };
    end);
end;
v16.getAttributeTypeActions = function(v20, v21)
    return l_map_0(v20, function(v22)
        return {
            Id = v22, 
            Text = v22, 
            OnItemClicked = v21, 
            Data = {
                Type = v22
            }
        };
    end);
end;
v16.getClassTypeActions = function(v23, _)
    return l_map_0(v16.Classes, function(v25)
        return {
            Id = v25, 
            Text = v25, 
            Icon = v16.getClassIcon(v25), 
            OnItemClicked = v23, 
            Data = {
                Selector = v25
            }
        };
    end);
end;
v16.getNewSelectorAction = function(v26, v27, v28)
    local function v29(v30, v31)
        return l_map_0(v31, function(v32)
            if not v32.Children then
                return l_join_0(v32, {
                    Data = {
                        Selector = v30 .. v32.Data.Selector
                    }
                });
            else
                return l_join_0(v32, {
                    Children = v29(v30, v32.Children)
                });
            end;
        end);
    end;
    local v33 = v26:IsA("StyleRule");
    local v35 = l_map_0(v16.PseudoInstances, function(v34)
        return {
            Id = v34, 
            Text = v34, 
            Icon = v16.getClassIcon(v34), 
            OnItemClicked = v27, 
            Data = {
                Selector = "::" .. v34
            }
        };
    end);
    local v37 = l_map_0(v16.GuiStates, function(v36)
        return {
            Id = v36, 
            Text = v36, 
            Icon = v12.Selectors.GuiState(), 
            OnItemClicked = v27, 
            Data = {
                Selector = ":" .. v36
            }
        };
    end);
    local v38 = {
        Id = "Name", 
        Icon = v12.Selectors.Name(), 
        Text = v28:getText("ContextMenu", "New.Name"), 
        OnItemClicked = v27, 
        Data = {
            Selector = "#Name"
        }
    };
    local v39 = {
        Id = "Tag", 
        Text = v28:getText("ContextMenu", "New.Tag"), 
        Icon = v12.Selectors.Tag(), 
        OnItemClicked = v27, 
        Data = {
            Selector = ".Tag"
        }
    };
    local v40 = {
        Id = "Class", 
        Icon = v12.Selectors.Class(), 
        Text = v28:getText("ContextMenu", "New.Class"), 
        OnItemClicked = v5.noop, 
        Children = v16.getClassTypeActions(v27, v28)
    };
    local v41 = {
        Id = "Empty", 
        Text = v28:getText("ContextMenu", "New.Empty"), 
        OnItemClicked = v27, 
        Data = {
            Selector = ""
        }
    };
    local v42 = {
        Id = "New", 
        Text = v28:getText("ContextMenu", "New"), 
        Icon = v12.new()
    };
    local v43 = {};
    local l_v38_0 = v38;
    local l_v39_0 = v39;
    local l_v40_0 = v40;
    local v47 = {
        Id = "PseudoInstance", 
        Icon = v12.Selectors.PseudoInstance(), 
        Text = v28:getText("ContextMenu", "New.PseudoInstance"), 
        Children = v35
    };
    local v48 = {
        Id = "GuiState", 
        Icon = v12.Selectors.GuiState(), 
        Text = v28:getText("ContextMenu", "New.GuiState"), 
        Children = v37
    };
    local v49 = {
        Id = "Enumerator", 
        Icon = v12.Selectors.Enumerator(), 
        Enabled = v33, 
        Text = v28:getText("ContextMenu", "New.Enumerator")
    };
    local v50;
    if not v33 then
        v50 = nil;
    else
        local v51 = {
            v38, 
            v39, 
            v40, 
            v41
        };
        local l_l_map_0_0 = l_map_0;
        local l_v51_0 = v51;
        local v54 = ",";
        local l_v54_0 = v54 --[[ copy: 24 -> 27 ]];
        v50 = l_l_map_0_0(l_v51_0, function(v56)
            if not v56.Children then
                return l_join_0(v56, {
                    Data = {
                        Selector = l_v54_0 .. v56.Data.Selector
                    }
                });
            else
                return l_join_0(v56, {
                    Children = v29(l_v54_0, v56.Children)
                });
            end;
        end);
    end;
    v49.Children = v50;
    v50 = {
        Id = "Child", 
        Icon = v12.Selectors.Child(), 
        Text = v28:getText("ContextMenu", "New.Child")
    };
    local v57 = {
        v38, 
        v39, 
        v40, 
        v41
    };
    local l_l_map_0_1 = l_map_0;
    local l_v57_0 = v57;
    local v60 = ">";
    v50.Children = l_l_map_0_1(l_v57_0, function(v61)
        if not v61.Children then
            return l_join_0(v61, {
                Data = {
                    Selector = v60 .. v61.Data.Selector
                }
            });
        else
            return l_join_0(v61, {
                Children = v29(v60, v61.Children)
            });
        end;
    end);
    local v62 = {
        Id = "Descendant", 
        Icon = v12.Selectors.Descendant(), 
        Text = v28:getText("ContextMenu", "New.Descendant")
    };
    l_l_map_0_1 = {
        v38, 
        v39, 
        v40, 
        v41
    };
    l_v57_0 = l_map_0;
    local l_l_l_map_0_1_0 = l_l_map_0_1;
    local v64 = ">>";
    v62.Children = l_v57_0(l_l_l_map_0_1_0, function(v65)
        if not v65.Children then
            return l_join_0(v65, {
                Data = {
                    Selector = v64 .. v65.Data.Selector
                }
            });
        else
            return l_join_0(v65, {
                Children = v29(v64, v65.Children)
            });
        end;
    end);
    v57 = v41;
    setlist { ['R012[1 to 9]'] = 'R013 to R021' };
    v42.Children = v43;
    return v42;
end;
v16.getRenameAction = function(v66, v67)
    return {
        Id = "Rename", 
        Text = v67:getText("ContextMenu", "Rename"), 
        Icon = v12.edit(), 
        OnItemClicked = v66
    };
end;
v16.buildMenu = function(v68)
    local v70 = l_join_0(v68, (l_map_0(v16.filterHiddenActions(v68.Children or {}), function(v69)
        v69.Id = v68.Id .. "/" .. v69.Id;
        return (v16.buildMenu(v69));
    end)));
    v70.Children = nil;
    return v70;
end;
v16.decorateClickHandlers = function(v71, v72)
    local l_OnItemClicked_0 = v71.OnItemClicked;
    if l_OnItemClicked_0 then
        v71.OnItemClicked = function(v74)
            v72(v74);
            l_OnItemClicked_0(v74);
        end;
    end;
    if v71.Children then
        for _, v76 in v71.Children, nil, nil do
            v16.decorateClickHandlers(v76, v72);
        end;
    end;
end;
v16.trackClicks = function(v77, v78)
    v16.decorateClickHandlers(v77, function(v79)
        v78:logTelemetryEvent(v9({
            path = v79.Id, 
            data = v79.Data
        }));
    end);
end;
v16.showContextMenu = function(v80, v81)
    l_showContextMenu_0(v80, (v16.buildMenu(v81)));
end;
v16.filterHiddenActions = function(v82)
    return l_filter_0(v82, function(v83)
        return v83.Hidden ~= true;
    end);
end;
return v16;
