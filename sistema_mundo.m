function [cubo_mundo,faces_cubo, ...
  piramide_mundo, faces_piramide, ...
  paralelepipedo_mundo, faces_paralelepipedo, ...
  tronco_mundo, faces_tronco] = sistema_mundo()

  % recebendo as coordenadas dos sólidos, cada um em seu SCO
  [vertices_cubo, faces_cubo] = desenhar_cubo();
  [vertices_piramide, faces_piramide] = desenhar_piramide();
  [vertices_paralelepipedo, faces_paralelepipedo] = desenhar_paralelepipedo();
  [vertices_tronco, faces_tronco] = desenhar_tronco();

  clf % limpa a figura 

  % mostra o cubo no sistema de coordenadas do mundo
  cubo_mundo = [vertices_cubo(:,1)+5,vertices_cubo(:,2)+5,vertices_cubo(:,3)+5];
  patch('Faces',faces_cubo,'Vertices',cubo_mundo,'FaceColor','b');

  % mostra a pirï¿½mide no sistema de coordenadas do mundo
  piramide_mundo = [vertices_piramide(:,1)+10,vertices_piramide(:,2)+10,vertices_piramide(:,3)+10];
  patch('Faces',faces_piramide,'Vertices',piramide_mundo,'FaceColor','m');

  % mostra o paralelepipedo no sistema de coordenadas do mundo
  paralelepipedo_mundo = [vertices_paralelepipedo(:,1)+5,vertices_paralelepipedo(:,2)+5,vertices_paralelepipedo(:,3)-5];
  patch('Faces',faces_paralelepipedo,'Vertices',paralelepipedo_mundo,'FaceColor','r');

  % mostra o tronco no sistema de coordenadas do mundo
  tronco_mundo = [vertices_tronco(:,1)+10,vertices_tronco(:,2)+10,vertices_tronco(:,3)-10];
  patch('Faces',faces_tronco,'Vertices',tronco_mundo,'FaceColor','y');
end





