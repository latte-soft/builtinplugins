local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.MenuHelpers);
local v4 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v6 = require(l_Thunks_0.Change.ClearStyleSheetCategory);
local v7 = require(l_Thunks_0.Change.CreateStyleRule);
local v8 = require(l_Thunks_0.Change.DeleteInstance);
local v9 = require(l_Thunks_0.Change.DuplicateInstance);
local v10 = require(l_Thunks_0.Change.PasteInstanceInto);
local v11 = require(l_Thunks_0.Change.SetStyleSheetCategory);
local v12 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v16, v17)
    return function(v18, v19)
        local v20 = v18:getState();
        local l_Localization_0 = v19.Localization;
        local v23 = v3.getNewSelectorAction(v16, function(v22)
            v18:dispatch(v7(v16, v22.Data.Selector, true));
        end, l_Localization_0);
        local v25 = v3.getRenameAction(function(_)
            v17();
        end, l_Localization_0);
        local v28 = v3.getStyleSheetCategoryActions(function(v26)
            local l_Category_0 = v26.Data.Category;
            if l_Category_0 then
                v18:dispatch(v11(v16, l_Category_0));
                return ;
            else
                return ;
            end;
        end, l_Localization_0);
        local v29 = v20.Clipboard.Instance ~= nil;
        local v30 = v16:GetAttribute("StyleCategory") or "";
        local v31 = v2.isTheme(v16);
        local v32 = v30 == "Tokens" or v31;
        local v38 = {
            Id = "StyleSheet", 
            Children = {
                l_join_0(v23, {
                    Hidden = v32
                }), 
                v25, 
                {
                    Id = "Duplicate", 
                    Text = l_Localization_0:getText("ContextMenu", "Duplicate"), 
                    Icon = v4.duplicate(), 
                    OnItemClicked = function(_)
                        v18:dispatch(v9(v16, v16.Parent));
                    end
                }, 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v4.delete(), 
                    OnItemClicked = function(_)
                        v18:dispatch(v8(v16));
                    end
                }, 
                {
                    Id = "PasteInto", 
                    Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                    Icon = v4.paste(), 
                    Hidden = v32, 
                    Enabled = v29, 
                    OnItemClicked = function(_)
                        v18:dispatch(v10(v16));
                    end
                }, 
                {
                    Id = "ShowInExplorer", 
                    Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                    Icon = v3.getClassIcon("ReplicatedStorage"), 
                    OnItemClicked = function(_)
                        v18:dispatch(v12(v16));
                    end
                }, 
                {
                    Id = "RemoveFromCategory", 
                    Text = l_Localization_0:getText("ContextMenu", not v31 and "RemoveFromTokens" or "RemoveFromThemes"), 
                    Icon = v4.remove(), 
                    Hidden = not v32, 
                    OnItemClicked = function(_)
                        v18:dispatch(v6(v16));
                    end, 
                    Data = {
                        Category = v30
                    }
                }, 
                {
                    Id = "SetCategory", 
                    Text = l_Localization_0:getText("ContextMenu", "SetCategory"), 
                    Icon = v4.set(), 
                    Hidden = v32, 
                    Children = v28
                }
            }
        };
        v3.trackClicks(v38, v19.Telemetry);
        v3.showContextMenu(v19.Plugin, v38);
    end;
end;
