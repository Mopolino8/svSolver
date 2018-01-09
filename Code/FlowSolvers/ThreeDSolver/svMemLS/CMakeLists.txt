message("In memLS solver cmakelists")

message("CMAKE_Fortran_FLAGS = " ${CMAKE_Fortran_FLAGS})


# hardcoded reset of fortran flags here, this uses gnu options 
# and will almost surely create problems later 
set(CMAKE_Fortran_FLAGS "-ffixed-form -cpp -pthread")

message("CMAKE_Fortran_FLAGS = " ${CMAKE_Fortran_FLAGS})


message("SV_LIB_SVMEMLS_NAME = " ${SV_LIB_SVMEMLS_NAME})
set(SV_LIB_SVMEMLS_NAME "_MemLS")
message("after hardcoded set call - SV_LIB_SVMEMLS_NAME = " ${SV_LIB_SVMEMLS_NAME})


set(lib ${SV_LIB_SVMEMLS_NAME}${SV_MPI_NAME_EXT})

set(FSRCS ADDBCMUL.f
  BCAST.f   
  CGRAD.f   
  CPUT.f    
  FSISOLVER.f 
  GMRES.f   
  LHS.f   
  NORM.f    
  OMPLA.f   
  PRECOND.f 
  SPARMUL.f
  BC.f    
  BICGS.f   
  COMMU.f   
  DOT.f   
  GE.f    
  INCOMMU.f 
  LS.f    
  NSSOLVER.f  
  PCGMRES.f 
  SOLVE.f)

set(CSRCS HRCPUT.c)

add_library(${lib} ${SV_LIBRARY_TYPE} ${FSRCS} ${CSRCS})




# set_target_properties(${lib} PROPERTIES CMAKE_Fortran_FLAGS "-ffixed-form")
# get_target_property(CMAKE_Fortran_FLAGS ${lib} "${CMAKE_Fortran_FLAGS}")
# message("CMAKE_Fortran_FLAGS = " ${CMAKE_Fortran_FLAGS})

# this is causing problems here for some reason 
# does not like the system dylib for MPI and crashes
# check if any MPI problems later result in memLS 

#if(SV_USE_DUMMY_MPI)
#  target_link_libraries(${lib} ${SV_LIB_DUMMY_FORTRAN_MPI_NAME})
#else()
#  target_link_libraries(${lib} ${MPI_LIBRARY} ${MPI_Fortran_LIBRARIES})
#endif()

if(SV_INSTALL_LIBS)
  install(TARGETS ${lib}
    RUNTIME DESTINATION ${SV_INSTALL_RUNTIME_DIR} COMPONENT CoreExecutables
    LIBRARY DESTINATION ${SV_INSTALL_LIBRARY_DIR} COMPONENT CoreLibraries
    ARCHIVE DESTINATION ${SV_INSTALL_ARCHIVE_DIR} COMPONENT CoreLibraries
    )
endif()
if(SV_INSTALL_HEADERS)
  install(FILES ${HDRS}
    DESTINATION ${SV_INSTALL_INCLUDE_DIR}/core COMPONENT CoreHeaders
    )
endif()

# set(CMAKE_Fortran_FLAGS ${CMAKE_Fortran_FLAGS_SAVED})
# message("At exit to memLS CMAKE_Fortran_FLAGS = " ${CMAKE_Fortran_FLAGS})

