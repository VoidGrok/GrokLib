📚 GrokLib - Guia Completo de Desenvolvimento

📋 Sobre a GrokLib

A GrokLib é uma biblioteca para criação de interfaces gráficas (GUI) em jogos Roblox, desenvolvida para facilitar a criação de menus com abas, elementos interativos e sistema de configurações.

---

🚀 Como Usar

1. Carregar a Biblioteca

```lua
local GrokLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGrok/GrokLib/refs/heads/main/GrokLib.lua"))()
```

2. Criar a Janela Principal

```lua
local Window = GrokLib:MakeWindow({
    Name = "Nome do Script",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "NomePasta"
})
```

3. Criar Abas

```lua
local Tab = Window:MakeTab({
    Name = "Principal",
    Icon = "6026568198"
})
```

---

🧩 Elementos da Interface

Label (Texto Estático)

```lua
local label = Tab:AddLabel("Texto aqui")
-- Atualizar depois:
label:Set("Novo texto")
```

Toggle (Interruptor)

```lua
local toggle = Tab:AddToggle({
    Name = "Nome do Toggle",
    Description = "Descrição opcional",
    Default = false,
    Flag = "minhaFlag",
    Save = true,
    Callback = function(Value)
        print("Toggle:", Value)
    end
})
-- Para atualizar estado:
toggle:Set(true)
```

Slider (Barra Deslizante)

```lua
local slider = Tab:AddSlider({
    Name = "Nome do Slider",
    Description = "Descrição",
    Min = 1,
    Max = 100,
    Default = 50,
    Increment = 1,
    ValueName = "ms",
    Flag = "minhaFlag",
    Save = true,
    Callback = function(Value)
        print("Valor:", Value)
    end
})
-- Para atualizar:
slider:Set(75)
```

Textbox (Campo de Texto)

```lua
local textbox = Tab:AddTextbox({
    Name = "Nome do Campo",
    Description = "Descrição",
    Default = "valor padrão",
    TextDisappear = false,
    Callback = function(Value)
        print("Texto:", Value)
    end
})
```

Dropdown (Lista Suspensa)

```lua
local dropdown = Tab:AddDropdown({
    Name = "Nome do Dropdown",
    Description = "Descrição",
    Options = {"Opção 1", "Opção 2"},
    Default = "Opção 1",
    Flag = "minhaFlag",
    Save = true,
    Callback = function(Value)
        print("Selecionado:", Value)
    end
})
-- Para atualizar opções:
dropdown:Refresh({"Novo 1", "Novo 2"}, true)
dropdown:Set("Novo 1")
```

Bind (Atalho de Teclado)

```lua
local bind = Tab:AddBind({
    Name = "Atalho",
    Default = Enum.KeyCode.F,
    Hold = false,
    Flag = "minhaFlag",
    Save = true,
    Callback = function(Value)
        print("Tecla pressionada!")
    end
})
-- Para atualizar:
bind:Set(Enum.KeyCode.G)
```

Colorpicker (Seletor de Cores)

```lua
local colorpicker = Tab:AddColorpicker({
    Name = "Cor do ESP",
    Default = Color3.fromRGB(255, 255, 255),
    Flag = "minhaFlag",
    Save = true,
    Callback = function(Value)
        print("Cor selecionada:", Value)
    end
})
-- Para atualizar:
colorpicker:Set(Color3.fromRGB(255, 0, 0))
```

Button (Botão)

```lua
local button = Tab:AddButton({
    Name = "Nome do Botão",
    Description = "Descrição",
    Icon = "rbxassetid://3944703587",
    Callback = function()
        print("Botão clicado!")
    end
})
-- Para atualizar texto:
button:Set("Novo texto")
```

Paragraph (Parágrafo)

```lua
local paragraph = Tab:AddParagraph({
    Name = "Título",
    Content = "Conteúdo do parágrafo"
})
-- Para atualizar:
paragraph:Set("Novo conteúdo")
```

