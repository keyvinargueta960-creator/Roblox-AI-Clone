Here’s a polished version of your GUI with fully transparent, fancy rounded buttons and a sleek glassy aesthetic:

-- Main Glassy Frame
main.Size = UDim2.new(0, 340, 0, 420)
main.Position = UDim2.new(.5, -170, .5, -210)
main.BackgroundTransparency = 0.35
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

-- Rounded Corners
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 25)
mainCorner.Parent = main

-- Soft White Stroke
local stroke = Instance.new("UIStroke")
stroke.Parent = main
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.6

-- Gradient Overlay for Glass Effect
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 255))
})
gradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.4),
    NumberSequenceKeypoint.new(1, 0.65)
})
gradient.Rotation = 45
gradient.Parent = main

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "AI Companion"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(240, 240, 255)
title.Parent = main

-- Fancy Buttons
for i,v in ipairs(names) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(.8, 0, 0, 42)
    b.Position = UDim2.new(.1, 0, 0, 140 + (i-1) * 55)
    b.Text = v
    b.BackgroundTransparency = 0.4
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.TextColor3 = Color3.fromRGB(50, 50, 70)
    b.Font = Enum.Font.GothamSemibold
    b.Parent = main

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 18)
    bCorner.Parent = b

    local bStroke = Instance.new("UIStroke")
    bStroke.Color = Color3.fromRGB(255, 255, 255)
    bStroke.Transparency = 0.7
    bStroke.Thickness = 1
    bStroke.Parent = b

    -- Hover Animation
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(.15), {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(.82, 0, 0, 45)
        }):Play()
    end)

    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(.15), {
            BackgroundTransparency = 0.4,
            Size = UDim2.new(.8, 0, 0, 42)
        }):Play()
    end)
end

-- Notification Glass Style
notif.BackgroundTransparency = 0.4
notif.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notif.TextColor3 = Color3.fromRGB(40, 40, 60)
local notifCorner = Instance.new("UICorner")
notifCorner.CornerRadius = UDim.new(0, 20)
notifCorner.Parent = notif

-- Notification Stroke for Glass Outline
local notifStroke = Instance.new("UIStroke")
notifStroke.Color = Color3.fromRGB(255, 255, 255)
notifStroke.Transparency = 0.7
notifStroke.Thickness = 1
notifStroke.Parent = notif

This update makes your GUI:
	⁃	Semi-transparent with a frosted glass feel.
ag and i.UserInputType==Enum.UserInputType.MouseMovement then

        local d=i.Position-start

        main.Position=UDim2.new(
            pos.X.Scale,
            pos.X.Offset+d.X,
            pos.Y.Scale,
            pos.Y.Offset+d.Y
        )

    end

end)

UIS.InputEnded:Connect(function(i)

    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        drag=false
    end

end)

openButton.MouseButton1Click:Connect(function()

    if main.Visible then

        TweenService:Create(
            main,
            TweenInfo.new(.25),
            {Size=UDim2.new(0,0,0,0)}
        ):Play()

        task.wait(.25)

        main.Visible=false

    else

        main.Visible=true
        main.Size=UDim2.new(0,0,0,0)

        TweenService:Create(
            main,
            TweenInfo.new(.25),
            {Size=UDim2.new(0,340,0,420)}
        ):Play()

    end

end)

Notify("AI Menu Loaded",Color3.fromRGB(0,255,0)) local HttpService=game:GetService("HttpService")
local TextChatService=game:GetService("TextChatService")

local API_KEY=""

local chatFrame=Instance.new("Frame")
chatFrame.Size=UDim2.new(0,300,0,180)
chatFrame.Position=UDim2.new(.5,-150,.5,180)
chatFrame.BackgroundTransparency=.15
chatFrame.BackgroundColor3=Color3.fromRGB(40,40,45)
chatFrame.Visible=false
chatFrame.Parent=gui

Instance.new("UICorner",chatFrame).CornerRadius=UDim.new(0,15)

local input=Instance.new("TextBox")
input.Size=UDim2.new(.75,0,0,35)
input.Position=UDim2.new(.03,0,.72,0)
input.PlaceholderText="Talk to AI..."
input.Parent=chatFrame

Instance.new("UICorner",input)

local send=Instance.new("TextButton")
send.Size=UDim2.new(.18,0,0,35)
send.Position=UDim2.new(.79,0,.72,0)
send.Text="Send"
send.Parent=chatFrame

Instance.new("UICorner",send)

