return (require(script:FindFirstAncestor("AssetManager").Packages.Rodux).combineReducers({
    ExampleReducer = require(script.Parent.ExampleReducer)
}));