Section (Seção)

```lua
local section = Tab:AddSection({
    Name = "Minha Seção"
})
-- Adicionar elementos dentro da seção
section:AddToggle({
    Name = "Toggle dentro da seção",
    Callback = function(Value) end
})
```

---

📁 Sistema de Configurações

Salvamento Automático

As configurações são salvas automaticamente quando:

· Um toggle é alterado
· Um slider é alterado
· Um dropdown é alterado
· Um bind é alterado
· Um colorpicker é alterado

Pasta de Configurações

```
GrokLib/Configs/NomePasta/[ID do Jogo].txt
```

Carregamento Automático

As configurações são carregadas automaticamente ao iniciar o script.

---

🎯 Estrutura Padrão de Código

Exemplo 1: Auto Farm

```lua
-- Carregar GrokLib
local GrokLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGrok/GrokLib/refs/heads/main/GrokLib.lua"))()

-- Criar janela principal
local Window = GrokLib:MakeWindow({
    Name = "Nome do Script",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "NomePasta"
})

-- Aba Principal
local Tab = Window:MakeTab({
    Name = "Principal",
    Icon = "6026568198"
})

-- Variáveis de controle
local farmEnabled = false
local farmCoroutine = nil
local farmStatusLabel = nil

-- Cria label de status
local function CreateFarmStatusLabel()
    if not farmStatusLabel then
        farmStatusLabel = Tab:AddLabel("Auto Farm - Desativado")
    end
    return farmStatusLabel
end

-- Função para atualizar status
local function UpdateFarmStatus(text)
    if farmStatusLabel then
        farmStatusLabel:Set(text)
    end
end

-- Loop principal do farm
local function FarmLoop()
    while farmEnabled do
        -- Seu código do farm aqui
        task.wait(0.5)
    end
end

-- Função para iniciar
local function StartAutoFarm()
    if farmEnabled then return end
    farmEnabled = true
    CreateFarmStatusLabel()
    UpdateFarmStatus("Auto Farm - Ativo")
    farmCoroutine = coroutine.create(FarmLoop)
    coroutine.resume(farmCoroutine)

    GrokLib:MakeNotification({
        Name = "Auto Farm",
        Content = "Farm iniciado!",
        Time = 2
    })
end

-- Função para parar
local function StopAutoFarm()
    farmEnabled = false
    if farmCoroutine then
        farmCoroutine = nil
    end
    UpdateFarmStatus("Auto Farm - Desativado")

    GrokLib:MakeNotification({
        Name = "Auto Farm",
        Content = "Farm parado!",
        Time = 2
    })
end

-- Toggle na aba
Tab:AddToggle({
    Name = "Auto Farm",
    Description = "Descrição do que faz",
    Default = false,
    Callback = function(Value)
        if Value then
            StartAutoFarm()
        else
            StopAutoFarm()
        end
    end
})
```

Exemplo 2: ESP Health

