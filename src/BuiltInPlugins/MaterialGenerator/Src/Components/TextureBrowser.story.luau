local l_Parent_0 = script.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(script.Parent.TextureBrowser);
local function v4()
    return {
        Name = "Testing", 
        Id = l_HttpService_0:GenerateGUID(false), 
        Textures = {
            ColorMap = "rbxassetid://12799638751"
        }, 
        BaseMaterial = nil, 
        IsGenerating = false, 
        IsTemporary = true, 
        Session = nil
    };
end;
return {
    story = function(_)
        return v2.createElement(v3, {
            GeneratingImages = 4, 
            Materials = {
                v4(), 
                v4(), 
                v4(), 
                (v4())
            }
        });
    end
};
