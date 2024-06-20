"Borrowing all the IMAP macros from main.vim in vim-latex Plugin, so I can write math quickly in the wiki
"Note to self: I took out all of the debugging/"safe" code.

let wikiMathLeader = "`"

call IMAP ('__', '_{<++>}<++>', 'vimwiki')
call IMAP ('()', '(<++>)<++>', 'vimwiki')
call IMAP ('[]', '[<++>]<++>', 'vimwiki')
call IMAP ('{}', '{<++>}<++>', 'vimwiki')
call IMAP ('^^', '^{<++>}<++>', 'vimwiki')
call IMAP ('$$', '$<++>$<++>', 'vimwiki')
call IMAP ('==', '&=& ', 'vimwiki')
call IMAP ('~~', '&\approx& ', 'vimwiki')
call IMAP ('=~', '\approx', 'vimwiki')
call IMAP ('::', '\dots', 'vimwiki')
call IMAP ('((', '\left( <++> \right)<++>', 'vimwiki')
call IMAP ('[[', '\left[ <++> \right]<++>', 'vimwiki')
call IMAP ('{{', '\left\{ <++> \right\}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'^', '\hat{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'_', '\bar{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'6', '\partial', 'vimwiki')
call IMAP (wikiMathLeader.'8', '\infty', 'vimwiki')
call IMAP (wikiMathLeader.'/', '\frac{<++>}{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'%', '\frac{<++>}{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'@', '\circ', 'vimwiki')
call IMAP (wikiMathLeader.'0', '^\circ', 'vimwiki')
call IMAP (wikiMathLeader.'=', '\equiv', 'vimwiki')
call IMAP (wikiMathLeader."\\",'\setminus', 'vimwiki')
call IMAP (wikiMathLeader.'.', '\cdot', 'vimwiki')
call IMAP (wikiMathLeader.'*', '\times', 'vimwiki')
call IMAP (wikiMathLeader.'&', '\wedge', 'vimwiki')
call IMAP (wikiMathLeader.'-', '\bigcap', 'vimwiki')
call IMAP (wikiMathLeader.'+', '\bigcup', 'vimwiki')
call IMAP (wikiMathLeader.'M', '\sum_{<++>}^{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'S', '\sum_{<++>}^{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'(', '\subset', 'vimwiki')
call IMAP (wikiMathLeader.')', '\supset', 'vimwiki')
call IMAP (wikiMathLeader.'<', '\le', 'vimwiki')
call IMAP (wikiMathLeader.'>', '\ge', 'vimwiki')
call IMAP (wikiMathLeader.',', '\nonumber', 'vimwiki')
call IMAP (wikiMathLeader.'~', '\tilde{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.';', '\dot{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.':', '\ddot{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'2', '\sqrt{<++>}<++>', 'vimwiki')
call IMAP (wikiMathLeader.'|', '\Big|', 'vimwiki')
call IMAP (wikiMathLeader.'I', "\\int_{<++>}^{<++>}<++>", 'vimwiki')
call IMAP(wikiMathLeader.'a', '\alpha', 'vimwiki')
call IMAP(wikiMathLeader.'b', '\beta', 'vimwiki')
call IMAP(wikiMathLeader.'c', '\chi', 'vimwiki')
call IMAP(wikiMathLeader.'d', '\delta', 'vimwiki')
call IMAP(wikiMathLeader.'e', '\varepsilon', 'vimwiki')
call IMAP(wikiMathLeader.'f', '\varphi', 'vimwiki')
call IMAP(wikiMathLeader.'g', '\gamma', 'vimwiki')
call IMAP(wikiMathLeader.'h', '\eta', 'vimwiki')
call IMAP(wikiMathLeader.'i', '\iota', 'vimwiki')
call IMAP(wikiMathLeader.'k', '\kappa', 'vimwiki')
call IMAP(wikiMathLeader.'l', '\lambda', 'vimwiki')
call IMAP(wikiMathLeader.'m', '\mu', 'vimwiki')
call IMAP(wikiMathLeader.'n', '\nu', 'vimwiki')
call IMAP(wikiMathLeader.'p', '\pi', 'vimwiki')
call IMAP(wikiMathLeader.'q', '\theta', 'vimwiki')
call IMAP(wikiMathLeader.'r', '\rho', 'vimwiki')
call IMAP(wikiMathLeader.'s', '\sigma', 'vimwiki')
call IMAP(wikiMathLeader.'t', '\tau', 'vimwiki')
call IMAP(wikiMathLeader.'u', '\upsilon', 'vimwiki')
call IMAP(wikiMathLeader.'v', '\varsigma', 'vimwiki')
call IMAP(wikiMathLeader.'w', '\omega', 'vimwiki')
call IMAP(wikiMathLeader.'w', '\wedge', 'vimwiki')  " AUCTEX style
call IMAP(wikiMathLeader.'x', '\xi', 'vimwiki')
call IMAP(wikiMathLeader.'y', '\psi', 'vimwiki')
call IMAP(wikiMathLeader.'z', '\zeta', 'vimwiki')
" not all capital greek letters exist in LaTeX!
" reference: http://www.giss.nasa.gov/latex/ltx-405.html
call IMAP(wikiMathLeader.'D', '\Delta', 'vimwiki')
call IMAP(wikiMathLeader.'F', '\Phi', 'vimwiki')
call IMAP(wikiMathLeader.'G', '\Gamma', 'vimwiki')
call IMAP(wikiMathLeader.'Q', '\Theta', 'vimwiki')
call IMAP(wikiMathLeader.'L', '\Lambda', 'vimwiki')
call IMAP(wikiMathLeader.'X', '\Xi', 'vimwiki')
call IMAP(wikiMathLeader.'Y', '\Psi', 'vimwiki')
call IMAP(wikiMathLeader.'S', '\Sigma', 'vimwiki')
call IMAP(wikiMathLeader.'U', '\Upsilon', 'vimwiki')
call IMAP(wikiMathLeader.'W', '\Omega', 'vimwiki')
"
	" ProtectLetters: sets up indentity maps for things like ``a {{{
	" " Description: If we simply do
	" 		call IMAP('`a', '\alpha', 'tex')
	" then we will never be able to type 'a' after a tex-quotation. Since
	" IMAP() always uses the longest map ending in the letter, this problem
	" can be avoided by creating a fake map for ``a -> ``a.
	" This function sets up fake maps of the following forms:
	" 	``[aA]  -> ``[aA]    (for writing in quotations)
	" 	\`[aA]  -> \`[aA]    (for writing diacritics)
	" 	"`[aA]  -> "`[aA]    (for writing german quotations)
	" It does this for all printable lower ascii characters just to make sure
	" we dont let anything slip by.
	function! s:ProtectLetters(first, last)
		let i = a:first
		while i <= a:last
			if nr2char(i) =~ '[[:print:]]'
				call IMAP('``'.nr2char(i), '``'.nr2char(i), 'tex')
				call IMAP('\`'.nr2char(i), '\`'.nr2char(i), 'tex')
				call IMAP('"`'.nr2char(i), '"`'.nr2char(i), 'tex')
			endif
			let i = i + 1
		endwhile
	endfunction 
	call s:ProtectLetters(32, 127)
	" }}}
	" vmaps: enclose selected region in brackets, environments {{{ 
	" The action changes depending on whether the selection is character-wise
	" or line wise. for example, selecting linewise and pressing \v will
	" result in the region being enclosed in \begin{verbatim}, \end{verbatim},
	" whereas in characterise visual mode, the thingie is enclosed in \verb|
	" and |.
	exec 'vnoremap <silent> '.wikiMathLeader."( \<C-\\>\<C-N>:call VEnclose('\\left( ', ' \\right)', '\\left(', '\\right)')\<CR>"
	exec 'vnoremap <silent> '.wikiMathLeader."[ \<C-\\>\<C-N>:call VEnclose('\\left[ ', ' \\right]', '\\left[', '\\right]')\<CR>"
	exec 'vnoremap <silent> '.wikiMathLeader."{ \<C-\\>\<C-N>:call VEnclose('\\left\\{ ', ' \\right\\}', '\\left\\{', '\\right\\}')\<CR>"
	exec 'vnoremap <silent> '.wikiMathLeader."$ \<C-\\>\<C-N>:call VEnclose('$', '$', '\\[', '\\]')\<CR>"
	" }}}

" }}}

