local v0 = require(script.Parent.Parent.Parent.Packages.Cryo);
return function(v1)
    local function v4(v2, v3)
        v1:ReportInfluxSeries("TagEditorUsage", v0.Dictionary.join({
            placeId = game.PlaceId, 
            calledFrom = v2
        }, v3 or {}), game:GetFastInt("ReportTagEditorEventsThrottleHundrethsPercent2"));
    end;
    local function _(v5)
        v1:ReportCounter(v5);
    end;
    return {
        opened = function()
            v4("Opened");
        end, 
        worldVisualization = function()
            v4("WorldVisualization");
        end, 
        colorChanged = function()
            v4("ColorChanged");
        end, 
        iconChanged = function()
            v4("IconChanged");
        end, 
        tagCreated = function()
            v4("TagCreated");
        end, 
        objectTagged = function()
            v4("ObjectTagged");
        end, 
        toggleWidget = function()
            v1:ReportCounter("TagEditorToggleWidget");
        end, 
        openWidget = function()
            v1:ReportCounter("TagEditorOpenWidget");
        end, 
        closeWidget = function()
            v1:ReportCounter("TagEditorCloseWidget");
        end
    };
end;
