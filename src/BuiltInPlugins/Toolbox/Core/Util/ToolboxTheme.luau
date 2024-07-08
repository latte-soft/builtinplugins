local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v3 = require(l_Util_0.Colors);
local v4 = require(l_Util_0.createSignal);
local v5 = require(l_Util_0.wrapStrictTable);
local _ = require(l_Util_0.Images);
local _ = require(l_Util_0.Constants);
local v8 = require(l_Util_0.Test.TestHelpers);
local v9 = {};
v9.__index = v9;
v9.createDummyThemeManager = function()
    return v9.new({
        getTheme = {
            GetColor = function()
                return Color3.new(math.random(), math.random(), math.random());
            end
        }, 
        studioStyleGuideColor = v8.createMockStudioStyleGuideColor(), 
        studioStyleGuideModifier = v8.createMockStudioStyleGuideModifier()
    });
end;
v9.new = function(v10)
    local v11 = {
        _externalThemeGetter = v10.getTheme or nil, 
        _isDarkThemeGetter = v10.isDarkerTheme or false, 
        _externalThemeChangedSignal = v10.themeChanged or nil, 
        _studioStyleGuideColor = v10.studioStyleGuideColor or Enum.StudioStyleGuideColor, 
        _studioStyleGuideModifier = v10.studioStyleGuideModifier or Enum.StudioStyleGuideModifier, 
        _externalThemeChangedConnection = nil, 
        _values = {}, 
        _UILibraryTheme = {}, 
        _signal = v4()
    };
    v11.values = v5(v11._values, "theme");
    setmetatable(v11, v9);
    if v11._externalThemeChangedSignal then
        v11._externalThemeChangedConnection = v11._externalThemeChangedSignal:Connect(function()
            v11:_recalculateTheme();
        end);
    end;
    v11:_recalculateTheme();
    return v11;
end;
v9.subscribe = function(v12, ...)
    return v12._signal:subscribe(...);
end;
v9.destroy = function(v13)
    if v13._externalThemeChangedConnection then
        v13._externalThemeChangedConnection:Disconnect();
        v13._externalThemeChangedConnection = nil;
    end;
end;
v9._update = function(v14, v15)
    v14._values = v1.Dictionary.join(v14._values, v15);
    v14.values = v5(v14._values, "theme");
    v14._signal:fire(v14.values, v14._UILibraryTheme);
end;
v9._getExternalTheme = function(v16)
    local l__externalThemeGetter_0 = v16._externalThemeGetter;
    if type(l__externalThemeGetter_0) == "function" then
        return l__externalThemeGetter_0();
    else
        return l__externalThemeGetter_0;
    end;
end;
v9._isDarkerTheme = function(v18)
    local l__isDarkThemeGetter_0 = v18._isDarkThemeGetter;
    if type(l__isDarkThemeGetter_0) == "function" then
        return l__isDarkThemeGetter_0(v18:_getExternalTheme());
    elseif not l__isDarkThemeGetter_0 then
        return false;
    else
        return true;
    end;
end;
v9._recalculateTheme = function(v20)
    local v21 = v20:_getExternalTheme();
    local v22 = v20:_isDarkerTheme();
    local l__studioStyleGuideColor_0 = v20._studioStyleGuideColor;
    local l__studioStyleGuideModifier_0 = v20._studioStyleGuideModifier;
    local function v25(...)
        return v21:GetColor(...);
    end;
    v20:_update({
        isDarkerTheme = v22, 
        linkButton = {
            textColor = Color3.fromRGB(0, 162, 255)
        }, 
        toolbox = {
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground)
        }, 
        loading = {
            text = v25(l__studioStyleGuideColor_0.MainText), 
            backgroundBar = v25(l__studioStyleGuideColor_0.Midlight), 
            bar = v25(l__studioStyleGuideColor_0.CurrentMarker)
        }, 
        searchBar = {
            backgroundColor = v25(l__studioStyleGuideColor_0.Dropdown), 
            liveBackgroundColor = v25(l__studioStyleGuideColor_0.InputFieldBackground), 
            borderColor = v25(l__studioStyleGuideColor_0.Border), 
            borderHoveredColor = v25(l__studioStyleGuideColor_0.CurrentMarker), 
            borderSelectedColor = v3.BLUE_PRIMARY, 
            textColor = v25(l__studioStyleGuideColor_0.MainText), 
            placeholderTextColor = v25(l__studioStyleGuideColor_0.DimmedText), 
            divideLineColor = v25(l__studioStyleGuideColor_0.Border), 
            searchButton = {
                imageColor = Color3.fromRGB(184, 184, 184), 
                imageSelectedColor = Color3.fromRGB(0, 162, 255)
            }, 
            clearButton = {
                imageColor = Color3.fromRGB(184, 184, 184), 
                imageSelectedColor = Color3.fromRGB(0, 162, 255)
            }
        }, 
        asset = {
            icon = {
                borderColor = v25(l__studioStyleGuideColor_0.Item, l__studioStyleGuideModifier_0.Hover)
            }, 
            progressBarColor = v3.BLUE_PRIMARY
        }, 
        infoBanner = {
            backgroundColor = v25(l__studioStyleGuideColor_0.Titlebar), 
            textColor = v25(l__studioStyleGuideColor_0.SubText)
        }, 
        tooltip = {
            backgroundColor = v25(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v25(l__studioStyleGuideColor_0.Border), 
            textColor = v25(l__studioStyleGuideColor_0.MainText)
        }, 
        sortComponent = {
            labelTextColor = v25(l__studioStyleGuideColor_0.MainText)
        }, 
        radioButton = {
            textColor = v25(l__studioStyleGuideColor_0.MainText), 
            background = v25(l__studioStyleGuideColor_0.InputFieldBackground)
        }
    });
end;
return v9;
