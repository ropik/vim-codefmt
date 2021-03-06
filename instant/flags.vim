" Copyright 2014 Google Inc. All rights reserved.
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"     http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

""
" @section Introduction, intro
" @order intro config formatters commands autocmds functions mappings
" Provides a @command(FormatCode) command to intelligently reformat code.

""
" @setting b:codefmt_formatter
" You can override the default formatter by defining this variable. For
" instance, to explicitly select the clang-format formatter for Java, add >
"   autocmd FileType java let b:codefmt_formatter = 'clang-format'
" < to your vimrc. You can also set the value to an empty string to disable all
" formatting.


let [s:plugin, s:enter] = maktaba#plugin#Enter(expand('<sfile>:p'))
if !s:enter
  finish
endif


""
" The path to the clang-format executable.
call s:plugin.Flag('clang_format_executable', 'clang-format')

""
" Formatting style for clang-format to use. Either a string or callable that
" takes no args and returns a style name for the current buffer.
" See http://clang.llvm.org/docs/ClangFormatStyleOptions.html for details.
call s:plugin.Flag('clang_format_style', 'file')

""
" The path to the gofmt executable.  For example, this can be changed to
" "goimports" (https://godoc.org/golang.org/x/tools/cmd/goimports) to
" additionally adjust imports when formatting.
call s:plugin.Flag('gofmt_executable', 'gofmt')
