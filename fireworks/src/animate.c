#include "img.h"
#include "util.h"
#include "background.h"
#include "fireworks.h"


int main(void){
    for(int time = 0; time < 100; time++){
        img_clear();
        background(time);
        fireworks(time);
        img_write();
    }

    return 0;
}
