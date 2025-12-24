local analyzer = require("analyzer")

local function detectUnicodeSupport()
    local isWindows = package.config:sub(1, 1) == "\\"

    if os.getenv("FORCE_ASCII") == "1" then
        return false
    end

    if os.getenv("FORCE_UNICODE") == "1" then
        if isWindows then
            os.execute("chcp 65001 > nul")
        end
        return true
    end

    if not isWindows then
        return true
    end

    local modernTerminal =
        os.getenv("WT_SESSION") or
        os.getenv("WT_PROFILE_ID") or
        os.getenv("TERM_PROGRAM") or
        os.getenv("ConEmuANSI") or
        os.getenv("ANSICON")

    if modernTerminal then
        os.execute("chcp 65001 > nul")
        return true
    end

    return false
end

local supportsUnicode = detectUnicodeSupport()

local glyphs
if supportsUnicode then
    glyphs = {
        bannerTop = "╔══════════════════════════════════════════════════════╗",
        bannerMid = "║                TEXT ANALYZER TERMINAL                ║",
        bannerBottom = "╚══════════════════════════════════════════════════════╝",
        dividerChar = "─",
        prompt = "✎ ",
        bar = "█"
    }
else
    glyphs = {
        bannerTop = "+==============================================================+",
        bannerMid = "|                TEXT ANALYZER TERMINAL                        |",
        bannerBottom = "+==============================================================+",
        dividerChar = "-",
        prompt = "> ",
        bar = "#"
    }
end

local colors = {
    reset = "\27[0m",
    accent = "\27[38;2;140;30;255m",
    dim = "\27[38;2;110;100;135m",
    bright = "\27[38;2;35;25;66m",
    highlight = "\27[38;2;255;145;77m",
    warn = "\27[38;2;220;68;88m"
}

local function colorize(text, tint)
    if not tint then
        return text
    end
    return tint .. text .. colors.reset
end

local function divider(char, tint)
    char = char or glyphs.dividerChar
    print(colorize(string.rep(char, 62), tint or colors.dim))
end

local function printBanner()
    print()
    print(colorize(glyphs.bannerTop, colors.accent))
    print(colorize(glyphs.bannerMid, colors.accent))
    print(colorize(glyphs.bannerBottom, colors.accent))
    print(colorize("Tips: Enter kosong selesai input, /keluar untuk mengakhiri program.", colors.dim))
    divider()
end

local function readUserText()
    local lines = {}

    while true do
        io.write(colorize(glyphs.prompt, colors.highlight))
        local line = io.read("*l")

        if not line then
            break
        end

        if line == "/keluar" or line == "/exit" then
            return ""
        end

        if line == "" then
            if #lines > 0 then
                break
            end
            print(colorize("Masukkan minimal satu baris teks dulu.", colors.warn))
        else
            table.insert(lines, line)
        end
    end

    return table.concat(lines, "\n")
end

local function renderRow(label, value)
    local formattedLabel = colorize(string.format("%-24s", label), colors.dim)
    local formattedValue = colorize(value, colors.bright)
    print(string.format("%s %s", formattedLabel, formattedValue))
end

local function renderTopWords(topWords)
    if #topWords == 0 then
        print(colorize("  (Tidak ada kata yang bisa ditampilkan)", colors.dim))
        return
    end

    local maxCount = topWords[1].count

    for _, wordData in ipairs(topWords) do
        local ratio = wordData.count / maxCount
        local bar = string.rep(glyphs.bar, math.max(1, math.floor(ratio * 20 + 0.5)))
        local label = string.format("%-15s", wordData.word)
        local count = string.format("(%dx)", wordData.count)

        print(string.format(
            "  %s %s %s",
            colorize(label, colors.bright),
            colorize(bar, colors.accent),
            colorize(count, colors.dim)
        ))
    end
end

local function renderStats(stats)
    divider()
    print(colorize("Ringkasan Statistik", colors.accent))
    divider()

    renderRow("Jumlah karakter", stats.charCount)
    renderRow("Karakter tanpa spasi", stats.charCountNoSpace)
    renderRow("Jumlah kata", stats.wordCount)
    renderRow("Jumlah kata unik", stats.uniqueWordCount)
    renderRow(
        "Rata-rata panjang kata",
        stats.wordCount > 0 and string.format("%.2f", stats.averageWordLength) or "-"
    )
    renderRow("Kata terpanjang", stats.longestWord ~= "" and stats.longestWord or "-")
    renderRow("Kata terpendek", stats.shortestWord ~= "" and stats.shortestWord or "-")

    divider()
    print(colorize("Top kata yang sering muncul", colors.accent))
    renderTopWords(stats.topWords)
    divider()
end

local function run()
    while true do
        printBanner()
        local text = readUserText()

        if text == "" then
            print(colorize("\nSampai jumpa!", colors.dim))
            break
        end

        local stats = analyzer.analyze(text)
        renderStats(stats)

        io.write(colorize("\nAnalisis lagi? (y/n): ", colors.highlight))
        local answer = io.read("*l")

        if not answer or answer:lower() ~= "y" then
            print(colorize("\nTerima kasih sudah mencoba Text Analyzer!", colors.accent))
            break
        end

        print()
    end
end

run()
