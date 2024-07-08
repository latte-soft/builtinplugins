local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.VirtualizedList);
local v5 = require(l_Parent_0.Src.Resources.StyleTips);
local _ = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local v7 = require(l_Parent_0.Src.Components.ActivityHistoryBubble);
local v8 = require(l_Parent_0.Src.Util.ActivityHistoryEventTranslated);
local v9 = require(l_Parent_0.Src.Hooks.UsernameCache);
local l_VirtualizedList_0 = v4.VirtualizedList;
local l_UI_0 = v2.UI;
local l_Localization_0 = v2.ContextServices.Localization;
local l_keys_0 = v3.Dictionary.keys;
local l_values_0 = v3.Dictionary.values;
local _ = l_UI_0.Button;
local l_joinTags_0 = v2.Styling.joinTags;
local function v19(v17, v18)
    if not v17 or not v17[v18] then
        return nil;
    else
        if v17[v18].key == nil then
            v17[v18].key = v17[v18].id;
        end;
        return v17[v18];
    end;
end;
local function v21(v20)
    if v20 == nil then
        return 0;
    else
        return #v20;
    end;
end;
local function v24(_, v23)
    return {
        length = v5.bubbleHeight, 
        offset = v5.bubbleHeight * v23, 
        index = v23
    };
end;
local function v26(v25)
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Border", "X-Fill", "CX-Invisible", "Component-BubbleFrame")
    }, {
        BubbleContainer = v1.createElement(v7, {
            Bubble = v25.item
        })
    });
end;
local function v42()
    local v27 = v9();
    local v28, _ = v1.useState({});
    local v30 = l_Localization_0:use();
    return {
        updated = v27.cache, 
        getTranslations = function(v31)
            local v32 = {};
            local v33 = {};
            for _, v35 in pairs(v31) do
                local v36 = false;
                do
                    local l_v36_0 = v36;
                    local function v40(v38)
                        if v38 ~= nil then
                            local v39 = v27.cache[v38];
                            if not v39 then
                                l_v36_0 = true;
                                v33[v38] = true;
                            else
                                return v39;
                            end;
                        end;
                        return v30:getText("Bubble", "Unknown");
                    end;
                    local v41 = v28[v35.id];
                    if not v41 then
                        v41 = v8.translateEvent(v40, v30, v35);
                        if not l_v36_0 then
                            v28[v35.id] = v41;
                        end;
                    end;
                    table.insert(v32, v41);
                end;
            end;
            v27.fetchUsernames(l_keys_0(v33));
            return v32;
        end
    };
end;
local v43 = {
    minimumViewTime = 2000, 
    viewAreaCoveragePercentThreshold = 80, 
    itemVisiblePercentThreshold = nil, 
    waitForInteraction = false
};
return function(v44)
    local v45 = v42();
    local v46 = v1.useMemo(function()
        return l_values_0((v45.getTranslations(v44.Events)));
    end, {
        v44.Events, 
        v45.updated
    });
    local v51 = v1.useCallback(function(v47)
        local v48 = {};
        for _, v50 in pairs(v47.viewableItems) do
            v48[v50.key] = true;
        end;
        v44.OnViewableItemsChanged(v48);
    end, {
        v44.OnViewableItemsChanged
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Fill", "CX-Invisible", "Component-ActivityHistoryBubbleList")
    }, {
        VirtualizedList = v1.createElement(l_VirtualizedList_0, {
            ref = v1.useRef(nil), 
            data = v46, 
            getItem = v19, 
            getItemCount = v21, 
            getItemLayout = v24, 
            renderItem = v26, 
            windowSize = 3, 
            viewabilityConfigCallbackPairs = {
                (v1.useMemo(function()
                    return {
                        viewabilityConfig = v43, 
                        onViewableItemsChanged = v51
                    };
                end, {
                    v51
                }))
            }, 
            showsVerticalScrollIndicator = false, 
            showsHorizontalScrollIndicator = false, 
            onEndReached = v44.OnEndReached, 
            keyExtractor = function(v52)
                return v52.id;
            end
        })
    });
end;
