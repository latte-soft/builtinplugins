local v0 = require(script.Parent.Parent.Parent.Core.Util.createSignal);
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({
        _signal = v0(), 
        _currentTooltipAssetId = 0, 
        _currentTooltipTypeId = 0, 
        _isDropdownShown = false, 
        _isMouseInSearchOptions = false, 
        _isSearchOptionsShown = false, 
        _isAssetPreviewing = false
    }, v1));
end;
v1.subscribe = function(v2, ...)
    return v2._signal:subscribe(...);
end;
v1.isShowingModal = function(v3)
    return v3._isDropdownShown;
end;
v1.isShowingSearchOptions = function(v4)
    return v4._isSearchOptionsShown;
end;
v1.isMouseInSearchOptions = function(v5)
    return v5._isMouseInSearchOptions;
end;
v1.isAssetPreviewing = function(v6)
    return v6._isAssetPreviewing;
end;
v1.onTooltipTriggered = function(v7, v8, v9)
    v7._currentTooltipAssetId = v8;
    v7._currentTooltipTypeId = v9;
    v7._signal:fire();
end;
v1.onDropdownToggled = function(v10, v11)
    v10._isDropdownShown = v11;
    v10._signal:fire();
end;
v1.onSearchOptionsToggled = function(v12, v13)
    v12._isSearchOptionsShown = v13;
    v12._signal:fire();
end;
v1.onSearchOptionsMouse = function(v14, v15)
    v14._isMouseInSearchOptions = v15;
    v14._signal:fire();
end;
v1.onAssetPreviewToggled = function(v16, v17)
    v16._isAssetPreviewing = v17;
    v16._signal:fire();
end;
v1.isCurrentTooltip = function(v18, v19, v20)
    local v21 = false;
    if v18._currentTooltipAssetId == v19 then
        v21 = v18._currentTooltipTypeId == v20;
    end;
    return v21;
end;
v1.canHoverAsset = function(v22)
    return (not v22._isDropdownShown and not v22._isAssetPreviewing) and not (v22._isSearchOptionsShown and v22._isMouseInSearchOptions);
end;
v1.canShowCurrentTooltip = function(v23, v24, v25)
    return ((not v23._isDropdownShown and v23:isCurrentTooltip(v24, v25)) and not v23._isAssetPreviewing) and not (v23._isSearchOptionsShown and v23._isMouseInSearchOptions);
end;
return v1;