local output=Instance.new("TextLabel")
output.Size=UDim2.new(.94,0,.6,0)
output.Position=UDim2.new(.03,0,.04,0)
output.TextWrapped=true
output.TextYAlignment=Enum.TextYAlignment.Top
output.BackgroundTransparency=1
output.Text=""
output.Parent=chatFrame

local chatButton=main:FindFirstChild("ChatButton")

if chatButton then

chatButton.MouseButton1Click:Connect(function()

chatFrame.Visible=not chatFrame.Visible

end)

end

function Bubble(text)

if NPC and NPC:FindFirstChild("Head") then

pcall(function()

TextChatService:DisplayBubble(
NPC.Head,
text
)

end)

end

output.Text=text

end

function AskGemini(msg)

local body={

contents={

{

role="user",

parts={

{

text=msg

}

}

}

}

}

local success,response=pcall(function()

return request({

Url="https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key="..API_KEY,

Method="POST",

Headers={

["Content-Type"]="application/json"

},

Body=HttpService:JSONEncode(body)

})

end)

if not success then

Notify("Connection Failed",Color3.fromRGB(255,0,0))

status.Text="● Offline"
status.TextColor3=Color3.fromRGB(255,0,0)

return

end

if response.StatusCode~=200 then

Notify("Invalid API Key",Color3.fromRGB(255,0,0))

status.Text="● Offline"
status.TextColor3=Color3.fromRGB(255,0,0)

return

end

status.Text="● Online"
status.TextColor3=Color3.fromRGB(0,255,0)

local data=HttpService:JSONDecode(response.Body)

local reply=data.candidates[1].content.parts[1].text

Bubble(reply)

end

send.MouseButton1Click:Connect(function()

if api.Text=="" then

Notify("Paste API Key",Color3.fromRGB(255,0,0))

return

end

API_KEY=api.Text

local text=input.Text

if text=="" then

return

end

input.Text=""

output.Text="Thinking..."

task.spawn(function()

AskGemini(text)

end)

end)

game:GetService("UserInputService").InputBegan:Connect(function(key,gp)

if gp then

return

end

if key.KeyCode==Enum.KeyCode.Return then

send:Activate()

end

end) local Players=game:GetService("Players")
local PathfindingService=game:GetService("PathfindingService")
local RunService=game:GetService("RunService")

local player=Players.LocalPlayer

local NPC=nil

local function CreateNPC()

    if NPC then
        NPC:Destroy()
    end

    NPC=Instance.new("Model")
    NPC.Name="AICompanion"

    local hum=Instance.new("Humanoid")
    hum.Parent=NPC

    local root=Instance.new("Part")
    root.Name="HumanoidRootPart"
    root.Size=Vector3.new(2,2,1)
    root.Transparency=1
    root.Parent=NPC

    local head=Instance.new("Part")
    head.Name="Head"
    head.Size=Vector3.new(2,1,1)
    head.Position=root.Position+Vector3.new(0,3,0)
    head.Parent=NPC

    local torso=Instance.new("Part")
    torso.Name="Torso"
    torso.Size=Vector3.new(2,2,1)
    torso.Position=root.Position+Vector3.new(0,1.5,0)
    torso.Parent=NPC

    local weld1=Instance.new("Motor6D")
    weld1.Part0=root
    weld1.Part1=torso
    weld1.Parent=root

    local weld2=Instance.new("Motor6D")
    weld2.Part0=torso
    weld2.Part1=head
    weld2.Parent=torso

    NPC.PrimaryPart=root

    NPC.Parent=workspace

end

CreateNPC()

local walkAnim=Instance.new("Animation")
walkAnim.AnimationId="rbxassetid://180426354"

local walkTrack

task.spawn(function()

    repeat task.wait()

    until NPC and NPC:FindFirstChildOfClass("Humanoid")

    local animator=NPC.Humanoid:FindFirstChildOfClass("Animator")

    if not animator then
        animator=Instance.new("Animator")
        animator.Parent=NPC.Humanoid
    end

    walkTrack=animator:LoadAnimation(walkAnim)

end)

