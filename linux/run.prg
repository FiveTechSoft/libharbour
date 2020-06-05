#ifdef __PLATFORM__WINDOWS
   #include "c:\harbour\include\hbdyn.ch"
#else
   #include "../../harbour/include/hbdyn.ch"
#endif

static pDLL

function Main()

   pDLL = hb_LibLoad( "./libharbour.so" )

   for n = 1 to 10 
      hb_threadStart( @Test(), hb_ntos( n ) )
   next

   hb_threadWaitForAll()

   hb_libFree( pDll )

   ? "done"
    
return nil

function Test( cFileName )

   hb_DynCall( { "Execute", pDLL, hb_bitOr( HB_DYN_CTYPE_CHAR_PTR,;
                 hb_SysCallConv() ), HB_DYN_CTYPE_CHAR_PTR }, cFileName )
return nil                   

function hb_SysCallConv()

return If( ! "Windows" $ OS(), HB_DYN_CALLCONV_CDECL, HB_DYN_CALLCONV_STDCALL )                   