local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local v4 = require(l_Parent_0.Src.Thunks.Change.CreateDesignSheet);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function()
    return function(v7, v8)
        local v10 = {
            Id = "DesignSheet_Nil", 
            Children = {
                {
                    Id = "New", 
                    Text = v8.Localization:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    OnItemClicked = function(_)
                        v7:dispatch(v4());
                    end
                }
            }
        };
        v2.trackClicks(v10, v8.Telemetry);
        v2.showContextMenu(v8.Plugin, v10);
    end;
end;
