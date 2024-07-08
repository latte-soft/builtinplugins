return (require(script:FindFirstAncestor("Ribbon").Packages.Rodux).combineReducers({
    ExampleReducer = require(script.Parent.ExampleReducer)
}));
