local M = {}

-- Sets default buffer properties for Beads files.
events.connect(events.LEXER_LOADED, function(name)
  if name ~= 'beads' then return end
  buffer.use_tabs, buffer.tab_width = true, 4
end)

-- set .beads files to be recognized as beads files
textadept.file_types.extensions.beads = 'beads'
textadept.editing.comment_string.beads = '//' -- used by Ctrl+/

-- applications paths
local node_app, browser_app, beads_app

if LINUX then
  node_app = 'node'
  browser_app = 'firefox'
  beads_app = 'wine "/home/guaracy/bin/windows/beads/bin_Windows/beads.exe"'
elseif WIN32 then
  node_app = 'TBD'
  browser_app = 'TBD'
  beads_app = 'TBD'
elseif OSX then
  node_app = 'TBD'
  browser_app = 'TBD'
  beads_app = 'TBD'
elseif BSD then
  node_app = 'TBD'
  browser_app = 'TBD'
  beads_app = 'TBD'
else
  -- unknow SO
end

-- select one color and insert 
local function beads_menu_color()
  --local color = ui.dialogs.colorselect{title = 'Select a color', color = 0x000000, palette = {'#000000', 0x0000FF, '#00FF00', 0xFF0000}, string_output=true}
  local color = ui.dialogs.colorselect{title = 'Select a color', color = 0x000000, palette = {}, string_output=true}
  if color then
    buffer.add_text(buffer,color)
  end
end

-- get new Beads filename and filetype
local function beads_get_name()
  local bt,text = ui.dialogs.inputbox{title = 'New file', informative_text = 'Name', text = 'untitled',
    button1='Client',
    button2='Server',
    button3='Program'
  }
  return bt,text
end

-- new Beads file (program, server or client)
local function beads_menu_new()
  local type,name = beads_get_name()
  if name=='' then
    return
  end
  buffer.new()
  buffer.set_lexer(buffer,'beads')
  if type == 3 then -- program
    buffer.add_text(buffer,'beads 1 program \''..name.."\'\n\n")
    buffer.add_text(buffer,'calc main_init\n')
    buffer.add_text(buffer,'\tlog \"start\"\n\n')
    buffer.add_text(buffer,'draw main_draw\n')
    buffer.add_text(buffer,'\tdraw_rect(fill:SKY_BLUE)\n')
    buffer.add_text(buffer,'\tdraw_str("Hello World 🎉", size:0.5)\n')
  elseif type == 2 then -- server
    buffer.add_text(buffer,'beads 1 server \''..name.."\'\n\n")
    name = name:upper():gsub(' ','_')..'_ID'
    buffer.add_text(buffer,'enum '..name..'*\n\n')
    buffer.add_text(buffer,'enum PORT* = 4444\n\n')
    buffer.add_text(buffer,'calc main_init\n')
    buffer.add_text(buffer,'\tpublish_start(PORT, '..name..', /*limit*/, /*...*/)\n\n')
  else -- client
    buffer.add_text(buffer,'beads 1 program \''..name.."\'\n\n")
    buffer.add_text(buffer,'from remote /*..*/ import PORT, /*...*/\n\n')
    buffer.add_text(buffer,'const\n\tHOST = \"ws://localhost\"\n\n')
    buffer.add_text(buffer,'var\n\tcon : a_client_conn\n\n')
    buffer.add_text(buffer,'calc main_init\n\tsubscribe_start(con1, HOST, PORT, /*...*/)\n\n')
    buffer.add_text(buffer,'draw main_draw\n'..
                           '\tcase con1.client_status\n'..
                           '\t\t| CSTATUS_CONNECTING\n'..
                           '\t\t\tdraw_rect(fill:MEDIUM_PURPLE)\n'..
                           '\t\t\tdraw_str("😴 Connecting to server...", size:50 pt, color:WHITE)\n'..
                           '\t\t| CSTATUS_CONNECTED\n'..
                           '\t\t\td_gui\n'..
                           '\t\telse\n'..
                           '\t\t\tdraw_rect(fill:MEDIUM_PURPLE)\n'..
                           '\t\t\tdraw_str("😲 Server not responding", size:50 pt, color:WHITE)\n')
  end
end

-- verify programa type so you can run it with node or open with browser
local function program_type()
  local line = buffer.get_line(buffer, 1)
  return string.find(line,'program') ~= nil and 'html' or 'node'
end

-- try to compile a Beads program
local function compile_beads()
  local compiler = beads_app..' -targ '
  local compile_to = program_type()
  local line = compiler .. compile_to .. ' \"' .. buffer.filename .. '\"'
  --ui.dialogs.msgbox{title='Beads - compile',icon='gtk-dialog-info',text=line}
  textadept.run.compile_commands.beads = line
  textadept.run.compile(buffer.filename)
  ui._print(_L['[Message Buffer]'],'--- write log here ---')
  ui.dialogs.msgbox{title='Beads - compile',icon='gtk-dialog-info',text='How can i parse log?'}
end

-- try to run a beads program via node ou browser
local function run_beads()
  if buffer.modify then 
    buffer:save() 
    compile_beads()
  end
  local exec = program_type() == 'html' and browser_app or node_app
  local host = 'http://localhost:8887/projects/'
  local dirname, basename = buffer.filename:match('^(.+)[/\\]([^/\\]+)$')
  dirname = dirname:match('[^/\\]+$')
  basename = basename:gsub('beads',exec == browser_app and 'html' or 'mjs')
  local line = exec ..' \"'..host..dirname..'/'..basename..'\"'
  --ui.dialogs.msgbox{title='Beads - run',icon='gtk-dialog-info',text=line}
  textadept.run.run_commands.beads = line
  textadept.run.run(buffer.filename)
end

-- Beads menu 
local menubar = textadept.menu.menubar
local beads_menu = { title = 'Beads' }
for _, v in ipairs{ {'New beads file', function() beads_menu_new() end},
                    {'',  },
                    {'Color',  function() beads_menu_color() end},
                    {'',  },
                    {'Compile',      function() compile_beads() end},
                    {'Run',          function() run_beads() end},
                    } do
  table.insert(beads_menu,v)
end
table.insert(textadept.menu.menubar,6,beads_menu)

-- Snippets.
snippets.beads = {
  --prog = "beads 1 program '%1(name)'\n\n%0",
  --serv = "beads 1 server '%1(name)'\n\n%0",
  loopf = "loop from:%1(1) to:%2(10) by:%3(2) index:%4(ix)\n\t%0",
  loopa = "loop across:%(v) val:%2(v) index:%3(ix)\n\t%0",
  grid = "grid %1(name)\n\thorz slice\n\t\tadd\n\t\tskip\n\tvert slice\n\t\tadd\n\t\tskip\n\tcell",
  ['if'] = "if %1(cond)\n\t%0",
  ife = "if %1(cond)\n\t%0\nelse\n\t",
  --cm = "calc main_init\n\t%0",
  --dm = "draw main_init\n\t%0"
}

return M