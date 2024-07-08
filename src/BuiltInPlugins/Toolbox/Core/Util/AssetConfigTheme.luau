local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v3 = require(l_Util_0.Colors);
local v4 = require(l_Util_0.createSignal);
local v5 = require(l_Util_0.wrapStrictTable);
local _ = require(l_Util_0.Images);
local v7 = require(l_Util_0.Test.TestHelpers);
local v8 = {};
v8.__index = v8;
v8.createDummyThemeManager = function()
    return v8.new({
        getTheme = function()
            return {
                GetColor = function()
                    return Color3.fromRGB(0, 0, 0);
                end
            };
        end, 
        studioStyleGuideColor = v7.createMockStudioStyleGuideColor(), 
        studioStyleGuideModifier = v7.createMockStudioStyleGuideModifier()
    });
end;
v8.new = function(v9)
    local v10 = {
        _externalThemeGetter = v9.getTheme or nil, 
        _externalThemeChangedSignal = v9.themeChanged or nil, 
        _externalThemeChangedConnection = nil, 
        _studioStyleGuideColor = v9.studioStyleGuideColor or Enum.StudioStyleGuideColor, 
        _studioStyleGuideModifier = v9.studioStyleGuideModifier or Enum.StudioStyleGuideModifier, 
        _values = {}, 
        _UILibraryTheme = {}, 
        _signal = v4()
    };
    v10.values = v5(v10._values, "theme");
    setmetatable(v10, v8);
    if v10._externalThemeChangedSignal then
        v10._externalThemeChangedConnection = v10._externalThemeChangedSignal:Connect(function()
            v10:_recalculateTheme();
        end);
    end;
    v10:_recalculateTheme();
    return v10;
end;
v8.subscribe = function(v11, ...)
    return v11._signal:subscribe(...);
end;
v8.destroy = function(v12)
    if v12._externalThemeChangedConnection then
        v12._externalThemeChangedConnection:Disconnect();
        v12._externalThemeChangedConnection = nil;
    end;
end;
v8._update = function(v13, v14)
    v13._values = v1.Dictionary.join(v13._values, v14);
    v13.values = v5(v13._values, "theme");
    v13._signal:fire(v13.values, v13._UILibraryTheme);
end;
v8._getExternalTheme = function(v15)
    local l__externalThemeGetter_0 = v15._externalThemeGetter;
    if type(l__externalThemeGetter_0) == "function" then
        return l__externalThemeGetter_0();
    else
        return l__externalThemeGetter_0;
    end;
end;
v8._isDarkerTheme = function(v17)
    local v18 = false;
    if v17._externalThemeGetter then
        v18 = v17._externalThemeGetter().Name == "Dark";
    end;
    return v18;
