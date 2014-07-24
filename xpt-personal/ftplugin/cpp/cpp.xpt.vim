XPTemplate priority=personal

let s:f = g:XPTfuncs()

function! GetNSFNameDefine()
    let dir = expand('%:p:h')
    let ext = toupper(expand('%:e'))
    let idx = stridx(dir, 'include')
    if idx != -1
        let subdir = strpart(dir, idx + strlen('include') + 1)
        let define = substitute(subdir, '/', '_', 'g')
        let define = define ."_".expand('%:t:r')."_" . ext
        let define = toupper(define)
        let define = substitute(define, '^_\+', '', '')
        return define
    else
        return toupper(expand('%:t:r'))."_" . ext
    endif
endfunction

function! s:f.getNamespaceFilenameDefine(...)
    return GetNSFNameDefine()
endfunction

XPT main hint=C++\ main\ including\ #includes
#include <iostream>
`includes^

int main(int, char**) {
    `cursor^

    return 0;
}

XPT m hint=C++\ member\ variable
`type^ m_`name^;

XPT h hint=C++\ header\ file
#ifndef `getNamespaceFilenameDefine()^
#define `getNamespaceFilenameDefine()^

/**
 * `classDescription^
 */
class `fileRoot()^ {
public:
    /**
     * Constructor
     */
    `fileRoot()^();

    /**
     * Destructor
     */
    virtual ~`fileRoot()^();

    `cursor^
private:
};

#endif // `getNamespaceFilenameDefine()^

XPT h_sm hint=Sharemind\ C++\ header\ file
/*
 * This file is a part of the Sharemind framework.
 * Copyright (C) Cybernetica AS
 *
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner. The usage of this
 * code is subject to the appropriate license agreement.
 */

#ifndef `getNamespaceFilenameDefine()^
#define `getNamespaceFilenameDefine()^

/**
 * `classDescription^
 */
class `fileRoot()^ {
public:
    /**
     * Constructor
     */
    `fileRoot()^();

    /**
     * Destructor
     */
    virtual ~`fileRoot()^();

    `cursor^
private:
};

#endif // `getNamespaceFilenameDefine()^

XPT class hint=C++\ Class\ declaration
class `className^ {
public:
    `explicit ^`className^(`argument^`...^, `arg^`...^);
    virtual ~`className^();
    `cursor^
private:
};

XPT cerr hint=C++\ basic\ std::cerr\ statement
XSET namespace|post=S(V(), '.*[^:]', '&::', '')
`namespace^cerr << `expression^`...^ << `expression^`...^ << `namespace^endl;

XPT cout hint=C++\ basic\ std::cout\ statement
XSET namespace|post=S(V(), '.*[^:]', '&::', '')
`namespace^cout << `expression^`...^ << `expression^`...^ << `namespace^endl;

XPT sc wrap=value hint=C++\ static_cast<>\(\)
static_cast<`to_type^>(`value^)

XPT rc wrap=value hint=C++\ reinterpret_cast<>\(\)
reinterpret_cast<`to_type^>(`value^)

XPT cc wrap=value hint=C++\ const_cast<>\(\)
const_cast<`to_type^>(`value^)

XPT dc wrap=value hint=C++\ dynamic_cast<>\(\)
dynamic_cast<`to_type^>(`value^)

XPT { wrap=code hint=C++\ {\ indented\ code\ block\ }
{
    `code^
}

XPT {_ wrap=code hint=C++\ {\ inline\ code\ block\ }
{ `code^ }

XPT \( wrap=code hint=C++\ \(\ indented\ code\ block\ \)
(
    `code^
)

XPT \(_ wrap=code hint=C++\ \(\ inline\ code\ block\ \)
( `code^ )

XPT foriter hint=C++\ for\ \(type::iterator\ it\ =\ var.begin;\ it\ !=\ var.end;\ ++it\)
for (`type^::iterator `it^ = `var^.begin(); `it^ != `var^.end(); ++`it^) {
    `cursor^
}

XPT forciter hint=C++\ for\ \(type::const_iterator\ it\ =\ var.begin;\ it\ !=\ var.end;\ ++it\)
for (`type^::const_iterator `it^ = `var^.begin(); `it^ != `var^.end(); ++`it^) {
    `cursor^
}

XPT fun hint=C++\ function\ definition
XSET class|post=S(V(), '.*[^:]', '&::', '')
`type^ `class^`name^ (`param^`...^, `param^`...^)` const^ {
    `cursor^
}

XPT funh hint=C++\ header\ function\ declaration
`type^ `name^ (`param^`...^, `param^`...^)` const^;
