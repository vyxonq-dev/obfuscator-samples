local a = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local b = game:GetService('MarketplaceService')
local c = game:GetService('Players')
local d = c.LocalPlayer
local e = {
    Name = 'cracked by @rqccc',
    LoadingTitle = 'cracked by @rqccc',
    LoadingSubtitle = 'cracked by @rqccc',
    ConfigurationSaving = {
        Enabled = true,
        FileName = 'dark.cc',
    },
    Discord = {
        Enabled = true,
        Invite = 'EbhtGYbuTa',
        RememberJoins = true,
    }
}
local f = a:CreateWindow(e)

a:Notify({
    Title = 'cracked by @rqccc',
    Content = 'cracked by @rqccc',
    Duration = 6.5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = 'cracked by @rqccc',
            Callback = function()end,
        },
    },
})

local g = f:CreateTab('Main', 4483362458)
local h = nil
local i = {}

local function j()
    i = {}

    local k, l = pcall(function()
        return b:GetDeveloperProductsAsync()
    end)

    if k then
        for m, n in pairs(l:GetCurrentPage())do
            table.insert(i, {
                Name = n.Name,
                ID = n.ProductId,
                Description = n.Description,
                Price = n.PriceInRobux,
            })
        end
    else
        warn('Failed:', l)
    end

    local o = {}

    for p, n in ipairs(i)do
        table.insert(o, n.Name)
    end

    if #o == 0 then
        table.insert(o, 'No GamePasses Found')
    end

    return o
end
local function q(r)
    local s, t = pcall(function()
        b:SignalPromptProductPurchaseFinished(d.UserId, r, true)

        return true
    end)

    return s, t
end
local function u()
    local v = j()
    local w = {}

    for p, n in ipairs(i)do
        local s, t = q(n.ID)

        table.insert(w, {
            Name = n.Name,
            Success = s,
            Message = t,
        })
        wait(0.5)
    end

    return w
end

local x = g:CreateDropdown({
    Name = 'Select GamePass',
    Options = j(),
    CurrentOption = {
        'Select a GamePass',
    },
    MultipleOptions = false,
    Flag = 'Dropdown1',
    Callback = function(y)
        h = y[1]

        for p, n in ipairs(i)do
            if n.Name == h then
                h = n

                break
            end
        end
    end,
})
local z = g:CreateButton({
    Name = 'Buy Gamepass',
    Callback = function()
        if not h or type(h) == 'string' then
            a:Notify({
                Title = 'Error',
                Content = 'Select valid GamePass!',
                Duration = 3,
                Image = 4483362458,
            })

            return
        end

        a:Notify({
            Title = 'Purchasing...',
            Content = 'Buying: ' .. h.Name,
            Duration = 2,
            Image = 4483362458,
        })

        local s, t = q(h.ID)

        if s then
            a:Notify({
                Title = 'Success!',
                Content = 'Purchased: ' .. h.Name,
                Duration = 5,
                Image = 4483362458,
            })
        else
            a:Notify({
                Title = 'Error',
                Content = 'Failed: ' .. h.Name .. '\n' .. tostring(t),
                Duration = 5,
                Image = 4483362458,
            })
        end
    end,
})
local A = g:CreateButton({
    Name = 'Buy All',
    Callback = function()
        a:Notify({
            Title = 'Processing...',
            Content = 'Buying all passes',
            Duration = 3,
            Image = 4483362458,
        })

        local w = u()
        local B = 0
        local C = 0

        for p, D in ipairs(w)do
            if D.Success then
                B = B + 1
            else
                C = C + 1
            end
        end

        a:Notify({
            Title = 'Complete',
            Content = string.format('Success: %d | Failed: %d', B, C),
            Duration = 6,
            Image = 4483362458,
        })
    end,
})
local E = g:CreateButton({
    Name = 'Refresh List',
    Callback = function()
        local F = j()

        x:SetOptions(F)
        a:Notify({
            Title = 'Refreshed',
            Content = 'Found ' .. (#F > 0 and #F or '0') .. ' Passes',
            Duration = 3,
            Image = 4483362458,
        })
    end,
})
local G = g:CreateButton({
    Name = 'Copy ID',
    Callback = function()
        if not h or type(h) == 'string' then
            a:Notify({
                Title = 'Error',
                Content = 'Select GamePass first!',
                Duration = 3,
                Image = 4483362458,
            })

            return
        end
        if setclipboard then
            setclipboard(tostring(h.ID))
            a:Notify({
                Title = 'Copied!',
                Content = 'ID: ' .. h.ID,
                Duration = 4,
                Image = 4483362458,
            })
        else
            a:Notify({
                Title = 'Error',
                Content = 'No clipboard',
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

g:CreateSection('Info')

local H = g:CreateLabel('Select GamePass for info')

while true do
    if h and type(h) == 'table' then
        H:Set('Name: ' .. h.Name .. '\nID: ' .. h.ID .. '\nPrice: ' .. h.Price .. ' R$' .. '\nDesc: ' .. h.Description)
    else
        H:Set('Select GamePass')
    end

    wait(1)
end
