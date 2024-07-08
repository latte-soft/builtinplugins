local v0 = {
    IconEnums = {
        Places = "PlacesFolder", 
        Images = "ImagesFolder", 
        Meshes = "MeshesFolder", 
        Packages = "PackagesFolder", 
        Scripts = "StarterPlayerScripts", 
        Audio = "AudioFolder", 
        Video = "VideoFolder", 
        Models = "ModelsFolder", 
        BlankFolder = "BlankFolder", 
        Import = "Import", 
        List = "List", 
        Grid = "List", 
        Menu = "Menu", 
        Back = "Back", 
        Forward = "Fwd", 
        ArrowDown = "ArrowDown", 
        ArrowRight = "ArrowRight", 
        More = "More", 
        Zoom = "ZoomIn", 
        Spawn = "Spawn"
    }
};
v0.HighDpiAssetManagerIconsWithTheme1 = {
    [v0.IconEnums.Places] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.Places .. ".png", 
    [v0.IconEnums.Images] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.Images .. ".png", 
    [v0.IconEnums.Meshes] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.Meshes .. ".png", 
    [v0.IconEnums.Packages] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.Packages .. ".png", 
    [v0.IconEnums.Audio] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.Audio .. ".png", 
    [v0.IconEnums.Video] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.BlankFolder .. ".png", 
    [v0.IconEnums.Models] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Large/" .. v0.IconEnums.Models .. ".png", 
    [v0.IconEnums.BlankFolder] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Standard/" .. v0.IconEnums.BlankFolder .. ".png", 
    [v0.IconEnums.Import] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Standard/" .. v0.IconEnums.Import .. ".png", 
    [v0.IconEnums.List] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Standard/" .. v0.IconEnums.List .. ".png", 
    [v0.IconEnums.Grid] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Standard/" .. v0.IconEnums.Grid .. ".png", 
    [v0.IconEnums.Menu] = "rbxasset://studio_svg_textures/Lua/AssetManager/%s/Standard/" .. v0.IconEnums.Menu .. ".png", 
    [v0.IconEnums.Back] = "rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/" .. v0.IconEnums.Back .. ".png", 
    [v0.IconEnums.Forward] = "rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/" .. v0.IconEnums.Forward .. ".png", 
    [v0.IconEnums.ArrowDown] = "rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/" .. v0.IconEnums.ArrowDown .. ".png", 
    [v0.IconEnums.ArrowRight] = "rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/" .. v0.IconEnums.ArrowRight .. ".png", 
    [v0.IconEnums.More] = "rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/" .. v0.IconEnums.More .. ".png", 
    [v0.IconEnums.Zoom] = "rbxasset://studio_svg_textures/Shared/Navigation/%s/Standard/" .. v0.IconEnums.Zoom .. ".png", 
    [v0.IconEnums.Scripts] = "rbxasset://studio_svg_textures/Shared/InsertableObjects/%s/Standard/" .. v0.IconEnums.Scripts .. ".png", 
    [v0.IconEnums.Spawn] = "rbxasset://studio_svg_textures/Shared/InsertableObjects/%s/Standard/" .. v0.IconEnums.Spawn .. ".png"
};
v0.getIconForCurrentTheme = function(v1)
    return string.format(v0.HighDpiAssetManagerIconsWithTheme1[v1], settings().Studio.Theme.Name);
end;
return v0;
