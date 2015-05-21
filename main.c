//
//  inline.c
//  
//
//  Created by Logan Sailer on 5/21/15.
//
//

#include <stdio.h>
#include <math.h>
#include "inline.h"

extern int sqarea_( int a, int b );

int main( int argc, char * argv[ ] ) {

   // variables
   int argc_fw;

   // executable name
   printf( "%s\n", argv[ 0 ] );

   // arguments
   argc_fw = floor( log10( argc-1 ) + 1 );
   for ( int i=1; i<argc; i++) {
      printf( "  Arg %*d: %s\n", argc_fw, i, argv[ i ] );
   }

   printf( "5*8 = %d\n", sqarea_( 5, 8 ) );

   foo();



   return 0;

}