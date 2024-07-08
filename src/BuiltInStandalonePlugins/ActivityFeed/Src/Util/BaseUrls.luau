local v0 = "https://www.roblox.com";
local v1 = "https://create.roblox.com";
pcall(function()
    v0 = game:GetService("ContentProvider").BaseUrl;
    v1 = string.gsub(v0, "www", "create");
end);
return {
    wwwPath = v0, 
    createPath = v1
};
