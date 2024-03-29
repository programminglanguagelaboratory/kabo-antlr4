grammar Kabo;

SPACE
  : ' '
  | '\t'
  ;

NEWLINE
  : '\n'
  | '\r\n'
  ;

LETTER
  : ~ ('\r' | '\n' | ' ' | '\t')
  ;

word
  : LETTER+
  ;

document
  : block (NEWLINE block)* EOF
  ;

block
  : blockHeader NEWLINE
  | blockParagraph NEWLINE
  | blockReference NEWLINE
  | blockRaw NEWLINE
  ;

blockHeader
  : '=' SPACE+ inline SPACE+ '='
  | '==' SPACE+ inline SPACE+ '=='
  | '===' SPACE+ inline SPACE+ '==='
  ;

blockParagraph
  : inline (SPACE+ inline)*
  ;

blockReference
  : '[[' .+? ']]'
  ;

blockRaw
  : '``' .+? '``'
  ;

inline
  : inlineReference
  | inlineBold
  | inlineItalic
  | inlineUnderline
  | inlineStrikeout
  | inlineRaw
  | inlinePlain
  ;

inlineReference
  : '[' .*? ']'
  ;

inlineBold
  : '*' inline* '*'
  ;

inlineItalic
  : '/' inline* '/'
  ;

inlineUnderline
  : '_' inline* '_'
  ;

inlineStrikeout
  : '-' inline* '-'
  ;

inlineRaw
  : '`' .*? '`'
  ;

inlinePlain
  : word (SPACE+ word)*
  ;
