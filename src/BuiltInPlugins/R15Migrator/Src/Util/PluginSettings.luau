local v0 = {};
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    return (setmetatable({
        settingName = v2
    }, v1));
end;
v1.getSetting = function(v3, v4, v5)
    if not (v5 ~= nil) or v5 == 0 then
        return ;
    else
        return v4:GetSetting(tostring(v5) .. v3.settingName);
    end;
end;
v1.getBooleanSetting = function(v6, v7, v8)
    if not v6:getSetting(v7, v8) then
        return false;
    else
        return true;
    end;
end;
v1.setSetting = function(v9, v10, v11, v12)
    if not (v11 ~= nil) or v11 == 0 then
        return ;
    else
        v10:SetSetting(tostring(v11) .. v9.settingName, v12);
        return ;
    end;
end;
v0.InitiallyEnabled = v1.new("_initially_enabled");
v0.CorrespondingR15Experience = v1.new("_r6_original_experience");
v0.IsR15ConvertedExperience = v1.new("_r15_converted_experience");
v0.SuccessfullyPublishedDateTime = v1.new("_successfully_published_date_time");
return v0;
