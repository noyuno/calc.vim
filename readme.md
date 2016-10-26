# calc.vim

|equation|answer|
|---|---|
| 3+12/6 | = 3+12/6 |
| 2^32-1 | = 2^32-1 |
| 100/0 | = 100/0 |

becomes

| equation | answer |
| --- | --- |
| 3+12/6 | 5.00 |
| 2^32-1 | 4294967295 |
| 100/0 | Runtime error (func=(main), adr=14): Divide by zero |

## Requires
    
    bc

## Usage

Write Markdown style table
    
    |equation|answer|
    |---|---|
    | 3+12/6 | = 3+12/6 |
    | 2^32-1 | = 2^32-1 |
    | 100/0 | = 100/0 |

Set cursor to the table, and run 
    
    :Calculate


