##=========================================================================
 #
 # Copyright (c) 2014-2015 The Regents of the University of California.
 # All Rights Reserved.
 #
 # Permission is hereby granted, free of charge, to any person obtaining
 # a copy of this software and associated documentation files (the
 # "Software"), to deal in the Software without restriction, including
 # without limitation the rights to use, copy, modify, merge, publish,
 # distribute, sublicense, and/or sell copies of the Software, and to
 # permit persons to whom the Software is furnished to do so, subject
 # to the following conditions:
 #
 # The above copyright notice and this permission notice shall be included
 # in all copies or substantial portions of the Software.
 #
 # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 # IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 # TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 # PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 # OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 # PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 # PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 # LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 #
 #=========================================================================#

#if(MSVC)
#  string(REGEX REPLACE "STACK:10000000,10000000" "STACK:512000000,512000000" CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")
#endif()

message("CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES = " ${CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES})
#unset(CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES)
message("CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES = " ${CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES})

message("CMAKE_EXE_LINKER_FLAGS = " ${CMAKE_EXE_LINKER_FLAGS})

# executable variable is named
# SV_SVFSI_EXE

set(FSRCS ring_mpi.f)
#set(CSRCS hello_mpi.c)

simvascular_add_executable(${SV_SVFSI_EXE}
  #SRCS ${CSRCS}
  SRCS ${FSRCS}
  DEV_SCRIPT_NAME "mysvfsi"
  INSTALL_SCRIPT_NAME "svfsi"
  INSTALL_COMP CoreExecutables
  INSTALL_DESTINATION ${SV_INSTALL_RUNTIME_DIR})

# hardcoded to include MPI here, so MPI is required until updated
target_link_libraries(${SV_SVFSI_EXE}
  ${GLOBAL_LIBRARIES}
  ${INTELRUNTIME_LIBRARIES}
  ${ZLIB_LIBRARY}
  ${SV_MPI_EXTRA_LIBRARY}
  ${SV_MPI_Fortran_LIBRARIES}
  )