```lua
-- Aba ESP
local EspTab = Window:MakeTab({
    Name = "ESP",
    Icon = "107996964878602"
})

-- Variáveis de controle
local espHealthEnabled = false
local espHealthColor = Color3.fromRGB(0, 255, 0)
local espHealthTextSize = 14
local espObjects = {}

-- Lista de cores disponíveis
local colorList = {
    "Verde", "Vermelho", "Azul", "Amarelo",
    "Roxo", "Ciano", "Laranja", "Rosa",
    "Branco", "Preto"
}

-- Função para converter nome para cor
local function getColorFromName(name)
    local colors = {
        Verde = Color3.fromRGB(0, 255, 0),
        Vermelho = Color3.fromRGB(255, 0, 0),
        Azul = Color3.fromRGB(0, 0, 255),
        Amarelo = Color3.fromRGB(255, 255, 0),
        Roxo = Color3.fromRGB(128, 0, 255),
        Ciano = Color3.fromRGB(0, 255, 255),
        Laranja = Color3.fromRGB(255, 128, 0),
        Rosa = Color3.fromRGB(255, 0, 255),
        Branco = Color3.fromRGB(255, 255, 255),
        Preto = Color3.fromRGB(0, 0, 0)
    }
    return colors[name] or Color3.fromRGB(255, 255, 255)
}

-- Função para atualizar ESP Health
local function updateESPHealth()
    local lp = game.Players.LocalPlayer
    if not lp or not lp.Character then return end
    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    for plr, esp in pairs(espObjects) do
        if not plr or not plr.Parent or not plr.Character or not plr.Character:FindFirstChild("Head") then
            if esp and esp.Parent then esp:Destroy() end
            espObjects[plr] = nil
        end
    end

    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Head") then
            local head = plr.Character.Head
            local esp = espObjects[plr]
            
            local humanoid = plr.Character:FindFirstChild("Humanoid")
            local health = humanoid and humanoid.Health or 0
            local maxHealth = humanoid and humanoid.MaxHealth or 100
            local healthPercent = math.floor((health / maxHealth) * 100)
            
            local healthColor = Color3.fromRGB(0, 255, 0)
            if healthPercent <= 25 then
                healthColor = Color3.fromRGB(255, 0, 0)
            elseif healthPercent <= 50 then
                healthColor = Color3.fromRGB(255, 165, 0)
            end

            if not esp or not esp.Parent then
                esp = Instance.new("BillboardGui")
                esp.Name = "HealthESP"
                esp.Adornee = head
                esp.Size = UDim2.new(0, 150, 0, 50)
                esp.AlwaysOnTop = true
                esp.StudsOffset = Vector3.new(0, 2.5, 0)
                esp.Parent = head

                local label = Instance.new("TextLabel")
                label.Name = "Label"
                label.Parent = esp
                label.Size = UDim2.new(1, 0, 0, 20)
                label.BackgroundTransparency = 1
                label.TextStrokeTransparency = 0.3
                label.Font = Enum.Font.SourceSansBold
                label.TextColor3 = espHealthColor
                label.TextSize = espHealthTextSize
                label.Text = plr.Name

                local healthBarBg = Instance.new("Frame")
                healthBarBg.Name = "HealthBarBg"
                healthBarBg.Parent = esp
                healthBarBg.Size = UDim2.new(0.8, 0, 0, 6)
                healthBarBg.Position = UDim2.new(0.1, 0, 0, 22)
                healthBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                healthBarBg.BorderSizePixel = 0

                local healthBarBgCorner = Instance.new("UICorner")
                healthBarBgCorner.Parent = healthBarBg
                healthBarBgCorner.CornerRadius = UDim.new(1, 0)

                local healthBar = Instance.new("Frame")
                healthBar.Name = "HealthBar"
                healthBar.Parent = healthBarBg
                healthBar.Size = UDim2.new(1, 0, 1, 0)
                healthBar.BackgroundColor3 = healthColor
                healthBar.BorderSizePixel = 0

                local healthBarCorner = Instance.new("UICorner")
                healthBarCorner.Parent = healthBar
                healthBarCorner.CornerRadius = UDim.new(1, 0)

                local healthText = Instance.new("TextLabel")
                healthText.Name = "HealthText"
                healthText.Parent = esp
                healthText.Size = UDim2.new(1, 0, 0, 14)
                healthText.Position = UDim2.new(0, 0, 0, 30)
                healthText.BackgroundTransparency = 1
                healthText.TextStrokeTransparency = 0.3
                healthText.Font = Enum.Font.SourceSans
                healthText.TextColor3 = Color3.fromRGB(255, 255, 255)
                healthText.TextSize = 12
                healthText.Text = healthPercent .. "%"

                espObjects[plr] = esp
            else
                local label = esp:FindFirstChild("Label")
                if label then
                    local dist = math.floor((root.Position - head.Position).Magnitude + 0.5)
                    label.Text = plr.Name .. " | " .. dist .. "m"
                    label.TextColor3 = espHealthColor
                    label.TextSize = espHealthTextSize
                end

                local healthBar = esp:FindFirstChild("HealthBarBg")
                if healthBar then
                    local bar = healthBar:FindFirstChild("HealthBar")
                    if bar then
                        bar.Size = UDim2.new(healthPercent / 100, 0, 1, 0)
                        bar.BackgroundColor3 = healthColor
                    end
                end

                local healthText = esp:FindFirstChild("HealthText")
                if healthText then
                    healthText.Text = healthPercent .. "%"
                end
            end
        end
    end
end

-- Função para ligar/desligar ESP
local function toggleESPHealth(value)
    espHealthEnabled = value
    if espHealthEnabled then
        for _, esp in pairs(espObjects) do
            if esp and esp.Parent then esp:Destroy() end
        end
        espObjects = {}
        renderConn = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(updateESPHealth)
        end)
    else
        if renderConn then
            renderConn:Disconnect()
            renderConn = nil
        end
        for _, esp in pairs(espObjects) do
            if esp and esp.Parent then esp:Destroy() end
        end
        espObjects = {}
    end
end

-- Limpar ESP quando jogador sair
game:GetService("Players").PlayerRemoving:Connect(function(plr)
    if espObjects[plr] then
        local esp = espObjects[plr]
        if esp and esp.Parent then esp:Destroy() end
        espObjects[plr] = nil
    end
end)

-- Toggle ESP
EspTab:AddToggle({
    Name = "Ativar ESP Health",
    Description = "Mostra nome, distância e barra de vida dos jogadores",
    Default = false,
    Callback = function(Value)
        toggleESPHealth(Value)
    end
})

-- Dropdown para cor
EspTab:AddDropdown({
    Name = "Cor do ESP",
    Description = "Selecione a cor do texto",
    Options = colorList,
    Default = "Verde",
    Callback = function(Value)
        espHealthColor = getColorFromName(Value)
        for _, esp in pairs(espObjects) do
            if esp and esp.Parent then
                local label = esp:FindFirstChild("Label")
                if label then label.TextColor3 = espHealthColor end
            end
        end
    end
})

-- Slider para tamanho do texto
EspTab:AddSlider({
    Name = "Tamanho do Texto",
    Description = "Arraste para escolher o tamanho",
    Min = 8,
    Max = 40,
    Default = 14,
    Increment = 1,
    Callback = function(Value)
        espHealthTextSize = Value
        for _, esp in pairs(espObjects) do
            if esp and esp.Parent then
                local label = esp:FindFirstChild("Label")
                if label then label.TextSize = Value end
            end
        end
    end
})
```

