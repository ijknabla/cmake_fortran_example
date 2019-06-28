
#include "reynolds.h"

#include <cassert>

int main(){

  assert( reynolds(2.0f, 1.0f, 1.0f, 1.0f) == 2.0f );
  assert( reynolds(1.0f, 2.0f, 1.0f, 1.0f) == 2.0f );
  assert( reynolds(1.0f, 1.0f, 2.0f, 1.0f) == 2.0f );
  assert( reynolds(1.0f, 1.0f, 1.0f, 0.5f) == 2.0f );

  assert( reynolds(2.0d, 1.0d, 1.0d, 1.0d) == 2.0d );
  assert( reynolds(1.0d, 2.0d, 1.0d, 1.0d) == 2.0d );
  assert( reynolds(1.0d, 1.0d, 2.0d, 1.0d) == 2.0d );
  assert( reynolds(1.0d, 1.0d, 1.0d, 0.5d) == 2.0d );

  assert( reynolds(2.0f, 1.0f, 1.0f) == 2.0f );
  assert( reynolds(1.0f, 2.0f, 1.0f) == 2.0f );
  assert( reynolds(1.0f, 1.0f, 0.5f) == 2.0f );

  assert( reynolds(2.0d, 1.0d, 1.0d) == 2.0d );
  assert( reynolds(1.0d, 2.0d, 1.0d) == 2.0d );
  assert( reynolds(1.0d, 1.0d, 0.5d) == 2.0d );

}
