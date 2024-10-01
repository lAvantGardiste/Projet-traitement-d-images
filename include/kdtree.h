#ifndef __KDTREE_H__
#define __KDTREE_H__

#include "table.h"

struct kdtree{
    color_table kd_table;
    struct kdtree* left_son;
    struct kdtree* right_son;
    int axe;
    color* split; /* on cherche la coordonée où le plan
    orthogonal à l'axe passe*/ 
};

typedef struct kdtree *kdtree;

float variance(color_table, axis);
kdtree create_kdtree(color_table,int);
void destroy_kdtree(kdtree);

#endif
