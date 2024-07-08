local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Src.Utility.DebugFlags);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local function v11(v5)
    local v6 = {};
    local v7 = {};
    for _, v9 in ipairs(v5) do
        local l_ClassName_0 = v9.ClassName;
        if not v6[l_ClassName_0] then
            v6[l_ClassName_0] = true;
            table.insert(v7, l_ClassName_0);
        end;
    end;
    return table.concat(v7, ",");
end;
return function(v12)
    local function v16(v13, v14)
        local v15 = l_join_0({
            studioSid = v12:GetSessionId(), 
            clientId = v12:GetClientId(), 
            placeId = game.PlaceId
        }, v14 or {});
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("AlignTool", tostring(v13), l_HttpService_0:JSONEncode(v15)));
        end;
        v12:SendEventDeferred("studio", "AlignTool", v13, v15);
    end;
    local function _(v17, v18)
        v18 = v18 or 1;
        if v3.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("AlignTool", tostring(v17), (tostring(v18))));
        end;
        v12:ReportCounter(v17, v18);
    end;
    return {
        alignToolOpen = function()
            v16("AlignToolOpen");
        end, 
        alignToolClose = function()
            v16("AlignToolClose");
        end, 
        alignToolImpression = function()
            local v20 = nil or 1;
            if v3.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("AlignTool", tostring("AlignToolImpression"), (tostring(v20))));
            end;
            v12:ReportCounter("AlignToolImpression", v20);
            v16("AlignToolImpression");
        end, 
        useAlignTool = function(_, v22, v23)
            v16("UseAlignTool", {
                mode = v23.Mode, 
                x = v23.Axes.X, 
                y = v23.Axes.Y, 
                z = v23.Axes.Z, 
                coordinateSpace = v23.CoordinateSpace, 
                relativeTo = v23.RelativeTo, 
                objectCount = #v22, 
                objectTypes = v11(v22)
            });
        end
    };
end;
