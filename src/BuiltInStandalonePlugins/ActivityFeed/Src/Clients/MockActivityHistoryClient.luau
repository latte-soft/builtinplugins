local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Src.Clients.ActivityHistoryClient);
local v3 = require(l_Parent_0.Src.Util.MockActivityHistoryEvents);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Promise_0 = v4.Util.Promise;
local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
local v7 = #v3;
local function _(v8)
    if string.sub(v8, 1, 1) == "p" then
        return tonumber((string.sub(v8, 2))) or -100;
    else
        return tonumber(v8) or 0;
    end;
end;
local function v16(v10)
    local v11 = if string.sub(v10, 1, 1) == "p" then tonumber((string.sub(v10, 2))) or -100 else tonumber(v10) or 0;
    local v12 = {};
    for v13 = 1, 100 do
        local v14 = v11 + v13;
        local v15 = v4.Util.deepCopy(v3[v14 % v7 + 1]);
        v15.createdUnixTimeMs = l_UnixTimestampMillis_0 - 10800000 * v14;
        table.insert(v12, v15);
    end;
    return v12, tostring(v11 + 100), "p" .. tostring(v11);
end;
local function _(v17)
    return v16((tostring((math.floor((l_UnixTimestampMillis_0 - v17) / 10800000)))));
end;
return {
    activityFeedRTEEffect = function(_)
        return function()
        end;
    end, 
    fetchActivityHistory = function(_, _, v22, v23, v24)
        local v25 = nil;
        local v26 = nil;
        local v27 = nil;
        if not v22 then
            if not v23 then
                local v28, v29, v30 = v16("0");
                v25 = v28;
                v26 = v29;
                v27 = v30;
            else
                local v31, v32, v33 = v16((tostring((math.floor((l_UnixTimestampMillis_0 - v23) / 10800000)))));
                local l_v31_0 = v31;
                local l_v32_0 = v32;
                local l_v33_0 = v33;
                v25 = l_v31_0;
                v26 = l_v32_0;
                v27 = l_v33_0;
            end;
        else
            local v37, v38, v39 = v16(v22);
            v25 = v37;
            v26 = v38;
            v27 = v39;
        end;
        local v40 = {
            responseCode = 200, 
            responseBody = {
                events = v25, 
                nextCursor = v26, 
                previousCursor = v27, 
                hasMore = nil
            }
        };
        spawn(function()
            v24(v40);
        end);
    end, 
    fetchUsernames = function(v41, v42)
        local v43 = {};
        local v44 = 0;
        for _, v46 in pairs(v41) do
            v44 = v44 + 1;
            table.insert(v43, (l_Promise_0.new(function(v47, _)
                v47(v46, tostring(v46) .. "mockusername");
            end)));
        end;
        local v49 = {};
        local v50 = 0;
        local function _()
            if v50 == v44 then
                v42(v49);
            end;
        end;
        for _, v53 in pairs(v43) do
            v53:andThen(function(v54, v55)
                v50 = v50 + 1;
                v49[v54] = v55;
                if v50 == v44 then
                    v42(v49);
                end;
            end):catch(function(_)
                v50 = v50 + 1;
                if v50 == v44 then
                    v42(v49);
                end;
            end);
        end;
    end
};
