local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local v4 = require(l_Parent_0.Src.Thunks.Change.CreateStyleRule);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v7, v8)
    return function(v9, v10)
        local v12 = {
            Id = "DesignCategory", 
            Children = {
                {
                    Id = "New", 
                    Text = v10.Localization:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    OnItemClicked = function(_)
                        v9:dispatch(v4(v7, v8, true));
                    end
                }
            }
        };
        v2.trackClicks(v12, v10.Telemetry);
        v2.showContextMenu(v10.Plugin, v12);
    end;
end;