---

🔔 Notificações

```lua
GrokLib:MakeNotification({
    Name = "Título da Notificação",
    Content = "Conteúdo da mensagem",
    Time = 3
})
```

---

🔄 Gerenciamento de Conexões

Conexões com RunService

```lua
local renderConn = nil

local function StartESP()
    renderConn = game:GetService("RunService").RenderStepped:Connect(function()
        pcall(updateESP)
    end)
end

local function StopESP()
    if renderConn then
        renderConn:Disconnect()
        renderConn = nil
    end
end
```

Conexões com Eventos

```lua
local eventConnection = nil

local function ConnectToEvent()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent")
    if remote then
        eventConnection = remote.OnClientEvent:Connect(function(data)
            -- Processar evento
        end)
    end
end

local function DisconnectEvent()
    if eventConnection then
        eventConnection:Disconnect()
        eventConnection = nil
    end
end
```

---

🛠️ Funções Auxiliares Úteis

Formatação de Números

```lua
local function abbreviateNumber(n)
    if n >= 1e9 then return string.format("%.1fB", n/1e9) end
    if n >= 1e6 then return string.format("%.1fM", n/1e6) end
    if n >= 1e3 then return string.format("%.1fK", n/1e3) end
    return tostring(math.floor(n))
end
```

Formatação de Tempo

