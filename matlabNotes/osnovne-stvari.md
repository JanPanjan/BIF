# Matlab

Kot da bi delal s python interactive environment. Pišeš spremenljivke in vrednosti. 
Interpreted language (tipi niso potrebni pri inicializaciji spremenljivk).

- Če ne podaš imena za spremenljivko, shrani v `ans`.
- Če končaš s `;`, ne izpiše vrednosti pred znakom.

Matlab hrani števila v *float* vrednostih. Da reformatiraš tip spremenljivke, pišeš
`imeSpremenljivke tipVKateregaHočešFormatirat`. Npr. `a long` ali `a short`. Formatiranje 
spremeni samo display vrednost, ne shranjeno vrednost. 

Če ne veš kako dela kaka funckija, piši:

    >> help imeFunkcije

# Osnovne operacije

Plus, minus, deljeno krat = +, -, /, *.

# Osnovne strukture

## Arrays

- `[1,2,3]` naredi vektor (vrstico)
- `[1;2;3]` naredi vektor (stolpec)

Lahko splittaš tudi s presledkom `[1 2 3]`.

Matriko narediš s kombinacijo tega, ali pa z newlines:

    >> [1 2 3
        4 5 6]

### Operacije z arrayi in matrikami

Tako kot v R-ju dela `matrika + 1` enako (tudi `vektor + 1`). Prav tako funkcije, npr. `sin(matrika)`.

Znak `'` transponira matriko (`matrika'`).

*Element wise operation* izvedeš s pikico `.`. Npr. imaš matriko `a = [1,2;2,3]`. 
Če pišemo `a*a`, izvede `množenje matrik`. Da pa množimo 1 z 1, 2 z 2 in 3 z 3, pišemo 
`a.*a`. Torej elemente na istih indeksih množimo.

## Kompleksna števila

Imajo realno in imaginarno komponento. Npr. `1+2i`. Ustvariš jih:

    <Re>+<Im>i

## Plots

`scatter` za scatter plot, `plot` za plot.. 