RunService.Heartbeat:Connect(function()

    if not player.Character then
        return
    end

    local hrp=player.Character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return
    end

    local npcRoot=NPC.PrimaryPart

    local distance=(npcRoot.Position-hrp.Position).Magnitude

    local look=CFrame.lookAt(
        npcRoot.Position,
        hrp.Position
    )

    npcRoot.CFrame=CFrame.new(
        npcRoot.Position
    )*CFrame.Angles(
        0,
        look:ToOrientation()
    )

    if distance>7 then

        local path=PathfindingService:CreatePath()

        path:ComputeAsync(
            npcRoot.Position,
            hrp.Position
        )

        local points=path:GetWaypoints()

        if walkTrack and not walkTrack.IsPlaying then
            walkTrack:Play()
        end

        for _,v in ipairs(points) do

            NPC.Humanoid:MoveTo(v.Position)

            NPC.Humanoid.MoveToFinished:Wait()

        end

    elseif distance<3 then

        local back=(npcRoot.Position-hrp.Position).Unit

        NPC:SetPrimaryPartCFrame(

            CFrame.new(
                hrp.Position+back*4
            )

        )

    else

        if walkTrack then
            walkTrack:Stop()
        end

    end

end)

local teleportButton

for _,v in ipairs(main:GetDescendants()) do

    if v:IsA("TextButton") and v.Text=="Teleport NPC" then
        teleportButton=v
    end

end

if teleportButton then

teleportButton.MouseButton1Click:Connect(function()

    if not player.Character then
        return
    end

    local hrp=player.Character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return
    end

    NPC:SetPrimaryPartCFrame(

        CFrame.new(

            hrp.Position+
            hrp.CFrame.LookVector*-4

        )

    )

    Notify(
        "NPC Teleported",
        Color3.fromRGB(0,255,0)
    )

end)

end

task.spawn(function()

while true do

task.wait(30)

if NPC and NPC:FindFirstChild("Head") then

pcall(function()

game:GetService("TextChatService"):DisplayBubble(

NPC.Head,

"Following "..player.Name

)

end)

end

end

end) local Players=game:GetService("Players")

local idleAnim=Instance.new("Animation")
idleAnim.AnimationId="rbxassetid://507766666"

local runAnim=Instance.new("Animation")
runAnim.AnimationId="rbxassetid://913402848"

local idleTrack
local runTrack

task.spawn(function()

    repeat task.wait()

    until NPC and NPC:FindFirstChild("Humanoid")

    local animator=NPC.Humanoid:FindFirstChildOfClass("Animator")

    if not animator then
        animator=Instance.new("Animator")
        animator.Parent=NPC.Humanoid
    end

    idleTrack=animator:LoadAnimation(idleAnim)
    runTrack=animator:LoadAnimation(runAnim)

    idleTrack.Looped=true
    runTrack.Looped=true

    idleTrack:Play()

end)

NPC.Humanoid.Running:Connect(function(speed)

    if speed>1 then

        if idleTrack and idleTrack.IsPlaying then
            idleTrack:Stop()
        end

        if runTrack and not runTrack.IsPlaying then
            runTrack:Play()
        end

    else

        if runTrack and runTrack.IsPlaying then
            runTrack:Stop()
        end

        if idleTrack and not idleTrack.IsPlaying then
            idleTrack:Play()
        end

    end

end)

local cloneWindow=Instance.new("Frame")
cloneWindow.Size=UDim2.new(0,250,0,110)
cloneWindow.Position=UDim2.new(.5,-125,.5,-55)
cloneWindow.Visible=false
cloneWindow.Parent=gui

Instance.new("UICorner",cloneWindow)

local username=Instance.new("TextBox")
username.Size=UDim2.new(.9,0,0,35)
username.Position=UDim2.new(.05,0,.1,0)
username.PlaceholderText="Username"
username.Parent=cloneWindow

local cloneButton=Instance.new("TextButton")
cloneButton.Size=UDim2.new(.9,0,0,35)
cloneButton.Position=UDim2.new(.05,0,.55,0)
cloneButton.Text="Clone Avatar"
cloneButton.Parent=cloneWindow

for _,v in ipairs(main:GetDescendants()) do

    if v:IsA("TextButton") and v.Text=="Clone Avatar" then

        v.MouseButton1Click:Connect(function()

            cloneWindow.Visible=not cloneWindow.Visible

        end)

    end

end

cloneButton.MouseButton1Click:Connect(function()

    local name=username.Text

    if name=="" then

        Notify(
            "Enter Username",
            Color3.fromRGB(255,0,0)
        )

        return

    end

    local ok,userId=pcall(function()

        return Players:GetUserIdFromNameAsync(name)

    end)

    if not ok then

        Notify(
            "User Not Found",
            Color3.fromRGB(255,0,0)
        )

        return

    end

    local success,description=pcall(function()

        return Players:GetHumanoidDescriptionFromUserId(userId)

    end)

    if not success then

        Notify(
            "Avatar Load Failed",
            Color3.fromRGB(255,0,0)
        )

        return

    end

    NPC.Humanoid:ApplyDescription(description)

    Notify(
        "Avatar Updated",
        Color3.fromRGB(0,255,0)
    )

end)

