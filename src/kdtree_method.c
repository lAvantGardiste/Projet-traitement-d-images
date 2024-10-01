#include <stdio.h>
#include <stdlib.h>
#include "kdtree.h"
#include "image.h"
#include "table.h"
#include "nearest.h"

int main (int argc,char *argv[]){
    image im_table;
    im_table = FAIRE_image();
    image_charger(im_table,argv[2]);
    color_table table;
    table = create_color_table(im_table);
    DEFAIRE_image(im_table);
    
    kdtree tree;
    tree = create_kdtree(table,20);
    image im;
    im = FAIRE_image();
    image_charger(im,argv[1]);
    int length_im;
    length_im = image_give_hauteur(im)* image_give_largeur(im);
    int i;
    image_debut(im);
    color* pixel;
    color nearest[3];
    for (i=0;i<length_im; i++){
        pixel = image_lire_pixel(im);
        kd_get_nearest_color(tree,pixel,nearest); 
        image_ecrire_pixel(im,nearest);
        image_pixel_suivant(im);
    }

    image_sauvegarder(im,argv[1]);




return 0;
}


