local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local v3 = require(l_Parent_0.Src.Util.DebugFlags);
local l_join_0 = v2.join;
game:DefineFastInt("MaterialPickerAnalyticsThrottleHundrethsPercent", 0);
return function(v5)
    local function _(v6, v7)
        local v8 = l_join_0({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId
        }, v7 or {});
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("MaterialPicker", v6, l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "MaterialPicker", v6, v8);
    end;
    local function v13(v10, v11)
        local l_game_FastInt_0 = game:GetFastInt("MaterialPickerAnalyticsThrottleHundrethsPercent");
        v11 = v11 or {};
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s throttlingPercent=%s"):format("MaterialPicker", tostring(v10), l_HttpService_0:JSONEncode(v11), (tostring(l_game_FastInt_0))));
        end;
        v5:ReportInfluxSeries(v10, v11, l_game_FastInt_0);
    end;
    return {
        MaterialApplied = function(_, v15, v16, v17, v18, v19)
            args = l_join_0({
                applicationMethod = v15, 
                instancesSelectedCount = v16, 
                materialIdentifier = v17, 
                materialType = v18
            }, v19 or {});
            v13("MaterialPicker_MaterialApplied", args);
        end, 
        MaterialGeneratorOpened = function()
            v13("MaterialPicker_MaterialGeneratorOpened", {});
        end, 
        MaterialManagerOpened = function()
            v13("MaterialPicker_MaterialManagerOpened", {});
        end, 
        PopupOpened = function()
            v13("MaterialPicker_PopupOpened", {});
        end, 
        FilterChipToggled = function(_, v21, v22)
            v13("MaterialPicker_FilterChipToggled", {
                filterChipName = v21, 
                toggleType = v22
            });
        end, 
        ViewTypeToggled = function(_, v24)
            v13("MaterialPicker_ViewTypeToggled", {
                viewType = v24
            });
        end
    };
end;
