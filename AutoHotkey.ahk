#UseHook

;Muhenkan Vim Moving KeyBind
vk1Dsc07B & K::Send,{Blind}{Up}
vk1Dsc07B & H::Send,{Blind}{Left}
vk1Dsc07B & J::Send,{Blind}{Down}
vk1Dsc07B & L::Send,{Blind}{Right}

vk1Dsc07B & U::Send,{Blind}{Home}
vk1Dsc07B & I::Send,{Blind}{End}

;Muhenkan Emacs Home & End
vk1Dsc07B & A::Send,{Blind}{Home}
vk1Dsc07B & E::Send,{Blind}{End}

;Muhenkan PageUp and PageDown
vk1Dsc07B & P::Send,{Blind}{PGUP}
vk1Dsc07B & N::Send,{Blind}{PGDN}

;Muhenkan Ctrl+Tab,ShigtTab
vk1Dsc07B & O::Send,^{Tab}
vk1Dsc07B & Y::Send,^+{Tab}

;Muhenkan Cygwin
vk1Dsc07B & M::Send,^{F12}

;Muhenkan Win+T
vk1Dsc07B & B::Send,{Blind}#{t}


;Muhenkan+Space Enter
vk1Dsc07B & Space::Send,{Blind}{Enter}

;Henkan Backspace
vk1Csc079::Send,{Blind}{BS}

;Ctrk+Muhenkan Delete
;Muhenkan+Henkan Delete
^vk1Csc079::Send,{DEL}
vk1Dsc07B & vk1Csc079::Send,{Blinde}{DEL}

vk1Dsc07B & C::Send,{Blind}{ESC}
vk1Dsc07B & V::Send,{Home}+{End}


;Alt + Tab
;LALt & vk1Csc079::AltTab

;Hiragana Shift
F21::Shift
;vkF0sc070::Shift

;; BackSlash -> UnderBar
vkE2sc073::_

^vkBCsc033::Send,{<}{>}{Left}
^vkBAsc028::Send,{*}{*}{Left}
^8::Send,{(}{)}{Left}
^[::Send,{`{}{`}}{Left}
^2::Send,{"}{"}{Left}
^7::Send,{'}{'}{Left}

;vk1Dsc07B & R::Run,"C:/Users/cyber/Documents/Dropbox/"
;vk1Dsc07B & D::Run,"C:/Users/cyber/Documents/"
vk1Dsc07B & D::Run,"C:/Users/cyber/Desktop/Asr/AsrLoad.exe" %A_MyDocuments%,,Max
vk1Dsc07B & R::Run,"C:/Users/cyber/Desktop/Asr/AsrLoad.exe" C:\Users\cyber\Desktop\Dropbox\,,Max
vk1Dsc07B & F::Send,#{1}
vk1Dsc07B & G::Send,#{2}

;無変換シリーズ
;hjkl move
;npui,ae updownhomeend
;space,henkan Enter,DEL
;c escape,v line select
;d,r  Asr Folder Open
;oy CtrlTab,Shift~
;m cygwin
;b Win+T
