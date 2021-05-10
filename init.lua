  if WIN32 then
		theme = 'light'
		theme_props = {font = 'Consolas', size = 12}
	elseif LINUX then
		--theme = 'base16-spacemacs'
		--theme = 'base16-bright'
		--theme = 'base16-ia-dark'
		 --theme = 'base16-tube'
		--theme = 'base16-dune-light'

		
		--theme='base16-atelier-estuary' -- dark ok ok
		theme='base16-ashes' -- dark ok ok
		--theme='base16-atelier-savanna' -- dark ok ok
		--theme='base16-atlas' -- dark ok ok
		--theme='base16-greenscreen' -- dark mono ok
		--theme='base16-cupertino' -- light ok
		--theme='base16-atelier-forest' -- dark ok ok 
		--theme='base16-atelier-sulphurpool' -- dark ok ok ok

		
		--theme='base16-3024'
		--theme='base16-apathy'
		--theme='base16-atelier-cave-light'
		--theme='base16-atelier-cave'
		--theme='base16-atelier-dune-light'
		--theme='base16-atelier-dune' -- dark ok
		--theme='base16-atelier-estuary-light'
		--theme='base16-atelier-forest-light'
		--theme='base16-atelier-heath-light'
		--theme='base16-atelier-heath' -- dark ok
		--theme='base16-atelier-lakeside-light'
		--theme='base16-atelier-lakeside'
		--theme='base16-atelier-plateau-light'
		--theme='base16-atelier-plateau'
		--theme='base16-atelier-savanna-light'
		--theme='base16-atelier-seaside-light'
		--theme='base16-atelier-seaside'
		--theme='base16-atelier-sulphurpool-light'
		--theme='base16-bespin' -- dark ok
		--theme='base16-brewer' -- dark ok
		--theme='base16-bright' -- dark ok
		--theme='base16-brogrammer'
		--theme='base16-brushtrees-dark' -- dark ok
		--theme='base16-brushtrees'
		--theme='base16-chalk'
		--theme='base16-circus' -- dark ok
		--theme='base16-classic-dark'
		--theme='base16-classic-light'
		--theme='base16-codeschool'
		--theme='base16-cupcake'
		--theme='base16-darkmoss' -- dark ok
		--theme='base16-darktooth' -- dak ok
		--theme='base16-darkviolet'
		--theme='base16-decaf' -- dark ok
		--theme='base16-default-dark'
		--theme='base16-default-light'
		--theme='base16-dirtysea' -- light ok
		--theme='base16-dracula'
		--theme='base16-edge-dark'
		--theme='base16-edge-light'
		--theme='base16-eighties' -- dark ok
		--theme='base16-embers'
		--theme='base16-equilibrium-dark' -- dark ok
		--theme='base16-equilibrium-gray-dark' --dak ok
		--theme='base16-equilibrium-gray-light'
		--theme='base16-equilibrium-light' --light ok
		--theme='base16-espresso' -- dark ok
		--theme='base16-eva-dim' --dark ok
		--theme='base16-eva' -- dak ok
		--theme='base16-flat' -- dark ok ok
		--theme='base16-framer'
		--theme='base16-fruit-soda'
		--theme='base16-gigavolt'
		--theme='base16-github' -- light ok
		--theme='base16-google-dark' -- dark ok
		--theme='base16-google-light' -- light ok
		--theme='base16-grayscale-dark'
		--theme='base16-grayscale-light'
		--theme='base16-gruvbox-dark-hard' -- dark ok
		--theme='base16-gruvbox-dark-medium' -- dark ok
		--theme='base16-gruvbox-dark-pale' -- dark ok
		--theme='base16-gruvbox-dark-soft' -- dark ok
		--theme='base16-gruvbox-light-hard' -- light ok
		--theme='base16-gruvbox-light-medium'
		--theme='base16-gruvbox-light-soft' -- light ok
		--theme='base16-hardcore'
		--theme='base16-harmonic-dark' -- dark ok ok
    
		--theme='base16-harmonic-light' -- light ok
		--theme='base16-heetch-light'
		--theme='base16-heetch'
		--theme='base16-helios' -- dark ok
		--theme='base16-hopscotch' -- dark ok
		--theme='base16-horizon-dark'
		--theme='base16-horizon-light'
		--theme='base16-horizon-terminal-dark'
		--theme='base16-horizon-terminal-light'
		--theme='base16-humanoid-dark'
		--theme='base16-humanoid-light'
		--theme='base16-ia-dark' -- dark ok
		--theme='base16-ia-light' -- light ok
		--theme='base16-irblack'
		--theme='base16-isotope'
		--theme='base16-macintosh'
		--theme='base16-marrakesh'
		--theme='base16-material-darker'
		--theme='base16-material-lighter'
		--theme='base16-material'
		--theme='base16-material-palenight'
		--theme='base16-materia'
		--theme='base16-material-vivid'
		--theme='base16-mellow-purple'
		--theme='base16-mexico-light' -- light ok
		--theme='base16-mocha' -- dark ok
		--theme='base16-monokai'
		--theme='base16-nebula'
		--theme='base16-nord'
		--theme='base16-nova' -- dark ok
		--theme='base16-oceanicnext'
		--theme='base16-ocean' -- dark ok ok
		--theme='base16-onedark'
		--theme='base16-one-light' -- light ok
		--theme='base16-outrun-dark'
		--theme='base16-papercolor-dark'
		--theme='base16-papercolor-light'
		--theme='base16-paraiso'
		--theme='base16-pasque'
		--theme='base16-phd' -- dark okok
		--theme='base16-pico'
		--theme='base16-pop'
		--theme='base16-porple'
		--theme='base16-railscasts' -- dark ok
		--theme='base16-rebecca'
		--theme='base16-sandcastle' -- dark ok
		--theme='base16-seti' -- dark ok
		--theme='base16-shapeshifter'
		--theme='base16-snazzy'
		--theme='base16-solarflare' -- dark ok
		--theme='base16-solarized-dark' -- dark ok
		--theme='base16-solarized-light' -- light ok
		--theme='base16-spacemacs' -- dark ok
		--theme='base16-summercamp'
		--theme='base16-summerfruit-dark'
		--theme='base16-summerfruit-light' -- light ok
		--theme='base16-synth-midnight-dark'
		--theme='base16-synth-midnight-light'
		--theme='base16-tango'
		--theme='base16-tomorrow' -- light ok
		--theme='base16-tomorrow-night-eighties'  -- dark ok
		--theme='base16-tomorrow-night' -- dark ok ok ok
		--theme='base16-tube' -- dark ok
		--theme='base16-twilight' -- dark ok
		--theme='base16-unikitty-dark'
		--theme='base16-unikitty-light' -- light ok
		--theme='base16-vulcan' -- dark ok
		--theme='base16-woodland' -- dark ok
		--theme='base16-xcode-dusk'
		--theme='base16-zenburn' -- dark ok
		
		
		theme_props = {font = 'DaddyTimeMono', size = 11}
		-- Unifont , TerminessTTF Nerd Font , Nimbus Mono, Ubuntu Mono, DaddyTimeMono, Comic Shanns
	elseif OSX then
		theme = 'light'
		theme_props = {font = 'Nimbus Mono', size = 10}
