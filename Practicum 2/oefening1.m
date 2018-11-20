%%Deel 1: Inleiding
colpos = [1 2 1 2 5 3 4 3 4 5];
rowpos = [1 1 2 2 2 4 4 5 5 5];
val = [12 -4 7 3 -8 -13 11 2 7 -4];
a = sparse(rowpos,colpos,val,5,5)
b = full(a)

[issparse(a) issparse(b) nnz(a) nnz(b)]

clear

help nnz

%%Deel 2: Bouwen van matrices
for i = 1:3000
    b(i,1)=i;
end

clear i

n = 2.*ones(1,2999);

%sparse
tic
    i = 4.*speye(3000);
    j = sparse(diag(n,1));

    A = i+j+j';

    Ab = [A,b];
toc
clear i j

%full
tic
    i = 4.*eye(3000);
    j = diag(n,1);

    A = i+j+j';

    Ab = [A,b];
toc
clear i j

%Dit levert dan dat voor de sparse methode het opstellen approx 0.038 sec,
%terwijl de full methode er 0.122 sec over doet.
%Als de matrices weergegeven worden geeft dit: 0.086 sec voor de sparse en
%10.295 voor de full matrices.

clear A Ab b

%%Deel 3: LU decompositie
%Sparse
tic
    i = 4.*speye(3000);
    j = sparse(diag(n,1));

    A = i+j+j';
    
    [L,U] = lu(A);
toc
clear i j

%full
tic
    i = 4.*eye(3000);
    j = diag(n,1);

    A = i+j+j';
    
    [L,U] = lu(A);
toc
clear i j
%Waaruit volgt dat (zonder weergeven van matrices L & U) de methode met
%sparse matrices 0.044 sec duurt terwijl de methode met full matrices 0.34
%sec duurt, een aanzienlijk verschil. (Full = 16.808 sec & sparse = 0.0906 sec
%als L en U weergegeven)

clear n A L U

%%Deel 4: Random matrices
A = sprand(150,5423,0.1)
%Een sparse matrix van dimensies 150x5423 dat voor 10% gevuld is met
%willekeurige waarden.

A = sprandsym(6,.4,[1 2.5 6 9 2 4.3])
%Het voorbeeld uit de opgaven.