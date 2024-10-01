# Matlab

Documentation: [docs](https://www.mathworks.com/help/matlab/learn_matlab/array-indexing.html) 

---

Kot da bi delal s python interactive environment. Pišeš spremenljivke in vrednosti. 
Interpreted language (tipi niso potrebni pri inicializaciji spremenljivk).

- Če ne podaš imena za spremenljivko, shrani v `ans`.
- Če končaš s `;`, ne izpiše vrednosti pred znakom.

Matlab hrani števila v *float* vrednostih. Da reformatiraš tip spremenljivke, pišeš
`imeSpremenljivke tipVKateregaHočešFormatirat`. Npr. `a long` ali `a short`. Formatiranje 
spremeni samo display vrednost, ne shranjeno vrednost. 

Če ne veš kako dela kaka funckija, piši:

    >> help imeFunkcije         (terminal docs)
    >> lookfor imeFunkcije      (najde vse ki matchajo imeFunkcije)
    >> doc imeFunkcije          (online docs)

---

Spremenljivke se ne shranijo, če exitaš mathlab. Lahko pa shraniš workspace,
tako da napišeš ukaz `save imeDatoteke.m`. To ustvari `.mat` datoteko s podatki. 

Da jih prikličeš nazaj, ko spet zaženeš mathlab, kličeš `load imeDatoteke.m`. Da odstraniš spremenljivke, uporabiš
`clear`.
