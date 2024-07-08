local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local v4 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.Clipboard.CopyInstanceToClipboard);
local v7 = require(l_Actions_0.Window.SetItemsExpanded);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v9 = require(l_Thunks_0.Change.CreateStyleRule);
local v10 = require(l_Thunks_0.Change.DeleteInstance);
local v11 = require(l_Thunks_0.Change.DuplicateInstance);
local v12 = require(l_Thunks_0.Change.PasteInstanceInto);
local v13 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v16, v17, v18)
    return function(v19, v20)
        if v16 and v16:IsA("StyleRule") then
            local v21 = v19:getState();
            local l_Localization_0 = v20.Localization;
            local v30 = {
                Id = "StyleRule", 
                Children = {
                    v2.getNewSelectorAction(v16, function(v23)
                        v19:dispatch(v9(v16, v23.Data.Selector, v18));
                        v19:dispatch(v7({
                            [v4.createItemId(v16)] = true
                        }));
                    end, l_Localization_0), 
                    v2.getRenameAction(function(_)
                        v17();
                    end, l_Localization_0), 
                    {
                        Id = "ShowInExplorer", 
                        Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                        Icon = v2.getClassIcon("ReplicatedStorage"), 
                        OnItemClicked = function(_)
                            v19:dispatch(v13(v16));
                        end
                    }, 
                    {
                        Id = "Copy", 
                        Text = l_Localization_0:getText("ContextMenu", "Copy"), 
                        Icon = v3.copy(), 
                        OnItemClicked = function(_)
                            v19:dispatch(v6(v16));
                        end
                    }, 
                    {
                        Id = "PasteInto", 
                        Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                        Icon = v3.paste(), 
                        Enabled = v21.Clipboard.Instance ~= nil, 
                        OnItemClicked = function(_)
                            v19:dispatch(v12(v16));
                        end
                    }, 
                    {
                        Id = "Duplicate", 
                        Text = l_Localization_0:getText("ContextMenu", "Duplicate"), 
                        Icon = v3.duplicate(), 
                        OnItemClicked = function(_)
                            assert(typeof(v16.Parent) == "Instance", "StyleRule expected to have a valid parent");
                            v19:dispatch(v11(v16, v16.Parent));
                        end
                    }, 
                    {
                        Id = "Delete", 
                        Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                        Icon = v3.delete(), 
                        OnItemClicked = function(_)
                            v19:dispatch(v10(v16));
                        end
                    }
                }
            };
            v2.trackClicks(v30, v20.Telemetry);
            v2.showContextMenu(v20.Plugin, v30);
            return ;
        else
            warn("Selected invalid StyleRule: ", v16);
            return ;
        end;
    end;
end;
