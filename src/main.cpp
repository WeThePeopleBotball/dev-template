#include <iostream>

#include <kipr/wombat.h>

int main()
{
    std::cout << "Hallo scheinheiliger" << std::endl;
    fd(0);
    fd(1);
    msleep(3000);

    return 0;
}
