local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_Localization_0 = v2.ContextServices.Localization;
local v6 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
local _ = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local v9 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local v10 = require(l_Parent_0.Src.Components.FilterMenu);
local v11 = require(l_Parent_0.Src.Components.ActivityHistoryBubbleList);
local v12 = require(l_Parent_0.Src.Util.ActivityHistoryEventTranslated);
local v13 = require(l_Parent_0.Src.Hooks.BidirectionalInfiniteScroll);
local v14 = require(l_Parent_0.Src.Hooks.UsernameCache);
local l_game_FastInt_0 = game:GetFastInt("ActivityFeedRefreshMs");
local l_game_FastInt_1 = game:GetFastInt("ActivityFeedEndpointFetchCount");
local function _(v17)
    return DateTime.now().UnixTimestampMillis - 86400000 * (tonumber(v17) or 0);
end;
local function v25(v19, v20)
    if not (v19.EndDate == v20.EndDate and v19.ShowEveryoneElse == v20.ShowEveryoneElse) or #v19.ExcludedEventCategories ~= #v20.ExcludedEventCategories then
        return false;
    else
        for _, v22 in pairs(v19.ExcludedEventCategories) do
            if v3.List.find(v20.ExcludedEventCategories, v22) == nil then
                return false;
            end;
        end;
        for v23, v24 in pairs(v19.ShowCollaborators) do
            if v20.ShowCollaborators[v23] ~= v24 then
                return false;
            end;
        end;
        return true;
    end;
end;
local _ = function(v26)
    return function(v27)
        for _, v29 in pairs(v26.ExcludedEventCategories) do
            if v12.eventTypeToCategory(v27.eventType) == v29 then
                return false;
            end;
        end;
        local v30 = v26.ShowCollaborators[v27.userId];
        if v30 ~= nil then
            return v30;
        else
            return v26.ShowEveryoneElse;
        end;
    end;
