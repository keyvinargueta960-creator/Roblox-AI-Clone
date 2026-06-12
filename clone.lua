-- CORE AI AVATAR CLONE SCRIPT (TARGETING GEMINI-PRO)
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ChatService = game:GetService("Chat")
local UIS = game:GetService("UserInputService")
local Tweens = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")

local lp = Players.LocalPlayer
local cloneNPC = nil

-- HARDCODED VALID WORKING KEY
local ACTIVE_KEY = "AQ.Ab8RN6JjxvtOeQhxwr2j9MRGpn6Wu3vTR6vY0PzYY_VKvK4Xdg"

-- 1. CLONE SPAWNER
local function spawnAI()
    local s, m = pcall(function() return Players:CreateHumanoidModelFromUserIdAsync(260811802) end)
    if s and m then
        m.Name = lp.Name .. " (AI Clone)"
        m:SetPrimaryPartCFrame((lp.Character or lp.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, -5))
        m.Parent = workspace cloneNPC = m
    end
end
spawnAI()

-- 2. CORE WEB ENGINE PIPELINE (GOOGLE SPECIFICATION)
local function askAI(msg)
    local req = request or (http and http.request) or (syn and syn.request)
    if not req then return "Executor missing network privileges!" end
    
    local targetPayload = {
        contents = {
            {
                role = "user",
                parts = {
                    { text = "System Prompt: You are a friendly Roblox player avatar clone. Keep answers simple, natural, and under 2 short sentences max. Talk like a real human gamer chatting in-game. User Message: " .. msg }
                }
            }
        }
    }
    
    local s, r = pcall(function()
        return req({
            Url = "https://roproxy.com" .. ACTIVE_KEY,
            Method = "POST", 
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(targetPayload)
        })
    end)
    
    if s and r and r.StatusCode == 200 then
        local ds, d = pcall(function() return HttpService:JSONDecode(r.Body) end)
        if ds and d and d.candidates and d.candidates[1] and d.candidates[1].content and d.candidates[1].content.parts and d.candidates[1].content.parts[1] then
            return string.gsub(d.candidates[1].content.parts[1].text, "[\n]", "")
        end
    end
    return "API Connection Failed. Please try again!"
end

-- ANTI-KICK CORE
task.spawn(function() while task.wait(10) do pcall(function() VU:CaptureController() VU:ClickButton2(Vector2.new(0,0)) end) end end)

-- 3. ORIGINAL LIQUID GLASS GUI SPECIFICATION
local SG = Instance.new("ScreenGui", game:GetService("CoreGui") or lp:WaitForChild("PlayerGui"))
SG.Name = "LiquidGlassAI_VFinal" SG.ResetOnSpawn = false

local function applyOriginalGlassStyle(i)
    i.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
    i.BackgroundTransparency = 0.4 -- White semi-transparent layout
    Instance.new("UICorner", i).CornerRadius = UDim.new(0, 12)
    local s = Instance.new("UIStroke", i) s.Color, s.Thickness, s.Transparency = Color3.fromRGB(255,255,255), 1.5, 0.2
end

local Main = Instance.new("Frame", SG) Main.Size = UDim2.new(0, 180, 0, 110) Main.Position = UDim2.new(0.05, 0, 0.4, 0) applyOriginalGlassStyle(Main)
local Ly = Instance.new("UIListLayout", Main) Ly.Padding, Ly.HorizontalAlignment, Ly.VerticalAlignment = UDim.new(0, 8), Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Center

local function btn(t, p)
    local b = Instance.new("TextButton", p) b.Size = UDim2.new(0, 150, 0, 35) b.BackgroundColor3 = Color3.fromRGB(255,255,255) b.BackgroundTransparency = 0.7
    b.Font, b.Text, b.TextColor3, b.TextSize = Enum.Font.SourceSansBold, t, Color3.fromRGB(255,255,255), 16
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", b) s.Color, s.Thickness, s.Transparency = Color3.fromRGB(255,255,255), 1, 0.5
    return b