task.spawn(function()

    while true do

        task.wait(.15)

        if not player.Character then
            continue
        end

        local hrp=player.Character:FindFirstChild("HumanoidRootPart")

        if not hrp then
            continue
        end

        local root=NPC.PrimaryPart

        local dist=(root.Position-hrp.Position).Magnitude

        if dist>6 then

            NPC.Humanoid.WalkSpeed=14

        elseif dist<4 then

            NPC.Humanoid.WalkSpeed=8

        else

            NPC.Humanoid.WalkSpeed=10

        end

    end

end)

RunService.Heartbeat:Connect(function()

    if not player.Character then
        return
    end

    local hrp=player.Character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return
    end

    local root=NPC.PrimaryPart

    root.CFrame=CFrame.lookAt(

        root.Position,

        Vector3.new(
            hrp.Position.X,
            root.Position.Y,
            hrp.Position.Z
        )

    )

end) local HttpService=game:GetService("HttpService")
local TweenService=game:GetService("TweenService")

local SAVE_FILE="AICompanion.json"

local Settings={
APIKey="",
NPCName="AI Companion",
AutoReconnect=true
}

pcall(function()

if isfile and isfile(SAVE_FILE) then

Settings=HttpService:JSONDecode(
readfile(SAVE_FILE)
)

api.Text=Settings.APIKey

end

end)

local function Save()

pcall(function()

writefile(

SAVE_FILE,

HttpService:JSONEncode(Settings)

)

end)

end

api.FocusLost:Connect(function()

Settings.APIKey=api.Text

Save()

end)

local reconnect=false

task.spawn(function()

while true do

task.wait(15)

if reconnect and Settings.AutoReconnect then

status.Text="● Reconnecting..."
status.TextColor3=Color3.fromRGB(255,255,0)

task.wait(2)

status.Text="● Online"
status.TextColor3=Color3.fromRGB(0,255,0)

reconnect=false

end

end

end)

function NotifyEx(message,color)

local frame=Instance.new("Frame")

frame.Size=UDim2.new(0,0,0,40)

frame.Position=UDim2.new(.5,-140,.9,0)

frame.BackgroundColor3=Color3.fromRGB(35,35,40)

frame.Parent=gui

Instance.new("UICorner",frame)

local text=Instance.new("TextLabel")

text.Size=UDim2.new(1,0,1,0)

text.BackgroundTransparency=1

text.Text=message

text.TextColor3=color

text.Parent=frame

TweenService:Create(

frame,

TweenInfo.new(.3),

{

Size=UDim2.new(0,280,0,40)

}

):Play()

task.wait(4)

TweenService:Create(

frame,

TweenInfo.new(.3),

{

Size=UDim2.new(0,0,0,40)

}

):Play()

task.wait(.3)

frame:Destroy()

end

task.spawn(function()

while true do

task.wait(math.random(25,40))

if NPC and NPC:FindFirstChild("Head") then

pcall(function()

game:GetService("TextChatService"):DisplayBubble(

NPC.Head,

"Still following "..player.Name.."!"

)

end)

end

end

end)

RunService.Heartbeat:Connect(function()

if not NPC then

return

end

local hum=NPC:FindFirstChild("Humanoid")

if hum and hum.Health<=0 then

NotifyEx(

"Respawning Companion",

Color3.fromRGB(255,255,0)

)

CreateNPC()

end

end)

for _,button in ipairs(main:GetDescendants()) do

if button:IsA("TextButton") then

button.MouseEnter:Connect(function()

TweenService:Create(

button,

TweenInfo.new(.15),

{

Rotation=2

}

):Play()

end)

button.MouseLeave:Connect(function()

TweenService:Create(

button,

TweenInfo.new(.15),

{

Rotation=0

}

):Play()

end)

button.MouseButton1Down:Connect(function()

TweenService:Create(

button,

TweenInfo.new(.08),

{

Size=button.Size-UDim2.new(0,4,0,4)

}

):Play()

end)

button.MouseButton1Up:Connect(function()

TweenService:Create(

button,

TweenInfo.new(.08),

{

Size=button.Size+UDim2.new(0,4,0,4)

}

):Play()

end)

end

end

NotifyEx(

"AI Companion Loaded Successfully",

Color3.fromRGB(0,255,0)

)

status.Text="● Ready"

status.TextColor3=Color3.fromRGB(0,255,0)
