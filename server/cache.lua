local cache = {}

local function clientIsInUse(source)
    if cache[source] then
        return true
    end
end

local function add(source, questions, type)
    if clientIsInUse(source) then
        return
    end

    cache[source] = {
        questions = questions,
        type = type
    }
end

local function remove(source)
    cache[source] = nil
end

local function get(source)
    return cache[source]
end

Cache = {
    Add = add,
    Remove = remove,
    Get = get,
    ClientIsInUse = clientIsInUse
}