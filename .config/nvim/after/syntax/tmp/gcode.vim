" Vim syntax file
" Language: RS274/ngc
" Original Creator: Gary Fixler <gfixler.emc@gmail.com>
" Modifications:
"   Greg Jurman <jurman.greg@gmail.com>
"   Markie Purcell <purcellmarkie@gmail.com>
" Last Change: 2024 Mar 01

if exists("b:current_syntax")
    finish
endif
syn case ignore

" Features:
" G0, T, H, D, F, Z = red
" X, Y, & parameterID = cyan
" GCodes = orange
" MCodes = yellow
" operators, functions, and loops = red
" number constants = magenta
" '[', ']', '=', '+', '/', '*', '**' = white
" O, N, '#', '%', '< >', ';', & '(*)' = grey


" Syntax
syntax match gcFileBlock /^%$/
syntax match gcProgramID /\(o[0-9][0-9]*\|:[0-9][0-9]*\)/
syntax match gcConstant /\(\-\=[.0-9]*\)/
syntax keyword gcConditional if else endif
syntax keyword gcLoop do do1 do2 do3 while endwhile break continue end end1 end2 end3 goto
syntax keyword gcFunction sub endsub call return
syntax keyword gcOperator EQ NE GT GE LT LE ABS ACOS ASIN ATAN COS EXP FIX FUP LN ROUND SIN SQRT TAN MOD AND OR
syntax match gcSymbol "[%\-+*=/\[\]]"
syntax match gcParameterID /#<*[A-Z_0-9]*>*/
syntax match gcParameterPunc /#<**>*/
syntax keyword gcTodo TODO FIXME XXX contained
syntax match gcComment /([^)]*)/ contains=gcTodo
syntax match gcEOB /\(;\)/

syntax match gcMessage /(\s*MSG\s*,.*)/ contains=gcIdentifier
syntax match gcLogOpen /(\s*LOGOPEN\s*,.*)/
syntax match gcLogClose /(\s*LOGCLOSE\s*)/
syntax match gcLog /(\s*LOG\s*,.*)/ contains=gcIdentifier
syntax match gcPrint /(\s*PRINT\s*,.*)/ contains=gcIdentifier
syntax match gcDebug /(\s*DEBUG\s*,.*)/ contains=gcIdentifier
syntax match gcLineNumbers /\(n[0-9][0-9]*\)/

syntax match gcGCodes /\s*\(g[0-9][0-9]*\)/
syntax match gcGCodesAlt /\s*\(g[0-9][0-9]*\.[0-9]\)/
syntax match gcMCodes /\s*\(m[0-9][0-9]*\)/
syntax match gcMCodesAlt /\s*\(m[0-9][0-9]*\.[0-9]\)/

syntax match gcAxes /\s*\([abc][-#]*[0-9.][.]*[0-9]*\)/ contains=gcIdentifier

syntax match gcXAxisScaled /\s*\([xui] *[-+#]\?[0-9][0-9]*\)/ contains=gcIdentifier
syntax match gcYAxisScaled /\s*\([yvj] *[-+#]\?[0-9][0-9]*\)/ contains=gcIdentifier
syntax match gcZAxisScaled /\s*\([zwk] *[-+#]\?[0-9][0-9]*\)/ contains=gcIdentifier
syntax match gcFeedScaled /\s*\(f *#\?[0-9][0-9]*\)/ contains=gcIdentifier

syntax match gcXAxis /\s*\([xui] *[-+#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier
syntax match gcYAxis /\s*\([yvj] *[-+#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier
syntax match gcZAxis /\s*\([zwk] *[-+#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier
syntax match gcFeed /\s*\([f] *[#]\?[0-9]*\.[0-9]*\)/ contains=gcIdentifier

syntax match gcSpecials /\s*\(,[c][#-]*[0-9.][.]*[0-9]*\|[relpqs][-#]*[0-9.][.]*[0-9]*\)\s*/ contains=gcIdentifier
syntax match gcTool /[hdt][0-9][0-9]*/
syntax match gcBlockSkip /^\/.*/


" Highlighting
hi gcFileBlock ctermfg=blue cterm=bold
hi gcProgramID ctermfg=Magenta cterm=bold

hi gcAxes ctermfg=lightgreen

hi gcXAxis ctermfg=darkblue
hi gcYAxis ctermfg=darkblue
hi gcZAxis ctermfg=darkblue
hi link gcFeed SpecialChar

hi gcXAxisScaled ctermfg=darkblue
hi gcYAxisScaled ctermfg=darkblue
hi gcZAxisScaled ctermfg=darkblue
hi link gcFeedScaled SpecialChar

hi gcSpecials ctermfg=brown
hi gcBlockSkip ctermfg=grey cterm=bold

hi link gcTool SpecialChar

hi link gcConstant Constant
hi link gcConditional Conditional
hi link gcRepeat Repeat
hi link gcFunction Function
hi link gcOperator Operator
hi link gcOperatorPunc Operator
hi link gcIdentifier Identifier
hi link gcLabel Label
hi link gcLineNumbers LineNr
hi link gcTodo Todo

hi link gcComment Comment

hi link SpecialComment

hi link gcMessage SpecialComment
hi link gcLogOpen SpecialComment
hi link gcLogClose SpecialComment
hi link gcLog SpecialComment
hi link gcPrint SpecialComment
hi link gcDebug Debug
hi link gcGCodes Keyword
hi link gcGCodesAlt Keyword
hi link gcMCodes Keyword

let b:current_syntax = "gcode"
