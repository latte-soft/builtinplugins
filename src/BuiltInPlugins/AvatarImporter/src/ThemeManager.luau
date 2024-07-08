local l_Studio_0 = settings().Studio;
return {
    setImageColor = function(v1, v2, v3)
        v1:_set(v2, "ImageColor3", v3, Enum.StudioStyleGuideModifier.Default);
    end, 
    setTextColor = function(v4, v5, v6)
        v4:_set(v5, "TextColor3", v6, Enum.StudioStyleGuideModifier.Default);
    end, 
    setBackgroundColor = function(v7, v8, v9)
        v7:_set(v8, "BackgroundColor3", v9, Enum.StudioStyleGuideModifier.Default);
    end, 
    setBorderColor = function(v10, v11, v12)
        v10:_set(v11, "BorderColor3", v12, Enum.StudioStyleGuideModifier.Default);
    end, 
    setCustom = function(v13, v14, v15, v16)
        v13:_hook(function()
            v14[v15] = v16[l_Studio_0.Theme.Name];
        end);
    end, 
    _set = function(v17, v18, v19, v20, v21)
        v17:_hook(function()
            v18[v19] = l_Studio_0.Theme:GetColor(v20, v21);
        end);
    end, 
    _hook = function(_, v23)
        v23();
        l_Studio_0.ThemeChanged:Connect(v23);
    end
};
