function [tronco, faces] = desenhar_tronco()
  
  % vértices do tronco
  vertices = [0 0 0;
              0 1 0;
              1 1 0;
              1 0 0;
              0.283 0.283 1;
              0.283 0.716 1;
              0.716 0.716 1;
              0.716 0.283 1];

  % faces do tronco
  faces = [1 2 3 4;
           1 5 6 2;
           2 6 7 3;
           3 7 8 4;
           4 8 5 1;
           5 6 7 8];
 
  % tamanho em cada coordenada   
  X = 3;
  Y = 3;
  Z = 2.5;
  
  % origem do tronco
  CX = -X/2;
  CY = -Y/2;
  CZ = 0;
  
  tronco = [vertices(:,1)*X+CX,vertices(:,2)*Y+CY,vertices(:,3)*Z+CZ];
  patch('Faces',faces,'Vertices',tronco,'FaceColor','y');
end