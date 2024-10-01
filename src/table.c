#include <stdio.h>
#include <assert.h>
#include "image.h"
#include "table.h"

/* Création de notre table de couleur */
struct color_table {
    color* suite_color;
    int nb_color;
    boolean owner;
};


color_table create_color_table(image im){
    int i;
    int j;
    int tailleLigne;
    int taille;
    taille = image_give_hauteur(im)*image_give_largeur(im);
    axis r;
    axis g;
    axis b;
    r = red;
    g = green;
    b = blue;
    tailleLigne = image_give_largeur(im)*image_give_dim(im);
    if ((im == NULL) || (tailleLigne%3 != 0)){
        printf("probleme");
        return NULL;
    }
    
    int estPresent;
    int tailleTable;

    image_debut(im);
    
    int* tab; 
    tab = image_lire_pixel(im);
    
    color tmp;
    color_table table;
    

    table = malloc(sizeof(struct color_table));
    table->suite_color = malloc(sizeof(color));
    

    table->suite_color[0] = tab[0] << 8*red | tab[1] >> 8*green | tab[2] << 8*blue; 
    tailleTable = 1;
    

    for (i=1; i<taille; i++)
        {
        image_pixel_suivant(im);
        tab = image_lire_pixel(im);
        tmp = tab[red] << 8*red | tab[green] <<
        8*green | tab[blue] << 8*blue;
        for (j=0; j<tailleTable; j++){
            
            if (table->suite_color[j] == tmp){
                estPresent = 1;
                break;
            }
        }

        if (estPresent != 1){
            tailleTable+=1;
            table->suite_color = realloc(table->suite_color,tailleTable*sizeof(color));
            table->suite_color[tailleTable-1] = tmp;

        }
        estPresent = 0;
        
    }
    table->nb_color = tailleTable;
    table->owner = 1;
    image_debut(im);
    return table;
}


boolean destroy_color_table(color_table table){
    if (table->owner == 1 ){
        free(table->suite_color);
        printf("libération de la suite de couleur ainsi que la table tout entière");
    }
    free(table);
}
color_table color_table_duplicate(color_table table, int offset, int size){
   assert(offset< table->nb_color && size<=table->nb_color);
   assert(offset+size <= table->nb_color);
   
   color_table sous_table;
   sous_table = malloc(sizeof(struct color_table));
   
   sous_table->suite_color = (table->suite_color)+offset;
   sous_table->nb_color = size;
   sous_table->owner = 0;
   
   return sous_table;
}

int color_table_get_nb_color(color_table table){
   if (table == NULL){
        return -1;
    }
   
   return table->nb_color;
}

void color_table_get_color(color_table table,int indice, color* tabRGB)
{
    assert(table !=NULL);
    assert(indice<table->nb_color);

    tabRGB[0] = table->suite_color[indice] & 255;
    tabRGB[1] = (table->suite_color[indice] & (255 << 8)) >> 8;;
    tabRGB[2] = (table->suite_color[indice] & (255 << 16))>> 16;

}

void color_table_sort(color_table table, axis couleur){
    assert (couleur>=0 && couleur <= 2);
    int i;
    int j;
    int tmp;
    /* TRI PAR INSERTION */
    for (i=1; i<table->nb_color; i++)
        {
        tmp = table->suite_color[i];
        j = i;
        
        while ((j>0) && ((table->suite_color[j-1] & (255<<couleur*8)) > (tmp &
                (255<<couleur*8)))) 
            {
            table->suite_color[j] = table->suite_color[j-1];
            j-=1;
            }
        
        table->suite_color[j] = tmp;        
    }
    /* Peut être faire un tri par insertion pour la complexité */
}


int color_table_give_nb_color(color_table table){
    if (table == NULL){
        return -1;

    }
    return table->nb_color;

}
boolean color_table_give_owner(color_table table){
    return table->owner;

}
