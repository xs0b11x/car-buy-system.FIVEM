Claro! Aqui está um exemplo básico de um script Lua para FiveM que implementa um sistema simples de compra de carros em uma concessionária:

```lua
local carros = {
    {nome = "Carro 1", preco = 5000},
    {nome = "Carro 2", preco = 8000},
    {nome = "Carro 3", preco = 10000}
}

RegisterNetEvent("comprarCarro")
AddEventHandler("comprarCarro", function(index)
    local source = source
    local user = exports["core"]:getUser(source)
    if user then
        local dinheiroAtual = user:getDinheiro()
        if dinheiroAtual >= carros[index].preco then
            user:removerDinheiro(carros[index].preco)
            TriggerClientEvent("carroComprado", source, carros[index].nome)
        else
            TriggerClientEvent("dinheiroInsuficiente", source)
        end
    end
end)
```

Para usar este script:

1. Crie um novo arquivo Lua, por exemplo, `comprar_carro.lua`.

2. Copie o código acima para o arquivo `comprar_carro.lua`.

3. Defina os carros disponíveis e seus preços na tabela `carros`.

4. Adicione esse arquivo à pasta `resources` do seu servidor FiveM.

5. Adicione `start comprar_carro` ou o nome do seu arquivo Lua ao arquivo `server.cfg` do seu servidor FiveM.

6. Reinicie o servidor para que as alterações entrem em vigor.

Agora, você precisa implementar os eventos do cliente correspondentes (`carroComprado` e `dinheiroInsuficiente`) para fornecer feedback aos jogadores quando eles comprarem um carro ou quando não tiverem dinheiro suficiente.
