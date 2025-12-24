local Analyzer = {}

local function normalize(text)
    text = text or ""
    text = text:gsub("\r\n", " \n")
    text = text:gsub("\r", " \n")
    text = text:gsub("%s+", " ")
    return text:gsub("^%s+", ""):gsub("%s+$", "")
end

local function sanitize_word(word)
    word = word:gsub("^[%p]+", "")
    word = word:gsub("[%p]+$", "")
    return word
end

function Analyzer.analyze(text)
    text = text or ""
    local normalized = normalize(text)

    local stats = {
        charCount = #text,
        charCountNoSpace = #text:gsub("%s", ""),
        wordCount = 0,
        uniqueWordCount = 0,
        longestWord = "",
        shortestWord = "",
        averageWordLength = 0,
        topWords = {},
        originalText = text,
        normalizedText = normalized
    }

    local totalLength = 0
    local frequency = {}

    for rawWord in string.gmatch(text, "%S+") do
        local cleaned = sanitize_word(rawWord)
        if cleaned ~= "" then
            local lowered = cleaned:lower()
            frequency[lowered] = frequency[lowered] or {display = cleaned, count = 0}
            frequency[lowered].count = frequency[lowered].count + 1

            stats.wordCount = stats.wordCount + 1
            totalLength = totalLength + #cleaned

            if #cleaned > #stats.longestWord then
                stats.longestWord = cleaned
            end

            if stats.shortestWord == "" or #cleaned < #stats.shortestWord then
                stats.shortestWord = cleaned
            end
        end
    end

    if stats.wordCount > 0 then
        stats.averageWordLength = totalLength / stats.wordCount
    end

    for _, data in pairs(frequency) do
        stats.uniqueWordCount = stats.uniqueWordCount + 1
        table.insert(stats.topWords, { word = data.display, count = data.count })
    end

    table.sort(stats.topWords, function(a, b)
        if a.count == b.count then
            return a.word < b.word
        end
        return a.count > b.count
    end)

    while #stats.topWords > 5 do
        table.remove(stats.topWords)
    end

    return stats
end

return Analyzer
