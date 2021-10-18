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
  : '[[[' .+? ']]]'
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
  : '[[' .*? ']]'
  ;

inlineBold
  : '**' inline* '**'
  ;

inlineItalic
  : '//' inline* '//'
  ;

inlineUnderline
  : '__' inline* '__'
  ;

inlineStrikeout
  : '--' inline* '--'
  ;

inlineRaw
  : '``' .*? '``'
  ;

inlinePlain
  : word (SPACE+ word)*
  ;