end

view:set_theme(theme, theme_props)  



-- Always strip trailing spaces on save
textadept.editing.strip_trailing_space = true
-- Automatically highlight all occurrences of the selected word.
textadept.editing.highlight_words = textadept.editing.HIGHLIGHT_SELECTED

textadept.file_types.extensions.red = 'red'





-- Add menu option for resetting Textadept's Lua state.
local tools = textadept.menu.menubar[_L['Tools']]
table.insert(tools, {''}) -- menu separator
table.insert(tools, {'Reset L_ua State', reset})
keys.f12 = _G.reset

-- Add top/bottom space between linhas
 --buffer.extra_ascent = 2
 --buffer.extra_descent = 2

-- Multiple cursors
buffer.multiple_selection = true
buffer.additional_selection_typing = true
buffer.additional_carets_visible = true

require('export')
require('lua_repl')
require('beads')

--local beads_menu_pos = 6
--local beads_menu = {'Beads', function() end}

-- Deletes the lines spanned by the selection or delete current line if no selection.
keys['ctrl+y'] = function()
  buffer:begin_undo_action()
  if buffer.selection_empty then
    buffer:line_delete()
  else
    local start_line = buffer:line_from_position(buffer.selection_start)
    local end_line = buffer:line_from_position(buffer.selection_end)
    local start_pos = buffer:position_from_line(start_line)
    local end_pos = buffer:position_from_line(end_line + 1)
    buffer:delete_range(start_pos, end_pos - start_pos)
  end
  buffer:end_undo_action()
end

