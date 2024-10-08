# Osnovne operacije

Plus, minus, deljeno krat = +, -, /, *.

Komentar : `%`

Print funkcija: `disp(x)`. Če hočeš printat več vrednosti, printaj
array (glej dol za arrays).

    >> x = 1
    >> y = 2
    >> disp([x, y])
    "1" "2"

Lahko tudi `fprintf()` iz C-ja (verjetno je matlab built on top of C).

## Osnovne strukture

### Arrays

Z oklepaji `[]`  naredimo arrays. Lahko jih tudi *concatenatamo* v nove arraye
ali matrike.

Vejice `,` povejo, da gre horizontalno. Semicolons `;` povejo, da gre vertikalno.

Z newlines:

    >> [1 2 3
        4 5 6]

Ali pa s *concatenation*:

    >> a = [1,2]
    >> b = [2,3]
    >> [a,b]
    1    2
    2    3

Lahko ustvariš sekvence (tako kot v R-ju s `seq`). Sintaksa je `start:step:end`,
kar npr. naredi:

    >> 0:2:10
    0   2   4    6    8    10

### Operacije z arrayi in matrikami

Tako kot v R-ju dela `matrika + 1` enako (tudi `vektor + 1`). Prav tako funkcije,
npr. `sin(matrika)`

Znak `'` transponira matriko (`matrika'`).

*Element wise operation* izvedeš s pikico `.`. Npr. imaš matriko `a = [1,2;2,3]`.
Če pišemo `a*a`, izvede `množenje matrik`. Da pa množimo 1 z 1, 2 z 2 in 3 z 3, pišemo
`a.*a`. Torej elemente na istih indeksih množimo.

### Dostopanje elementov arraya

Z oklepaji, kjer podaš `row` in `column`:

    >> a = [1,2,3,4]
    >> a(1,1)
    1

Če podaš samo 1 vrednost, gre po stolpcih in najde `n`-ti element. Temu se pravi
*linear indexing*.

    1. a(1,1)
    2. a(2,1)
    ... ko pride do konca stolpca, začne v novem
    1. a(2,1)
    2. a(2,1)
    ... itn.

Če hočeš element izven dimenzij matrike, vrne **error**.

---

Dostopanje do večih elementov je enako kot v R-ju ali Pythonu. Z `:`. To pomeni,
da vzame 1 do 2 row ter 2 column:

    >> a(1:2, 2)
         rows,col

Dostopanje do stolpca s praznim intervalom. To pomeni, da naj vzame vrstico 3
in vse stolpce v matriki a:

    >> a(3, :)

### Dodajanje elementov v array

Če hočeš dat element na indeks, ki je out of bounds, se posodobi matrika/array
in nova vrednost se doda. Prav tako se zafila z 0, tam kjer nismo dali
elementov.

## Kompleksna števila

Imajo realno in imaginarno komponento. Npr. `1+2i`. Ustvariš jih:

    <Re>+<Im>i

## Loops

    for i = 1:10
        disp(i)
    end

Ustvari variable `i`, ki se začne z 1 in veča dokler ni enaka 10.
