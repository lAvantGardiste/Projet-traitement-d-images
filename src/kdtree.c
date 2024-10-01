#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <string.h>
#include "kdtree.h"
#include "image.h"
#include "table.h"




float variance(color_table table, axis couleur){
    int i;
    int nb;
    float moyenne;
    float var;
    color tabRGB[3];
    moyenne = 0;
    var = 0;
    color* tab;
    nb = color_table_give_nb_color(table);
    tab = malloc(sizeof(color)*nb);
    for (i=0; i<nb; i++){
        color_table_get_color(table,i,tabRGB);
        tab[i]=tabRGB[couleur];
        moyenne+=tabRGB[couleur];
    }
    moyenne/=nb;
    for (i=0; i<nb; i++){
        var+=pow((tab[i]-moyenne),2);


    }
    free(tab);
    return var/nb;

}

kdtree create_kdtree(color_table table,int x){
    static float var[3];
    int i;
    int j;
    int axe_de_coupe;
    static int axes[3];
    int median;
    int index_median;                   
    int table_size;
    int left_table_size;
    int right_table_size;
    static int k; 
    static int value = -1;
    static int depth = -1;


    kdtree new_tree;
    new_tree = malloc(sizeof(struct kdtree));
      

    new_tree->kd_table = table;

    table_size = color_table_get_nb_color(new_tree->kd_table);

    depth = (depth+1)%3;

    //uniquement pour le premier appel
    //on définit le cycle par ordre décroissant des variances selons les 3 axes
    if(value == -1){
        
        var[0] = variance(table,0);
        var[1] = variance(table,1);
        var[2] = variance(table,2);
        value = 0;
        axe_de_coupe = 0;
        for (int i = 1; i < 3; i++){
            if(var[i] > axe_de_coupe){
                axe_de_coupe = 0+i;
            }
        }
        axes[0] = axe_de_coupe;
        if(var[(axe_de_coupe+1)%3] > var[(axe_de_coupe+2)%3]){
            axes[1] = (axe_de_coupe+1)%3;
            axes[2] = (axe_de_coupe+2)%3;
        }
        else{
            axes[1] = (axe_de_coupe+2)%3;
            axes[2] = (axe_de_coupe+1)%3;
        }
    

    new_tree -> axe = axes[0];
    k=axes[0];
    color_table_sort(table,new_tree->axe);
        
    }



//tous les autres appels après le premier
//on change l'axe de découpe

    else{

        axe_de_coupe = axes[depth];
        

        color_table_sort(table,axe_de_coupe);
        new_tree->axe = axe_de_coupe;
    }



    index_median = (table_size)/2;
    color* tmpRGB;
    tmpRGB = malloc(sizeof(color)*3);
    color_table_get_color(table,index_median,tmpRGB);
    new_tree->split = tmpRGB;

    if (table_size <= x){

    depth = (depth+2)%3; /*quand on arrive sur une feuille on remonte d'un
    étage donc on retranche 1 % 3 à l'axe pour faire l'autre côté*/

       new_tree->left_son = NULL;
       new_tree->right_son = NULL;
       return new_tree;
    }
    else{
        new_tree->left_son =
        create_kdtree(color_table_duplicate(table,0, table_size <= 3? 1 : index_median -1),x);

        new_tree->right_son = create_kdtree(color_table_duplicate(table,index_median,table_size -
        index_median ),x);
        }


    depth = (depth+2)%3; /*quand on a finis un sous-arbre, on remonte d'un
    étage donc on retranche 1 % 3 à l'axe pour faire l'autre côté
    Cela nous assure qu'on coupe l'espace selon le même plan à chaque étage (voir
    schéma du rappor)*/



    return new_tree;
}





