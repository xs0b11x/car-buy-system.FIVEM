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