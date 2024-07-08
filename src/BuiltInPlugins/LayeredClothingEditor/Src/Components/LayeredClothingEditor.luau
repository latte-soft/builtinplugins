local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_EditingItemContext_0 = v2.Contexts.EditingItemContext;
local l_ItemCharacteristics_0 = v2.Util.AccessoryAndBodyToolShared.ItemCharacteristics;
local v5 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v5.ContextServices.withContext;
local l_ScreenFlow_0 = v5.UI.ScreenFlow;
local v8 = require(l_Parent_0.Src.Components.Screens.AssetTypeScreen);
local v9 = require(l_Parent_0.Src.Components.Screens.EditorScreen);
local v10 = require(l_Parent_0.Src.Components.Screens.SelectItemScreen);
local _ = require(l_Parent_0.Src.Components.Screens.GenerateScreen);
local v12 = require(l_Parent_0.Src.Components.Preview.SelectedEditingItem);
local v13 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v14 = require(l_Parent_0.Src.Util.Constants);
local v15 = v1.PureComponent:extend("LayeredClothingEditor");
v15.init = function(v16)
    v13.StartTime = os.time();
    v16.screenInfo = {
        {
            Id = v14.SCREENS.Select, 
            Component = v10
        }, 
        {
            Id = v14.SCREENS.AssetType, 
            Component = v8
        }, 
        {
            Id = v14.SCREENS.Edit, 
            Component = v9
        }
    };
    v16.screens = {};
    for _, v18 in ipairs(v16.screenInfo) do
        table.insert(v16.screens, v18.Component);
    end;
    v16.screenToIndexMap = {};
    for v19, v20 in ipairs(v16.screens) do
        v16.screenToIndexMap[v20] = v19;
    end;
    v16.onScreenChanged = function(v21)
        v13.CurrentScreen = v16.screenInfo[v21].Id;
    end;
    v16.getNextIndex = function(v22)
        local v23 = nil;
        v23 = if v22 == v16.screenToIndexMap[v10] then if l_ItemCharacteristics_0.isAvatar((v16.props.EditingItemContext:getSourceItem())) then v16.screenToIndexMap[v9] else v16.screenToIndexMap[v8] else v22 + 1 % #v16.screens;
        return v23 == 0 and #v16.screens or v23;
    end;
    v16.getPreviousIndex = function(v24)
        local _ = nil;
        if v24 == v16.screenToIndexMap[v9] then
            if not l_ItemCharacteristics_0.isAvatar((v16.props.EditingItemContext:getSourceItem())) then
                return v16.screenToIndexMap[v8];
            else
                return v16.screenToIndexMap[v10];
            end;
        else
            return v24 - 1;
        end;
    end;
end;
v15.render = function(v26)
    return v1.createFragment({
        SelectedEditingItem = v1.createElement(v12), 
        ScreenFlow = v1.createElement(l_ScreenFlow_0, {
            Screens = v26.screens, 
            GetNextIndex = v26.getNextIndex, 
            GetPreviousIndex = v26.getPreviousIndex, 
            OnScreenChanged = v26.onScreenChanged
        })
    });
end;
v15.willUnmount = function(v27)
    v27.props.EditingItemContext:clear();
end;
return (l_withContext_0({
    EditingItemContext = l_EditingItemContext_0
})(v15));
