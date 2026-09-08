local getScript = (request or http_request or syn and syn.request)

if getScript then
    local response = getScript({
        Url = "https://raw.githubusercontent.com/KimDawude/MinuHub/main/MinuHub",
        Method = "GET"
    })
    loadstring(response.Body)()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KimDawude/MinuHub/main/MinuHub", true))()
end