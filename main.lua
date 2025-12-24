print("text analyzer")
io.write("masukkan teks: ")

local text = io.read("*l")

-- jumlah karakter
local charCount = #text

-- jumlah kata
local wordCount = 0
local longestWord = ""

for word in string.gmatch(text, "%S+") do
    wordCount = wordCount + 1

    if #word > #longestWord then
        longestWord = word
    end
end

print("\nhasil")
print("jumlah karakter :", charCount)
print("jumlah kata     :", wordCount)
print("kata terpanjang :", longestWord)
