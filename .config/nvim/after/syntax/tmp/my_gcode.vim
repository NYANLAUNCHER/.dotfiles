if exists("b:current_syntax")
    finish
endif
syn case ignore

" Features:
" G0, T, H, D, F, Z = red
" X, Y, & named/numbered parameters = cyan
" GCodes = orange
" MCodes = yellow
" operators, functions, and loops = red
" numbers = magenta
" '=', '+', '/', '*', '**' = white
" O, N, '#', '[', ']', '%', '< >', ';', & '(*)' = grey


" Syntax
syntax match gcFileBlock /^%$/
syntax match gcProgramID /\(o[0-9][0-9]*\|:[0-9][0-9]*\)/
syntax match gcConstant /\(\-\=[.0-9]*\)/
syntax keyword gcConditional if else endif
syntax keyword gcOperator EQ NE GT GE LT LE ABS ACOS ASIN ATAN COS EXP FIX FUP LN ROUND SIN SQRT TAN MOD AND OR
syntax keyword gcFunction sub endsub call return
syntax keyword gcLoop do do1 do2 do3 while endwhile break continue end end1 end2 end3 goto
syntax match gcOperatorPunc "[%\-+*/\[\]]"
syntax match gcParameter /#<*[A-Z_0-9]*>*/
syntax match gcComment /([^)]*)/
syntax match gcEOB /\(;\)/

syntax match gcGCodes /\s*\(g[0-9][0-9]*\)/
syntax match gcGCodesAlt /\s*\(g[0-9][0-9]*\.[0-9]\)/
syntax match gcMCodes /\s*\(m[0-9][0-9]*\)/

syntax match gcXAxis /\s*\([xui] *[-+#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier
syntax match gcYAxis /\s*\([yvj] *[-+#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier
syntax match gcZAxis /\s*\([zwk] *[-+#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier
syntax match gcFeed /\s*\([f] *[#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier

syntax match gcMessage /(\s*MSG\s*,.*)/ contains=gcIdentifier
syntax match gcLogOpen /(\s*LOGOPEN\s*,.*)/
syntax match gcLogClose /(\s*LOGCLOSE\s*)/
syntax match gcLog /(\s*LOG\s*,.*)/ contains=gcIdentifier
syntax match gcPrint /(\s*PRINT\s*,.*)/ contains=gcIdentifier
syntax match gcDebug /(\s*DEBUG\s*,.*)/ contains=gcIdentifier
syntax match gcLineNumber /\(n[0-9][0-9]*\)/


" Highlighting


