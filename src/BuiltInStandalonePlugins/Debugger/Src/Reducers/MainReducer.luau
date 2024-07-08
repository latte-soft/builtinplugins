return require(script.Parent.Parent.Parent.Packages.Rodux).combineReducers({
    Breakpoint = require(script.Parent.Breakpoint), 
    Watch = require(script.Parent.Watch), 
    Callstack = require(script.Parent.Callstack), 
    Common = require(script.Parent.Common), 
    ScriptInfo = require(script.Parent.ScriptInfo)
});
