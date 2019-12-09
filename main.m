[cubo_mundo, faces_cubo, ...
piramide_mundo, faces_piramide, ...
paralelepipedo_mundo,faces_paralelepipedo, ...
tronco_mundo, faces_tronco] = sistema_mundo();

clf % limpa a figura 


origem_camera = [-10, 10 10];

centro_cubo = [(max(cubo_mundo(:, 1))+min(cubo_mundo(:, 1)))/2 ...
               (max(cubo_mundo(:, 2))+min(cubo_mundo(:, 2)))/2 ...
               (max(cubo_mundo(:, 3))+min(cubo_mundo(:, 3)))/2];
               
centro_piramide = [(max(piramide_mundo(:, 1))+min(piramide_mundo(:, 1)))/2 ...
               (max(piramide_mundo(:, 2))+min(piramide_mundo(:, 2)))/2 ...
               (max(piramide_mundo(:, 3))+min(piramide_mundo(:, 3)))/2];

ponto_medio_centros = [(centro_cubo(1)+centro_piramide(1))/2 ...
                       (centro_cubo(2)+centro_piramide(2))/2 ...
                       (centro_cubo(3)+centro_piramide(3))/2 ];           

camera_vetor_w = ponto_medio_centros - origem_camera;  
    
vetor_auxiliar = [-10 5 2];

camera_vetor_u = cross(camera_vetor_w, vetor_auxiliar);

camera_vetor_v = cross(camera_vetor_w, camera_vetor_u);

% tranformando em vetores unitários         
camera_vetor_w = camera_vetor_w / (sqrt(dot(camera_vetor_w, camera_vetor_w))); 
camera_vetor_u = camera_vetor_u / (sqrt(dot(camera_vetor_u, camera_vetor_u)));
camera_vetor_v = camera_vetor_v / (sqrt(dot(camera_vetor_v, camera_vetor_v)));

base_camera = [camera_vetor_u; camera_vetor_v; camera_vetor_n];
base_mundo = [1 0 0; 0 1 0; 0 0 1];

cubo_camera = inv(base_camera) * base_mundo * cubo_mundo;
piramide_camera = inv(base_camera) * base_mundo * piramide_mundo;
paralelepipedo_camera = inv(base_camera) * base_mundo * paralelepipedo_mundo;
tronco_camera = inv(base_camera) * base_mundo * tronco_mundo;

patch('Faces',faces_cubo,'Vertices',cubo_camera,'FaceColor','b');
patch('Faces',faces_piramide,'Vertices',piramide_camera,'FaceColor','m');
patch('Faces',faces_paralelepipedo,'Vertices',piramide_camera,'FaceColor','r');
patch('Faces',faces_tronco,'Vertices',piramide_camera,'FaceColor','y');





                  
             
                  

                  
                      

           

               