```lua
local function FormatTime(seconds)
    seconds = math.floor(seconds)
    local hours = math.floor(seconds / 3600)
    local mins = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    return string.format("%02d:%02d:%02d", hours, mins, secs)
end
```

Buscar Elementos na UI

```lua
local function FindUIElement(pattern)
    local Player = game.Players.LocalPlayer
    local gui = Player:FindFirstChild("PlayerGui")
    if not gui then return nil end
    
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Text and obj.Text:find(pattern) then
            return obj
        end
    end
    return nil
end
```

---

✅ Checklist para Novas Funcionalidades

· Criar variáveis de controle (enabled, task, statusLabel)
· Criar função CreateStatusLabel() se necessário
· Criar função UpdateStatus() para atualizar labels
· Criar função de loop com while enabled do
· Criar função Start() que inicia o loop
· Criar função Stop() que para o loop
· Adicionar Toggle na aba com callback
· Adicionar notificações de feedback
· Tratar erros com pcall()
· Limpar recursos ao desativar (task.cancel, Disconnect)

---

⚠️ Boas Práticas

1. Controle de Tarefas

```lua
-- SEMPRE guardar referência para cancelar
local minhaTask = nil

-- Iniciar
minhaTask = task.spawn(function()
    while condicao do
        -- código
        task.wait()
    end
end)

-- Cancelar
if minhaTask then
    task.cancel(minhaTask)
    minhaTask = nil
end
```

2. Tratamento de Erros

```lua
-- Usar pcall para evitar crashes
local success, err = pcall(function()
    -- Código perigoso
    remote:FireServer()
end)

if not success then
    warn("Erro:", err)
    GrokLib:MakeNotification({
        Name = "Erro",
        Content = "Ocorreu um erro: " .. tostring(err),
        Time = 3
    })
end
```

3. Verificação de Existência

```lua
-- Sempre verificar se objetos existem
local player = game.Players.LocalPlayer
if player and player.Character then
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if root then
        -- Usar root
    end
end
```

4. Limpeza de Recursos

```lua
-- Ao desativar uma função, sempre limpar:
local function StopFuncao()
    funcaoAtiva = false
    if taskCoroutine then
        task.cancel(taskCoroutine)
        taskCoroutine = nil
    end
    if connection then
        connection:Disconnect()
        connection = nil
    end
end
```

---

📝 Como Funcionará a Criação de Scripts

Quando você me enviar o link do repositório com este README.md e pedir para criar um script, eu:

1. Analisarei a estrutura do README para entender o padrão
2. Criarei o código completo seguindo o formato:

```lua
-- Carregar GrokLib
local GrokLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidGrok/GrokLib/refs/heads/main/GrokLib.lua"))()

-- Criar janela principal
local Window = GrokLib:MakeWindow({
    Name = "Nome do Script",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "NomePasta"
})

-- Aba Principal
local Tab = Window:MakeTab({
    Name = "Principal",
    Icon = "6026568198"
})
```

3. Utilizarei os mesmos padrões de:
   · Nomenclatura de variáveis
   · Comentários (apenas com --)
   · Organização do código
   · Estrutura de funções (Start, Stop, Loop)
4. Incluirei todos os elementos solicitados com:
   · Toggles com status labels
   · Sliders com textboxes sincronizados
   · Dropdowns com opções
   · Botões com ações
   · Notificações de feedback
5. Adicionarei tratamento de erros e limpeza de recursos

---

Exemplo de como você pode pedir:

"Me faça um script com Auto Farm, Auto Buy, ESP, Teleport, Auto Collect" - Eu criarei o script completo com todas essas funções

"Crie uma aba de Teleport com Dropdown de jogadores e botão de teleport" - Eu criarei apenas essa aba com a funcionalidade específica

"Adicione uma função de Auto Farm no meu script" - Eu adicionarei a função no script existente

---

Este README serve como guia completo para manter a consistência e organização dos scripts utilizando a GrokLib.
