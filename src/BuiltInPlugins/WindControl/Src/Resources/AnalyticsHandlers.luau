local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
return function(v3)
    local function v7(v4, v5, v6)
        v3:SendEventDeferred("studio", v5 or "WindControl", v4, (v1.Dictionary.join({
            placeId = game.PlaceId
        }, v6 or {})));
    end;
    return {
        openedFromRibbon = function()
            v7("windsockOrigin", "ribbon");
        end, 
        openedFromProperties = function()
            v7("windsockOrigin", "properties");
        end, 
        usageReport = function(v8)
            local v9 = not v8 and "placeClosing" or "widgetDisabled";
            if v2:totalCount() > 0 then
                v7("windsockUsage", v9, {
                    textFieldCount = v2.textFieldCount, 
                    sliderCount = v2.sliderCount, 
                    greenCircleCount = v2.greenCircleCount
                });
                v2:reset();
            end;
        end
    };
end;
