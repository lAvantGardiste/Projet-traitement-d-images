#include <stdio.h>
#include <stdlib.h>
#include "kdtree.h"
#include "image.h"
#include "table.h"
#include "largeur_kdtree.h"


void enqueue(struct queue* q, kdtree tree) {
    struct queueNode* newNode = malloc(sizeof(struct queueNode));
    newNode->qtree = tree;
    newNode->next = NULL;
    if (q->rear == NULL && q->front == NULL) {
        //printf("ajout dans la file vide\n");
        q->front = newNode;
        q->rear = newNode;
    }
    //si la file est de taille 1
    else if (q->front == q->rear){
        //printf("ajout file non vide de taille 1\n");
        q->front->next = newNode;
        q->rear = newNode;
    }
    else {
        //printf("ajout file non vide\n");
        q->rear->next = newNode;
        q->rear = newNode;

    }
}

kdtree dequeue(struct queue* q) {
    if (q->front == NULL && q->rear == NULL) {
       // printf("dequue d'une file vide");
        return NULL;
    }
    kdtree tree;
    tree = q->front->qtree;
    if(q->rear == q->front){
        //printf("deuque d'une file à un element\n");
        q->front = NULL;
        q->rear = NULL;

    }
    else{
        //printf("dequeue d'une file à plus d'un element\n");
    struct queueNode* temp = q->front->next;
    q->front->next = NULL;
    q->front = temp;

    }
    return tree;
}

void parcours_largeur(kdtree root) {
    struct queue* q = malloc(sizeof(struct queue));
    q->front = NULL;
    q->rear = NULL;
    enqueue(q, root);
    int i;
    i=0;
    while (q->front != NULL) {
        kdtree tmp;
        tmp = dequeue(q);
        printf("split= %d %d %d | selon : %d\n\n", tmp->split[0],
        tmp->split[1], tmp->split[2],tmp->axe);
       
        if (tmp->left_son != NULL){
            enqueue(q,tmp->left_son);
        }
        if (tmp->right_son != NULL){
            enqueue(q,tmp->right_son);
        }

        // Visiter les enfants gauche et droite du noeud courant
        // ...
    }

    free(q);
}
