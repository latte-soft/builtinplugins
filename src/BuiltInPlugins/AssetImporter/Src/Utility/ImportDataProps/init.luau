return (require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Util.strict({
    GroupProps = require(script.GroupProps), 
    MeshProps = require(script.MeshProps), 
    RootProps = require(script.RootProps), 
    MaterialProps = require(script.MaterialProps), 
    JointProps = require(script.JointProps), 
    BaseProps = require(script.BaseProps)
}));
