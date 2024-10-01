#include <stdio.h>
#include <stdlib.h>
#include "kdtree.h"
#include "image.h"
#include "table.h"
#include "largeur_kdtree.h"


int main (){
    image im;
    im = FAIRE_image();
    image_charger(im,"../data/IMAGES/TABLES/table_fille_1280.ppm");
    color_table table;
    table = create_color_table(im);
    DEFAIRE_image(im);
    printf("%d\n",color_table_get_nb_color(table));
    kdtree tree;
    tree = create_kdtree(table,1);
    parcours_largeur(tree);

return 0;
}
