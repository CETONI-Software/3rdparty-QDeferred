#ifndef qdeferred_exportH
#define qdeferred_exportH


#ifdef QDEFERRED_BUILD_LIB
#	define QDEFERRED_EXPORT Q_DECL_EXPORT
#else
#	define QDEFERRED_EXPORT Q_DECL_IMPORT
#endif


//---------------------------------------------------------------------------
#endif // qdeferred_exportH
