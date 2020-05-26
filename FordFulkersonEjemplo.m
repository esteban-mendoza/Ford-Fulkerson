s = 1; t = 6;
A = [0 16 13  0  0  0;
    0  0 10 12  0  0;
    0  4  0  0 14  0;
    0  0  9  0  0 20;
    0  0  0  7  0  4;
    0  0  0  0  0  0];

S = 1, T = 3
cap = [ 0 13  0  0  2 15  0  0  0  0;
      13  0  7  0  0  0  0  0  0  5;
       0  7  0 11  0  0  0  0 12  0;
       0  0 11  0  9  0  0  3  0  0;
       2  0  0  9  0  0  6  0  0  0;
      15  0  0  0  0  0 14  0  0  4;
       0  0  0  0  6 14  0  8  0  0;
       0  0  0  3  0  0  8  0  1  0;
       0  0 12  0  0  0  0  1  0 10;
       0  5  0  0  0  4  0  0 10  0];

% Ford-Fulkerson(MatrizDeCapacidad, Source, Target)
[flujo, MatrizResidual] = FordFulkerson(cap, S, T)