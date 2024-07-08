local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
local v2 = require(script.Parent.BoxAdorn);
local v3 = require(script.Parent.SphereAdorn);
local v4 = require(script.Parent.OutlineAdorn);
local v5 = require(script.Parent.IconAdorn);
local v6 = require(script.Parent.TextAdorn);
return function(v7)
    local l_partsList_0 = v7.partsList;
    local v9 = {};
    for v10, v11 in pairs(l_partsList_0) do
        local v12 = nil;
        if v11.DrawType == "Outline" then
            v12 = v4;
        elseif v11.DrawType == "Box" then
            v12 = v2;
        elseif v11.DrawType == "Sphere" then
            v12 = v3;
        elseif v11.DrawType == "Icon" then
            v12 = v5;
        elseif v11.DrawType == "Text" then
            v12 = v6;
        else
            error("Unknown DrawType: " .. tostring(v11.DrawType));
        end;
        v9[v10] = v1.createElement(v12, {
            Adornee = v11.Part, 
            Icon = v11.Icon, 
            Color = v11.Color, 
            TagName = v11.TagName, 
            AlwaysOnTop = v11.AlwaysOnTop
        });
    end;
    return v1.createElement(v1.Portal, {
        target = l_CoreGui_0
    }, {
        TagEditorWorldView = v1.createElement("Folder", {}, v9)
    });
end;
