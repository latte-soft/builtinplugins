local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateStyleRule);
local v6 = require(l_Thunks_0.Change.DeleteInstance);
local v7 = require(l_Thunks_0.Change.PasteInstanceInto);
local v8 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v11, v12)
    return function(v13, v14)
        local v15 = v13:getState();
        local l_Localization_0 = v14.Localization;
        local v22 = {
            Id = "DesignSheet", 
            Children = {
                v2.getNewSelectorAction(v11, function(v17)
                    v13:dispatch(v5(v11, v17.Data.Selector, true));
                end, l_Localization_0), 
                v2.getRenameAction(function(_)
                    v12();
                end, l_Localization_0), 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v3.delete(), 
                    OnItemClicked = function(_)
                        v13:dispatch(v6(v11));
                    end
                }, 
                {
                    Id = "PasteInto", 
                    Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                    Icon = v3.paste(), 
                    Enabled = v15.Clipboard.Instance ~= nil, 
                    OnItemClicked = function(_)
                        v13:dispatch(v7(v11));
                    end
                }, 
                {
                    Id = "ShowInExplorer", 
                    Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                    Icon = v2.getClassIcon("ReplicatedStorage"), 
                    OnItemClicked = function(_)
                        v13:dispatch(v8(v11));
                    end
                }
            }
        };
        v2.trackClicks(v22, v14.Telemetry);
        v2.showContextMenu(v14.Plugin, v22);
    end;
end;