end;
v8._recalculateTheme = function(v19)
    local v20 = v19:_getExternalTheme();
    local v21 = v19:_isDarkerTheme();
    local l__studioStyleGuideColor_0 = v19._studioStyleGuideColor;
    local l__studioStyleGuideModifier_0 = v19._studioStyleGuideModifier;
    local function v24(...)
        return v20:GetColor(...);
    end;
    v19:_update({
        isDarkerTheme = v21, 
        assetConfig = {
            backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
            textColor = v24(l__studioStyleGuideColor_0.MainText), 
            labelTextColor = v24(l__studioStyleGuideColor_0.DimmedText), 
            separatorColor = v24(l__studioStyleGuideColor_0.Border), 
            errorColor = v24(l__studioStyleGuideColor_0.ErrorText), 
            packagePermissions = {
                backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
                subTextColor = v24(l__studioStyleGuideColor_0.SubText), 
                collaboratorItem = {
                    collapseStateArrow = not not v21 and Color3.fromRGB(204, 204, 204) or Color3.fromRGB(25, 25, 25), 
                    deleteButton = not not v21 and Color3.fromRGB(136, 136, 136) or Color3.fromRGB(184, 184, 184)
                }, 
                searchBar = {
                    border = v24(l__studioStyleGuideColor_0.InputFieldBorder), 
                    borderHover = not not v21 and v24(l__studioStyleGuideColor_0.MainButton) or v24(l__studioStyleGuideColor_0.CurrentMarker), 
                    borderSelected = not not v21 and v24(l__studioStyleGuideColor_0.MainButton) or v24(l__studioStyleGuideColor_0.CurrentMarker), 
                    placeholderText = v24(l__studioStyleGuideColor_0.DimmedText), 
                    backgroundColor = v24(l__studioStyleGuideColor_0.InputFieldBackground), 
                    searchIcon = v24(l__studioStyleGuideColor_0.SubText), 
                    clearButton = {
                        image = v24(l__studioStyleGuideColor_0.SubText)
                    }, 
                    dropDown = {
                        backgroundColor = v24(l__studioStyleGuideColor_0.InputFieldBackground), 
                        itemText = v24(l__studioStyleGuideColor_0.MainText), 
                        headerText = v24(l__studioStyleGuideColor_0.SubText), 
                        hovered = {
                            backgroundColor = v24(l__studioStyleGuideColor_0.Item, l__studioStyleGuideModifier_0.Hover), 
                            itemText = v24(l__studioStyleGuideColor_0.ButtonText, l__studioStyleGuideModifier_0.Hover)
                        }, 
                        selected = {
                            backgroundColor = v24(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Selected)
                        }
                    }
                }
            }
        }, 
        publishAsset = {
            backgroundColor = not not v21 and v24(l__studioStyleGuideColor_0.MainBackground) or Color3.fromRGB(46, 46, 46), 
            titleTextColor = v24(l__studioStyleGuideColor_0.SubText), 
            textColor = v24(l__studioStyleGuideColor_0.MainText), 
            tipsTextColor = not not v21 and Color3.fromRGB(102, 102, 102) or v3.GRAY_3
        }, 
        divider = {
            horizontalLineColor = not not v21 and Color3.fromRGB(34, 34, 34) or Color3.fromRGB(227, 227, 227)
        }, 
        dropdownMenu = {
            currentSelection = {
                backgroundColor = v24(l__studioStyleGuideColor_0.Dropdown), 
                backgroundSelectedColor = v24(l__studioStyleGuideColor_0.CurrentMarker), 
                borderColor = v24(l__studioStyleGuideColor_0.Border), 
                borderSelectedColor = v24(l__studioStyleGuideColor_0.CurrentMarker), 
                textColor = v24(l__studioStyleGuideColor_0.MainText), 
                textSelectedColor = v24(l__studioStyleGuideColor_0.MainText, l__studioStyleGuideModifier_0.Selected), 
                iconColor = not not v21 and Color3.fromRGB(242, 242, 242) or Color3.fromRGB(25, 25, 25), 
                iconSelectedColor = Color3.fromRGB(255, 255, 255)
            }, 
            item = {
                backgroundColor = v24(l__studioStyleGuideColor_0.Item), 
                backgroundSelectedColor = not not v21 and v24(l__studioStyleGuideColor_0.Item, l__studioStyleGuideModifier_0.Selected) or v24(l__studioStyleGuideColor_0.Tab), 
                selectedBarColor = v24(l__studioStyleGuideColor_0.CurrentMarker), 
                textColor = v24(l__studioStyleGuideColor_0.MainText), 
                labelTextColor = v24(l__studioStyleGuideColor_0.DimmedText)
            }, 
            dropdownFrame = {
                borderColor = v24(l__studioStyleGuideColor_0.Border)
            }
        }, 
        textField = {
            backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v24(l__studioStyleGuideColor_0.Border), 
            borderHoveredColor = v24(l__studioStyleGuideColor_0.CurrentMarker), 
            borderSelectedColor = v3.BLUE_PRIMARY
        }, 
        footer = {
            backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v24(l__studioStyleGuideColor_0.Border)
        }, 
        scrollingFrame = {
            scrollbarBackgroundColor = not not v21 and Color3.fromRGB(41, 41, 41) or Color3.fromRGB(245, 245, 245), 
            scrollbarImageColor = not not v21 and Color3.fromRGB(85, 85, 85) or Color3.fromRGB(245, 245, 245)
        }, 
        messageBox = {
            backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
            textColor = v24(l__studioStyleGuideColor_0.MainText), 
            informativeTextColor = v24(l__studioStyleGuideColor_0.SubText), 
            button = {
                textColor = v24(l__studioStyleGuideColor_0.MainText), 
                textSelectedColor = v24(l__studioStyleGuideColor_0.MainText, l__studioStyleGuideModifier_0.Selected), 
                backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
                backgroundSelectedColor = v24(l__studioStyleGuideColor_0.CurrentMarker), 
                borderColor = v24(l__studioStyleGuideColor_0.Border), 
                borderSelectedColor = v24(l__studioStyleGuideColor_0.CurrentMarker)
            }
        }, 
        cancelButton = {
            ButtonColor = v24(l__studioStyleGuideColor_0.Button), 
            ButtonColor_Hover = v24(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Hover), 
            ButtonColor_Disabled = v24(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Disabled), 
            TextColor = v24(l__studioStyleGuideColor_0.MainText), 
            TextColor_Disabled = v24(l__studioStyleGuideColor_0.DimmedText), 
            BorderColor = v24(l__studioStyleGuideColor_0.Border)
        }, 
        defaultButton = {
            ButtonColor = not not v21 and v24(l__studioStyleGuideColor_0.MainButton) or v24(l__studioStyleGuideColor_0.CurrentMarker), 
            ButtonColor_Hover = v24(l__studioStyleGuideColor_0.LinkText), 
            ButtonColor_Disabled = not not v21 and v24(l__studioStyleGuideColor_0.Button, l__studioStyleGuideModifier_0.Disabled) or v3.BLUE_DISABLED, 
            TextColor = Color3.new(1, 1, 1), 
            TextColor_Disabled = not not v21 and v24(l__studioStyleGuideColor_0.ButtonText, l__studioStyleGuideModifier_0.Disabled) or Color3.new(1, 1, 1), 
            BorderColor = v24(l__studioStyleGuideColor_0.Light)
        }, 
        loading = {
            text = v24(l__studioStyleGuideColor_0.MainText), 
            backgroundBar = v24(l__studioStyleGuideColor_0.Midlight), 
            bar = v24(l__studioStyleGuideColor_0.CurrentMarker)
        }, 
        uploadResult = {
            greenText = Color3.fromRGB(2, 183, 87), 
            redText = Color3.fromRGB(255, 68, 68), 
            text = v24(l__studioStyleGuideColor_0.MainText), 
            buttonColor = not not v21 and v24(l__studioStyleGuideColor_0.MainText) or v24(l__studioStyleGuideColor_0.DimmedText), 
            idText = v24(l__studioStyleGuideColor_0.DimmedText), 
            background = v24(l__studioStyleGuideColor_0.TableItem), 
            link = v24(l__studioStyleGuideColor_0.LinkText)
        }, 
        inputFields = {
            backgroundColor = v24(l__studioStyleGuideColor_0.InputFieldBackground), 
            backgroundColorDisabled = v24(l__studioStyleGuideColor_0.InputFieldBackground, l__studioStyleGuideModifier_0.Disabled), 
            borderColorActive = v24(l__studioStyleGuideColor_0.InputFieldBorder, l__studioStyleGuideModifier_0.Selected), 
            borderColorDisabled = v24(l__studioStyleGuideColor_0.InputFieldBorder, l__studioStyleGuideModifier_0.Disabled), 
            borderColor = v24(l__studioStyleGuideColor_0.InputFieldBorder), 
            toolTip = v24(l__studioStyleGuideColor_0.DimmedText), 
            error = v24(l__studioStyleGuideColor_0.ErrorText)
        }, 
        tags = {
            textColor = v24(l__studioStyleGuideColor_0.MainText), 
            backgroundColor = v24(l__studioStyleGuideColor_0.MainBackground), 
            borderColor = v24(l__studioStyleGuideColor_0.InputFieldBorder)
        }
    });
end;
return v8;
