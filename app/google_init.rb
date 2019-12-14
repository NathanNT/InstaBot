def google_sheet_init
u = ENV['GOOGLE_CONFIG']
io = StringIO.new(u)
session = GoogleDrive::Session.from_service_account_key(io)
ws = session.spreadsheet_by_key(ENV['GOOGLE_SHEET']).worksheets[0]
return ws
end

