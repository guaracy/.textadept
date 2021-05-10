-- Copyright 2020 Mitchell. See LICENSE.
-- Beads LPeg lexer.

local lexer = require('lexer')
local token, word_match = lexer.token, lexer.word_match
local P, S = lpeg.P, lpeg.S

local lex = lexer.new('beads', {fold_by_indentation = true})


-- Whitespace.
lex:add_rule('whitespace', token(lexer.WHITESPACE, lexer.space^1))

-- Keywords.
lex:add_rule('keyword', token(lexer.KEYWORD, word_match[[
  -- Calculation and drawing blocks
  calc ditto draw layer horz vert slice scroll add skip grid under cell over
  report rowkind background span  build track
  -- Definitions
  assets const type var family unit record
  -- Flow
  if elif else case loop continue exit return nop log
]]))

-- Types.
lex:add_rule('type', token(lexer.TYPE, word_match[[
  -- Data type
    a_date a_event a_xy a_xyz a_rect a_runtime any array array^2 bits bytes changelist color func 
  image meas num pattern ptr sound str tree video yesno of
  
  -- Block subdivision Units
    al pc pt px
]]))

-- Identifiers.
lex:add_rule('identifier', token(lexer.IDENTIFIER, lexer.word))

-- Strings.
local sq_str = lexer.range("'")
local dq_str = lexer.range('"')
local tq_str = lexer.range("'''")
lex:add_rule('string', token(lexer.STRING, sq_str + dq_str + tq_str))

-- Comments.
local line_comment = lexer.to_eol('//')
local lua_line_comment = lexer.to_eol('--')
local beads_line_comment = lexer.to_eol('====')
local c_block_comment = lexer.range('/*','*/')
local pascal_block_comment = lexer.range('(*','*)')
local meta_comment = lexer.range('`','`')
lex:add_rule('comment', token(lexer.COMMENT, line_comment + lua_line_comment + beads_line_comment + c_block_comment + pascal_block_comment + meta_comment))

-- Colors
local xdigit = lexer.xdigit
lex:add_rule('color', token('color', word_match[[
	ALICE_BLUE ANTIQUE_WHITE AQUA AQUAMARINE AZURE BEIGE BISQUE BLACK BLANCHED_ALMOND
	BLUE BLUE_VIOLET BROWN BURLY_WOOD CADET_BLUE CHARTREUSE CHOCOLATE CORAL
	CORNFLOWER_BLUE CORNSILK CRIMSON CYAN DARK_BLUE DARK_CYAN DARK_GOLDENROD
	DARK_GRAY DARK_GREEN DARK_KHAKI DARK_MAGENTA DARK_OLIVE_GREEN DARK_ORANGE
	DARK_ORCHID DARK_RED DARK_SALMON DARK_SEA_GREEN DARK_SLATE_BLUE DARK_SLATE_GRAY
	DARK_TURQUOISE DARK_VIOLET DEEP_PINK DEEP_SKY_BLUE DIM_GRAY DODGER_BLUE
	FIREBRICK FLORAL_WHITE FOREST_GREEN FUCHSIA GAINSBORO GHOST_WHITE GOLD GOLDENROD
	GRAY GRAY9 GRAY8 GRAY7 GRAY6 GRAY5 GRAY4 GRAY3 GRAY2 GRAY1 
	GREEN GREEN_YELLOW HONEYDEW HOT_PINK INDIAN_RED INDIGO IVORY KHAKI LAVENDER
	LAVENDER_BLUSH LAWN_GREEN LEMON_CHIFFON LIGHT_BLUE LIGHT_CORAL LIGHT_CYAN
	LIGHT_GOLDENROD LIGHT_GREEN LIGHT_GREY LIGHT_PINK LIGHT_SALMON LIGHT_SEA_GREEN
	LIGHT_SKY_BLUE LIGHT_SLATE_GRAY LIGHT_STEEL_BLUE LIGHT_YELLOW LIME LIME_GREEN
	LINEN MAGENTA MAROON MEDIUM_AQUAMARINE MEDIUM_BLUE MEDIUM_ORCHID MEDIUM_PURPLE
	MEDIUM_SEA_GREEN MEDIUM_SLATE_BLUE MEDIUM_SPRING_GREEN MEDIUM_TURQUOISE
	MEDIUM_VIOLET_RED MIDNIGHT_BLUE MINT_CREAM MISTY_ROSE MOCCASIN NAVAJO_WHITE
	NAVY OLD_LACE OLIVE OLIVE_DRAB ORANGE ORANGE_RED ORCHID PALE_GOLDENROD
	PALE_GREEN PALE_TURQUOISE PALE_VIOLET_RED PAPAYA_WHIP PEACH_PUFF PERU PINK
	PLUM POWDER_BLUE PURPLE REBECCA_PURPLE RED ROSY_BROWN ROYAL_BLUE SADDLE_BROWN
	SALMON SANDY_BROWN SEA_GREEN SEASHELL SIENNA SILVER SKY_BLUE SLATE_BLUE
	SLATE_GRAY SNOW SPRING_GREEN STEEL_BLUE TAN TEAL THISTLE TOMATO TURQUOISE
	VIOLET WHEAT WHITE WHITE_SMOKE YELLOW YELLOW_GREEN
]] + '#' * xdigit * xdigit * xdigit * (xdigit * xdigit * xdigit)^-1))
lex:add_style('color', lexer.styles.number)

-- Numbers.
lex:add_rule('number', token(lexer.NUMBER, lexer.number))

-- Operators.
lex:add_rule('operator', token(lexer.OPERATOR, S('+-*/%^=<>,.{}[]()')))

-- Fields
lex:add_rule('fields',token(lexer.IDENTIFIER, lexer.word * ':'))
lex:add_style('fields', lexer.styles.number)

return lex
