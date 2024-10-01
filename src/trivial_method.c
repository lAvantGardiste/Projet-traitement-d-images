#include <stdio.h>
#include <math.h>
#include "image.h"
#include "table.h"

int main(int argc,char* argv[]){
    
    int i;
    int j;
    int k;
    int index;
    int min;
    int* diff_color;

    image cmp;
    cmp = FAIRE_image();
    image_charger(cmp,argv[2]);
    color_table cmp_table;
    cmp_table = create_color_table(cmp);
    DEFAIRE_image(cmp);
    
    image pic;
    pic = FAIRE_image();
    image_charger(pic,argv[1]);

    int length_pic;
    int length_cmp_table;
    
    length_pic = image_give_hauteur(pic) * image_give_largeur(pic);
    length_cmp_table = color_table_get_nb_color(cmp_table);
    image_debut(pic);
    
    diff_color = malloc(sizeof(int)*length_cmp_table);
    //printf("%d\n",length_cmp_table);
    int* pixel;
    int cmpRGB[3];
    for(i=0; i<50; i++){
        pixel = image_lire_pixel(pic);

        
	/*	printf("%d %d %d\n",pixel[0],pixel[1],pixel[2]); */	

    

        for(j=0;j<length_cmp_table;j++){
           
			color_table_get_color(cmp_table,j,cmpRGB);
            *(diff_color+j) = 
            pow(*(cmpRGB)-*(pixel),2) +
            pow(*(cmpRGB+1)-*(pixel+1),2)+ pow(*(cmpRGB+2)-*(pixel+2),2);
		}		
	    	
        
        min = *diff_color;
		for(k=1;k<length_cmp_table;k++){
			if(min > diff_color[k]){
				min = diff_color[k];
				index = k;	
			}
		}
        color_table_get_color(cmp_table, index, cmpRGB);
        color_table_get_color(cmp_table, index, cmpRGB);

		printf("%d %d %d \n\n",cmpRGB[0],cmpRGB[1],cmpRGB[2]);	
		//printf("%d %d %d\n % d %d %d\n\n",pixel[0],pixel[1],pixel[2],cmpRGB[0],cmpRGB[1],cmpRGB[2]);	
        image_ecrire_pixel(pic,cmpRGB);
        image_pixel_suivant(pic);
    }
	image_sauvegarder(pic,argv[1]);
   
        
    return 0;
}
	
			
	



