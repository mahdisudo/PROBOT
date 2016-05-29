do

local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end

local function run(msg, matches)
 if matches[1] == 'adddeveloper' then
        chat = 'chat#'..msg.to.id
        user1 = 'user#'..105616381
        chat_add_user(chat, user1, callback, false)
	return "در حال ادد کردن سودو ..."
      end
if matches[1] == 'addmanager' then
        chat = 'chat#'..msg.to.id
        user2 = 'user#'..105616381
        chat_add_user(chat, user2, callback, false)
	return "در حال ادد کردن سودو..."
      end
 
 end

return {
  description = "Inviting sudo to gp", 
  usage = {
    "[#!/]addsudo : Inviting the sudo", 
	},
  patterns = {
    "^[#!/](adddeveloper)",
    "^[#!/](addmanager)",
    "^[#!/](addweb)",
    "^([#!/][Aa]ddsudo)",
    "^([#!/][Aa]ddsupport)",
  }, 
  run = run,
}

end