end;
local v32 = {
    AllEvents = "All Events", 
    FilterMenu = "Filter Menu"
};
local v33 = {
    EndDate = "", 
    ExcludedEventCategories = {}, 
    ShowCollaborators = {}, 
    ShowEveryoneElse = true
};
return function(v34)
    local v35 = v1.useContext(v9);
    local v36 = l_Localization_0:use();
    local v37 = l_Analytics_0:use();
    local v38, v39 = v1.useState(v32.AllEvents);
    local v40, v41 = v1.useState({});
    local v42 = v35.useCollaborators();
    local v43, v44 = v35.usePlaceAndUniverseId(v34.plugin);
    local v45 = v1.useRef({});
    v35.useConnectToDataModelSessionEffect(v1.useMemo(function()
        return function()
            v45.current = {};
        end;
    end, {}), (v1.useMemo(function()
        return function()
            local v46 = 0;
            local v47 = v45.current or {};
            for _, _ in pairs(v47) do
                v46 = v46 + 1;
            end;
            v37:report("bubblesSeenOnSessionEnd", v46, v43, v44);
        end;
    end, {
        v45
    })));
    local v51 = v1.useCallback(function(v50)
        v45.current = v3.Dictionary.join(v45.current, v50);
    end, {
        v45
    });
    local v52 = v14();
    v1.useEffect(function()
        local v53 = {};
        local v54 = 0;
        for _, v56 in pairs(v42) do
            v54 = v54 + 1;
            table.insert(v53, v56);
            if not (v54 < 10) then
                break;
            end;
        end;
        for v57, _ in pairs(v40) do
            v54 = v54 + 1;
            table.insert(v53, v57);
            if not (v54 < 10) then
                break;
            end;
        end;
        v52.fetchUsernames(v53);
    end, {
        v40, 
        v42
    });
    local v59 = nil;
    v59 = v1.useCallback(function(v60, v61, v62)
        v35.activityHistoryClient.fetchActivityHistory(v43, v44, v61, v62, function(v63)
            local v64 = {};
            for _, v66 in pairs(v63.responseBody.events) do
                v64[v66.userId] = true;
            end;
            v41(v3.Dictionary.join(v40, v64));
            local l_events_0 = v63.responseBody.events;
            local v68 = not not v63.responseBody.hasMore and v63.responseBody.nextCursor or nil;
            if not (v63.responseBody.hasMore and v63.responseBody.previousCursor) then
                local _ = nil;
            end;
            v60(l_events_0, v68);
        end);
    end, {
        v35.activityHistoryClient, 
        v43, 
        v44
    });
    local v70, v71 = v1.useState(v33);
    local v77, v78 = v1.useState(function()
        local l_v33_0 = v33;
        return function(v73)
            for _, v75 in pairs(l_v33_0.ExcludedEventCategories) do
                if v12.eventTypeToCategory(v73.eventType) == v75 then
                    return false;
                end;
            end;
            local v76 = l_v33_0.ShowCollaborators[v73.userId];
            if v76 ~= nil then
                return v76;
            else
                return l_v33_0.ShowEveryoneElse;
            end;
        end;
    end);
    v1.useEffect(function()
        v78(function()
            local l_v70_0 = v70;
            return function(v80)
                for _, v82 in pairs(l_v70_0.ExcludedEventCategories) do
                    if v12.eventTypeToCategory(v80.eventType) == v82 then
                        return false;
                    end;
                end;
                local v83 = l_v70_0.ShowCollaborators[v80.userId];
                if v83 ~= nil then
                    return v83;
                else
                    return l_v70_0.ShowEveryoneElse;
                end;
            end;
        end);
    end, {
        v70, 
        v78
    });
    local v84 = v13(v59, v77, l_game_FastInt_1, l_game_FastInt_0);
    local v86 = v1.useCallback(function(_)
    end, {});
    v1.useEffect(function()
        return v35.activityHistoryClient.activityFeedRTEEffect(v86);
    end, {});
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Column", "Component-ActivityHistoryMain")
    }, {
        EventList = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("X-Column", "CX-Invisible"), 
            LayoutOrder = v6:getNextOrder(), 
            Visible = v38 == v32.AllEvents
        }, {
            HeaderContainer = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("X-Border", "X-Corner", "CX-Invisible")
            }, {
                Header = v1.createElement("Frame", {
                    [v1.Tag] = l_joinTags_0("X-Fill", "CX-Invisible")
                }, {
                    ToggleFilterMenuButton = v1.createElement("TextButton", {
                        [v1.Tag] = l_joinTags_0("X-Fill"), 
                        LayoutOrder = v6:getNextOrder(), 
                        Text = v36:getText("ActivityHistoryMain", "AllEvents"), 
                        [v1.Event.Activated] = function()
                            v39(v32.FilterMenu);
                        end
                    }), 
                    FilterMenuToggleIconContainer = v1.createElement("Frame", {
                        [v1.Tag] = l_joinTags_0("CX-Invisible")
                    }, {
                        FilterMenuToggleIcon = v1.createElement("ImageLabel", {
                            LayoutOrder = v6:getNextOrder()
                        })
                    })
                })
            }), 
            ActivityHistoryBubbleListContainer = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                LayoutOrder = v6:getNextOrder()
            }, {
                ActivityHistoryBubbleList = v1.createElement(v11, {
                    [v1.Tag] = ".ActivityHistoryBubbleList", 
                    Events = v84.eventList, 
                    IndexOffset = math.huge, 
                    OnEndReached = v84.onEndReached, 
                    OnViewableItemsChanged = v51
                })
            })
        }), 
        FilterMenu = v1.createElement("Frame", {
            LayoutOrder = v6:getNextOrder(), 
            Visible = v38 ~= v32.AllEvents
        }, {
            FilterMenu = v1.createElement(v10, {
                collaborators = v52.cache, 
                OnApply = function(v87)
                    v71(function(v88)
                        if v25(v88, v87) then
                            return v88;
                        else
                            if v88.EndDate ~= v87.EndDate then
                                v84.jumpToDate(DateTime.now().UnixTimestampMillis - 86400000 * (tonumber(v87.EndDate) or 0));
                            end;
                            return v87;
                        end;
                    end);
                    v39(v32.AllEvents);
                end, 
                OnClear = function()
                    v71(function(v89)
                        if not v25(v89, v33) then
                            return v89;
                        else
                            v84.jumpToDate(nil);
                            return v33;
                        end;
                    end);
                    v39(v32.AllEvents);
                end
            })
        })
    });
end;
