local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_Studio_0 = settings().Studio;
local v3 = require(l_Parent_0.src.Constants);
local v4 = v1.Component:extend("LoadingPrompt");
v4.render = function(_)
    return v1.createElement("ImageLabel", {
        Name = "LoadingPrompt", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground, Enum.StudioStyleGuideModifier.Default)
    }, {
        description = v1.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Font = v3.FONT, 
            Name = "Description", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = "Importing Avatar, please wait...", 
            TextSize = v3.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
        })
    });
end;
return v4;
