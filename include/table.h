#ifndef __TABLE_H_H__
#define __TABLE_H_H__
#include "image.h"

typedef enum {red,green,blue} axis;
typedef int color;
typedef enum {false,true} boolean;



typedef struct color_table* color_table;

extern color_table create_color_table(image);
extern boolean destroy_color_table(color_table);
extern color_table color_table_duplicate(color_table,int,int);
extern void color_table_get_color(color_table,int,color*);
extern int color_table_get_nb_color(color_table);
extern void color_table_sort(color_table,axis);

/* Fonctions pour récupérer les champs de la structure abstraite */
extern color* color_table_give_suite_color(color_table);
extern int color_table_give_nb_color(color_table);
extern boolean color_table_give_owner(color_table);

#endif


