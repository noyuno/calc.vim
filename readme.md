# calc.vim

| equation  | answer           |
| ---       | ---              |
| 3+12/6    | = 3+12/6         |
| 2^32-1    | =obase=16;2^64-1 |
| 100/0     | = 100/0          |
| sin(pi/4) | =scale=4;s(a(1)) |

becomes

| equation  | answer                                              |
| ---       | ---                                                 |
| 3+12/6    | 5.00                                                |
| 2^32-1    | FFFFFFFFFFFFFFFF                                    |
| 100/0     | Runtime error (func=(main), adr=14): Divide by zero |
| sin(pi/4) | 0.7070                                              |

## Requires
    
    bc

## Usage

Write Markdown style table
    
    | equation  | answer           |
    | ---       | ---              |
    | 3+12/6    | = 3+12/6         |
    | 2^32-1    | = 2^32-1         |
    | 100/0     | = 100/0          |
    | sin(pi/4) | =scale=4;s(a(1)) |

Set cursor to the table, and run 
    
    :Calculate


