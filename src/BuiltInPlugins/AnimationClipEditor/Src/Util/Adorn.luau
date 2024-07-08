return {
    Sphere = function(_, _, v2, v3, v4, v5)
        local v6 = Instance.new("SphereHandleAdornment", v2);
        v6.Name = "Sphere";
        v6.AlwaysOnTop = true;
        v6.Color3 = v4;
        v6.Adornee = v2;
        v6.ZIndex = v5;
        v6.Transparency = v3;
        v6.Archivable = false;
        return v6;
    end, 
    Line = function(_, _, v9, v10, v11, v12, v13)
        local v14 = Instance.new("LineHandleAdornment", v9);
        v14.Name = "Line";
        v14.AlwaysOnTop = true;
        v14.Thickness = v10;
        v14.Color3 = v11;
        v14.Adornee = v9;
        v14.ZIndex = v13;
        v14.Transparency = v12;
        v14.Archivable = false;
        return v14;
    end, 
    Cone = function(_, _, v17, v18, v19, v20)
        local v21 = Instance.new("ConeHandleAdornment", v17);
        v21.Name = "Cone";
        v21.AlwaysOnTop = true;
        v21.Color3 = v19;
        v21.Adornee = v17;
        v21.ZIndex = v20;
        v21.Transparency = v18;
        v21.Archivable = false;
        return v21;
    end
};
