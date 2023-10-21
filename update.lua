local username = "vidkol18"
local repo = "ComputerCraftScripts"
function hte()
    if fs.exists(gitget) then --You missed this
        shell.run("gitget", username, repo)
    else
        print("GitGet application does not exist. Downloading...")
        shell.run("pastebin", "get", "W5ZkVYSi", "gitget")
        shell.run("gitget", username, repo)
    end
end

if http then
    print("HTTP enabled. You can continue.")
    hte()
else
    print("HTTP not enabled. App will not continue.")
end
