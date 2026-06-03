local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "Fire" then
        if args[1] and typeof(args[1]) == "number" then
            args[1] = 50000
        end
    end

    return oldNamecall(self, unpack(args))
end)
