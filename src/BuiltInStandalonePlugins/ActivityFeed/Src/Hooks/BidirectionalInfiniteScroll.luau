local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Dash);
local v3 = require(l_Parent_0.Packages.Cryo);
return function(v4, v5, _, v7)
    local v8, v9 = v1.useState({
        eventList = {}
    });
    local v10 = v2.filter(v8.eventList, v5);
    local v14 = v1.useCallback(function(v11, v12)
        v9(function(v13)
            return {
                eventList = v3.List.join(v13.eventList, v11), 
                nextCursor = v12, 
                startDate = v13.startDate
            };
        end);
    end, {
        v9
    });
    local v16 = v1.useCallback(function(v15)
        if v15 ~= v8.startDate then
            v9({
                eventList = {}, 
                nextCursor = nil, 
                startDate = v15
            });
        end;
    end, {
        v4, 
        v14, 
        v8, 
        v9
    });
    local v17 = v1.useCallback(function()
        if v8.nextCursor ~= nil then
            v4(v14, v8.nextCursor, v8.startDate);
        end;
    end, {
        v4, 
        v14, 
        v8
    });
    v1.useEffect(function()
        v4(v14, nil, v8.startDate);
    end, {
        v4, 
        v14, 
        v8.startDate
    });
    v1.useEffect(function()
        if v7 and v7 > 0 then
            local v18 = task.spawn(function()
                while true do
                    task.wait(v7 / 1000);
                    if v8.nextCursor == nil and v8.startDate == nil then
                        v4(v14, nil, nil);
                    end;
                end;
            end);
            return function()
                coroutine.close(v18);
            end;
        else
            return function()
            end;
        end;
    end, {
        v4, 
        v14, 
        v8.startDate, 
        v7
    });
    return {
        eventList = v10, 
        jumpToDate = v16, 
        addNewEvent = function()
        end, 
        onEndReached = v17
    };
end;
