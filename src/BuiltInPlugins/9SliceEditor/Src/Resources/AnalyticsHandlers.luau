local l_game_FastInt_0 = game:GetFastInt("9SliceEditorAnalyticsReportingHundrethsPercent");
return function(v1)
    local v2 = Random.new();
    local function _()
        return v2:NextNumber() < l_game_FastInt_0 / 10000;
    end;
    local function _(v4)
        if v2:NextNumber() < l_game_FastInt_0 / 10000 then
            v1:ReportCounter(v4, 1);
        end;
    end;
    local function _(v6, v7)
        if v2:NextNumber() < l_game_FastInt_0 / 10000 then
            v1:ReportStats(v6, v7);
        end;
    end;
    return {
        sliceEditorOpened = function()
            if v2:NextNumber() < l_game_FastInt_0 / 10000 then
                v1:ReportCounter("Studio9SliceEditorOpened", 1);
            end;
        end, 
        sliceEditorImageLoadedIntoEditor = function()
            if v2:NextNumber() < l_game_FastInt_0 / 10000 then
                v1:ReportCounter("Studio9SliceEditorImageLoadedIntoEditor", 1);
            end;
        end, 
        sliceEditorOpenTime = function(_, v10)
            if v2:NextNumber() < l_game_FastInt_0 / 10000 then
                v1:ReportStats("Studio9SliceEditorOpenTime", v10);
            end;
        end
    };
end;