end

local Bring, OpenChat = btn("Bring AI to Me", Main), btn("Open Chat", Main)

local function subWin(ph)
    local w = Instance.new("Frame", SG) w.Size, w.Visible = UDim2.new(0, 280, 0, 90), false
    w.Position = UDim2.new(0.5, -140, 0.4, -45) applyOriginalGlassStyle(w)
    
    local c = Instance.new("TextButton", w) c.Size, c.Position, c.BackgroundTransparency = UDim2.new(0, 24, 0, 24), UDim2.new(1, -28, 0, 4), 1
    c.Font, c.Text, c.TextColor3, c.TextSize = Enum.Font.SourceSansBold, "X", Color3.fromRGB(255, 255, 255), 14
    
    local t = Instance.new("TextBox", w) t.Size, t.Position, t.BackgroundTransparency = UDim2.new(0, 250, 0, 35), UDim2.new(0.5, -125, 0, 10), 0.8
    t.BackgroundColor3, t.Font, t.PlaceholderText, t.Text, t.TextColor3, t.TextSize, t.PlaceholderColor3 = Color3.fromRGB(255,255,255), Enum.Font.SourceSans, ph, "", Color3.fromRGB(255,255,255), 15, Color3.fromRGB(220,220,220)
    t.ClearTextOnFocus = false
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 6)
    
    local s = Instance.new("TextButton", w) s.Size, s.Position, s.BackgroundTransparency = UDim2.new(0, 80, 0, 25), UDim2.new(0.5, -40, 0, 52), 0.6
    s.BackgroundColor3, s.Font, s.TextColor3, s.TextSize = Color3.fromRGB(255,255,255), Enum.Font.SourceSansBold, Color3.fromRGB(50,50,50), 14
    Instance.new("UICorner", s).CornerRadius = UDim.new(0, 4)
    return w, c, t, s
end

local ChatW, ChatC, Box, Send = subWin("Type message here...") Send.Text = "Send"

local function toggle(f, show)
    if show then f.Size, f.Visible = UDim2.new(0,0,0,0), true Tweens:Create(f, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 280, 0, 90)}):Play()
    else local tw = Tweens:Create(f, TweenInfo.new(0.15), {Size = UDim2.new(0, 0, 0, 0)}) tw:Play() tw.Completed:Connect(function() f.Visible, f.Size = false, UDim2.new(0, 280, 0, 90) end) end
end

Bring.MouseButton1Click:Connect(function()
    if cloneNPC and cloneNPC:FindFirstChild("HumanoidRootPart") then cloneNPC:SetPrimaryPartCFrame((lp.Character or lp.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, -5)) else spawnAI() end
end)
OpenChat.MouseButton1Click:Connect(function() toggle(ChatW, not ChatW.Visible) end)
ChatC.MouseButton1Click:Connect(function() toggle(ChatW, false) end)

local proc = false
Send.MouseButton1Click:Connect(function()
    if proc or Box.Text == "" then return end proc = true local txt = Box.Text Box.Text = "Thinking..."
    task.spawn(function()
        local rep = askAI(txt)
        if cloneNPC and cloneNPC:FindFirstChild("Head") then ChatService:Chat(cloneNPC.Head, rep, 0) end
        Box.Text, proc = "", false
    end)
end)

local function drag(f)
    local drag, start, pos
    f.InputBegan:Connect(function(i) if i.UserInputType.Value == 0 or i.UserInputType.Value == 7 then drag, start, pos = true, i.Position, f.Position end end)
    UIS.InputChanged:Connect(function(i)
        if drag and (i.UserInputType.Value == 4 or i.UserInputType.Value == 7) then
            local d = i.Position - start
            Tweens:Create(f, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(pos.X.Scale, pos.X.Offset + d.X, pos.Y.Scale, pos.Y.Offset + d.Y)}):Play()
        end
    end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType.Value == 0 or i.UserInputType.Value == 7 then drag = false end end)
end
drag(Main) drag(ChatW)
