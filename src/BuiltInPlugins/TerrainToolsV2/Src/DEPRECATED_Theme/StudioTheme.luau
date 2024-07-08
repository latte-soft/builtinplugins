local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local v1 = require(script.Parent.join);
local l_Signal_0 = v0.Util.Signal;
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    local v6 = {
        getTheme = function()
            return settings().Studio.Theme;
        end, 
        createValues = function(...)
            return v4(...);
        end, 
        valuesChanged = l_Signal_0.new(), 
        values = {}, 
        themeChangedConnection = nil
    };
    setmetatable(v6, v3);
    if not v5 then
        v6.themeChangedConnection = settings().Studio.ThemeChanged:Connect(function()
            v6:recalculateTheme();
        end);
    else
        v6.themeChangedConnection = v5:Connect(function()
            v6:recalculateTheme();
        end);
    end;
    v6:recalculateTheme();
    return v6;
end;
v3.connect = function(v7, ...)
    return v7.valuesChanged:Connect(...);
end;
v3.destroy = function(v8)
    if v8.themeChangedConnection then
        v8.themeChangedConnection:Disconnect();
    end;
end;
v3.update = function(v9, v10)
    v9.values = v1(v9.values, v10);
    if v9.valuesChanged then
        v9.valuesChanged:Fire(v9.values);
    end;
end;
v3.recalculateTheme = function(v11)
    local v12 = v11.getTheme();
    v11:update((v11.createValues(function(...)
        return v12:GetColor(...);
    end, Enum.StudioStyleGuideColor, Enum.StudioStyleGuideModifier)));
end;
v3.newDummyTheme = function(v13)
    local v14 = {
        getTheme = function()
            return {
                GetColor = function()
                    return Color3.new();
                end
            };
        end, 
        createValues = function(...)
            return v13(...);
        end, 
        valuesChanged = l_Signal_0.new(), 
        values = {}
    };
    setmetatable(v14, v3);
    v14:update((v14.createValues(function()
        return v14.getTheme():GetColor();
    end, {}, {})));
    return v14;
end;
return v3;
