#ifndef __NEAREST_H__
#define __NEAREST_H__

double distance(color*,color*);
double min_dist(kdtree, color*);
void kd_get_nearest_color(kdtree, color*,color*);

#endif
