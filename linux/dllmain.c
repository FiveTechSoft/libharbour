#include <hbapi.h>
#include <hbvm.h>
#include <hbinit.h>

// void ProcessAttach( void ) __attribute__((constructor));
void ProcessDetach( void ) __attribute__((destructor));

static HB_BOOL s_bInit = HB_FALSE;

HB_CALL_ON_STARTUP_BEGIN( ProcessAttach )
   if( ! hb_vmIsActive() ) // hb_vmIsReady()
   {  
      hb_vmInit( HB_FALSE );
      s_bInit = HB_TRUE;
   } 
   do {
      PHB_DYNS pDynSym = hb_dynsymFind( "MAIN" );

      if( pDynSym && hb_dynsymIsFunction( pDynSym ) &&
            hb_vmRequestReenter() )
      {
         hb_vmPushDynSym( pDynSym );
         hb_vmPushNil();
         hb_vmProc( 0 );
         hb_vmRequestRestore();
      }
   } while( 0 );
HB_CALL_ON_STARTUP_END( ProcessAttach )
   
void ProcessDetach( void )
{
   PHB_DYNS pDynSym = hb_dynsymFind( "PROCESSDETACH" );

   if( pDynSym && hb_dynsymIsFunction( pDynSym ) &&
         hb_vmRequestReenter() )
   {
      hb_vmPushDynSym( pDynSym );
      hb_vmPushNil();
      hb_vmProc( 0 );
      hb_vmRequestRestore();
   }
   if( s_bInit )
   {
      hb_vmQuit();
      s_bInit = HB_FALSE;
   }   
}